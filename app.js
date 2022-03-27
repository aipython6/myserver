const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors')
const token = require('./utils/signAndverifyToken')
const statusCode = require('./utils/statusCode')
const corsConfig = require('./utils/corsConfig')
const handleDate = require('./utils/handleDate')
const logService = require('./system/service/logService')
// const { createProxyMiddleware } = require('http-proxy-middleware')

const authRouter = require('./routes/auth/auth')
const userRouter = require('./routes/user/user')
const menusRouter = require('./routes/menus/menus')
const deptRouter = require('./routes/dept/dept')
const roleRouter = require('./routes/role/role')
const jobRouter = require('./routes/job/job')
const dictRouter = require('./routes/dict/dict')
const logRouter = require('./routes/log/log')
const dataRouter = require('./routes/data/data')
const app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

// app.use('/api', createProxyMiddleware({ target: 'http://localhost:3001', changeOrigin: true }))
app.use(cors(corsConfig.getCorsOptions()))
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(async (req, res, next) => {
  const url = req.url
  // 不需要token验证的请求
  const whiteList = ['/auth/login', '/auth/code']
  if (whiteList.includes(url)) {
    return next()
  } else {
    const logservice = new logService()
    const insert_item = {
      req_username: req.headers.username,
      req_url: req.url,
      origin: req.ip,
      browser: req.headers['sec-ch-ua'],
      user_agent: req.headers['user-agent'],
      create_time: handleDate(new Date())
    }
    // await logservice.addLog(insert_item)
    // 获取请求头的token
    const t = req.headers.authorization
    // req.query为GET或DELETE请求，否则为POST或PUT请求
    // const { username } = url.indexOf('?') !== -1 ? req.query : req.body
    const username = req.headers.username
    try {
      if (!(await token.verify(t, username))) {
        res.json({ code: statusCode.tokenVerifyError, msg: 'token验证失败' })
      } else {
        return next()
      }
    } catch (err) {
      const error = Object.assign({}, err, { status: statusCode.tokenExpiredError })
      res.status(statusCode.tokenExpiredError).json(error)
        // throw new TokenExpiredError({ status: statusCode.tokenExpireError })
    }
  }
})

app.use('/auth', authRouter)
app.use('/api/users', userRouter)
app.use('/api/menus', menusRouter)
app.use('/api/dept', deptRouter)
app.use('/api/roles', roleRouter)
app.use('/api/job', jobRouter)
app.use('/api/dictDetail', dictRouter)
app.use('/api/logs', logRouter)
app.use('/api/data', dataRouter)
// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
