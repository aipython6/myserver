const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const cors = require('cors')
const token = require('./utils/signAndverifyToken')
const statusCode = require('./utils/statusCode')
const corsConfig = require('./utils/corsConfig')
// const { createProxyMiddleware } = require('http-proxy-middleware')

const indexRouter = require('./routes/index');
const authRouter = require('./routes/auth/auth')
const userRouter = require('./routes/user/user')
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

app.use((req, res, next) => {
  const url = req.url
  // 不需要token验证的请求
  const whiteList = ['/auth/login', '/auth/code']
  if (whiteList.includes(url)) {
    return next()
  }
  // 获取请求头的token
  const t = req.headers.Authorization
  const { username } = req.body
  if (!(token(t, username))) {
    res.json({ code: statusCode.NotToken, msg: 'token验证失败' })
  } else {
    return next()
  }
})

app.use('/', indexRouter);
app.use('/auth', authRouter)
app.use('/user/user', userRouter)
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
