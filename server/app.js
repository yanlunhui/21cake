//引入第三方模块
const express=require('express')
const cors=require("cors");
const session=require("express-session")
//创建服务器
var server=express();
//解决服务器跨域
server.use(cors({
	//访问服务器的路径
	origin:["http://127.0.0.1:8080","http://localhost:8080","http://127.0.0.1:5500"],
  //资格证书
	credentials:true
}))
//session,保存浏览器这次会话的  //保存：req.session.uid = result[0].uid   
// 用的时候： var uid=req.session.uid
server.use(session({
	//保存形式
	secret:"128位字符串",  
	resave:true,
	saveUninitialized:true
}))
//设置端口
server.listen(3000);
//引入路由器
const select=require('./routes/select.js')
const user=require('./routes/user.js')
//托管静态资源
server.use(express.static('public'))
//为了将post请求的数据转为对象 需引入body-parser模块
const bodyParser=require('body-parser')
//不使用qs提供的方法将数据转为对象 而使用核心模块
server.use(bodyParser.urlencoded({
	extended:false
}));
//挂载路由器到user下
server.use('/select',select )
server.use('/user',user )
///////////////////////////////////

