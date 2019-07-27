//示例
//引入第三方模块
const express=require('express');
//创建路由器
var router=express.Router();
//引入连接数据库的连接池
var pool=require('../pool.js')
//创建用户添加路由(注册)
router.post('/add',(req,res)=>{
	var obj=req.body,n=400	
		for(var key in obj){
		 n++
			if(!obj[key]){
				res.send({code:n,msg:key+' null'})
				return;
			}
		}
		pool.query('INSERT INTO user SET ?',[obj],(err,result)=>{
			if(err)throw err
			if(result.affectedRows>0)
			{res.send({code:200,msg:'add suc'})}
			else{res.send({code:400,msg:'add err'})}
			
		});
});
//创建用户注册时用户名查重路由
router.post('/select-user',(req,res)=>{
	var obj=req.body
	if (!obj.uname)
	{ res.send({code:400,msg:'uname null'})
		return}
	pool.query('select * from user where uname=?',[obj.uname],(err,result)=>{
		if (result.length>0)
		{res.send({code:200,msg:'suc'})
		}else{res.send({code:400,msg:'err'})};
	});
});
//创建用户电话查询路由
router.post('/select-phone',(req,res)=>{
	var obj=req.body
		if (!obj.phone)
		{res.send({code:400,msg:'phone null'})
		return
		}
	var sql='select * from user where phone=?'
	pool.query(sql,[obj.phone],(err,result)=>{
		if(err)throw err
		if (result.length>0)
		{res.send({code:200,msg:'suc'})
		}else{
			res.send({code:400,msg:'null'})
		};
	})
});
//创建用户登录路由
router.get('/login',(req,res)=>{
	var phone=req.query.phone;
	var upwd=req.query.upwd;
	console.log(phone,upwd)
	if (!phone)
	{ res.send({code:400,msg:'uname null'})
		return
	 }if(!upwd){
		res.send({code:401,msg:'upwd null'})
		return
	 }
	var sql='select * from user where phone=? and upwd=?'
	pool.query(sql,[phone,upwd],(err,result)=>{
		if(err) throw err;
		if(result.length>0){
		//保存此次会话中用户的uid
		req.session.phone = result[0].phone;
		req.session.islogin=true;
			res.send({code:200,msg:'login suc '});

		}else{
			res.send({code:400,msg:'login err '});
		}
	})
});
router.get('/getCode',(req,res)=>{
	var phone=req.query.phone;
	sql="INSERT  INTO  user  VALUES(null,null,?,null,null);"
	pool.query(sql,phone,(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			var code="";
			for(var i=0;i<5;i++){
			code+=parseInt(Math.random()*10);
			}
			console.log(code);
			res.send({data:code});
		}
	})
})
// 注册短信验证码获取
router.get('/reg_getCode',(req,res)=>{
	var code="";
	for(var i=0;i<5;i++){
		code+=parseInt(Math.random()*10);
	}
	res.send({data:code});
})
// 注册号码验证是否存在
router.get('/verify',(req,res)=>{
	var phone=req.query.phone;
	var sql="SELECT * FROM user WHERE phone=?";
	pool.query(sql,phone,(err,result)=>{
		if(err) throw err;
		if(result.length>0){
			res.send({code:400,msg:"该手机号已注册 请更换其它号码"})
		}else{
			res.send({code:200,msg:"该手机号可以使用"})
		}
	})
})
router.get('/reg',(req,res)=>{
	var phone=req.query.phone;
	var upwd=req.query.upwd;
	var birthday=req.query.birthday;
	// 判断格式是否正确
	// --------------
	// ---------------
	sql="INSERT  INTO  user  VALUES(null,?,?,?,?);"
	pool.query(sql,[upwd,phone,phone,birthday],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send({code:200,msg:"注册成功"})
		}
	})
})
// 验证是否登录
router.get('/is_login',(req,res)=>{
	if(req.session.islogin){
		res.send({data:req.session.phone})
	}else{
		res.send({data:"登录"})
	}
})
// 销毁session
router.get('/destroy',(req,res)=>{
	req.session.destroy()
})
// 测试、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、
module.exports=router




