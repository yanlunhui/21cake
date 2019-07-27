
//示例
//引入第三方模块
const express=require('express');
//创建路由器
var router=express.Router();
//引入连接数据库的连接池
var pool=require('../pool.js')
//测试、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、、
// 不需要传参的主页数据
router.get('/',(req,res)=>{
	// console.log(11111)	 
	var imgs=[]
		pool.query(`select * from limg`,[],(err,result)=>{
			if (err) throw err
			imgs=result	
			console.log(imgs)
			res.send(result)
			})
});
// 传入参数为商品标签 label ex：新品 儿童.....
router.get('/label',(req,res)=>{
	// console.log(11111)	 
	var lid=req.query.lid
	if(lid!=undefined){
		pool.query(`select lname from label where lid=?`,[lid],(err,result)=>{
			if (err) throw err
			res.send(result)	
			})
		}else{
			res.send({code:400,msg:"未查询到结果"})
		}
});
// 、、、、、、、、、、、、
// router.get('/la',(req,res)=>{
// 	// console.log(11111)	 	
// 		pool.query(`select * from label `,[],(err,result)=>{
// 			if (err) throw err
// 			res.send(result)
// 			// console.log(result)	
// 			})
// });
// 根据类型查询图片 新品 儿童 的图片
router.get('/limg',(req,res)=>{
	var lid=req.query.lid
	var obj={
		pics:[],
		details:[],
		price:[],
		lgname:[]
	}
	if(lid!=undefined){
		var sql=`select img1,img2 from limg where lid=?`
		pool.query(sql,[lid],(err,result)=>{
			if (err) throw err
			obj.pics=result
			var sql1=`select cid,title,subtitle,lid from commodity_details where lid=?`
			pool.query(sql1,[lid],(err,result)=>{
				if (err) throw err
					obj.details=result
					var str=""
					for(var i=0;i<result.length;i++){
						str+=result[i].cid+','
					}
					str=str.substr(0,str.length-1)
					// console.log(str)
					var sql2=`select price from weight_details where cid in(${str}) and wid=1`
					pool.query(sql2,[],(err,result)=>{
						if(err) throw err
						obj.price=result
						pool.query("select lname from label where lid=?",[lid],(err,result)=>{
							if(err) throw err
							// console.log(result)
							obj.lgname=result
							res.send(obj)
						})						
					})	
				})				
			})
		}else{
			res.send({code:400,msg:"未查询到结果"})
		}
});
// 所属分类 ex ：蛋糕 冰淇淋......
router.get('/family',(req,res)=>{
	var fid=req.query.family
	if(lid!=undefined){
		pool.query(`select lname from family where fid=?`,[fid],(err,result)=>{
			if (err) throw err
			res.send(result)	
			})
		}else{
			res.send({code:400,msg:"未查询到结果"})
		}
});
// 所属口味 ex ：口味：乳脂奶油 慕斯 乳酪
router.get('/taste',(req,res)=>{
	var tid=req.query.tid
	if(tid!=undefined){
		pool.query(`select taste from family where tid=?`,[tid],(err,result)=>{
			if (err) throw err
			res.send(result)	
			})
		}else{
			res.send({code:400,msg:"未查询到结果"})
		}
});
// 根据重量查询  
router.get('/weight',(req,res)=>{
	// console.log(11111)	 
	var wid=req.query.wid
	if(wid!=undefined){
		pool.query(`select lname from weight where wid=?`,[wid],(err,result)=>{
			if (err) throw err
			res.send(result)	
			})
		}else{
			res.send({code:400,msg:"未查询到结果"})
		}
});
//导出路由器
// 传入参数为 商品唯一  cid
router.get("/details",(req,res)=>{
	var obj={
		product:{},
		detasils:[],
		pics:[]
	}
	var cid=req.query.cid
	if(cid!==undefined){
		var sql=`select title,subtitle,exist,sweet,details from commodity_details where lid=?`
		pool.query(sql,[cid],(err,result)=>{
			if(err)throw err
			obj.product=result[0]
			//console.log(obj)
			var sql2=`select wid,price,sixe,unumber,laid,time from weight_details where cid=?`
			pool.query(sql2,[cid],(err,result)=>{
				if(err)throw err
				obj.detasils=result
			//	console.log(obj)
			var sql3=`select wdid,sm,md,lg,w_img from pic where cid=?`
				pool.query(sql3,[cid],(err,result)=>{
					if (err) throw err
					obj.pics=result;
					res.send(obj)
				})
			})
		})
  }else{res.send({code:400,msg:"未查询到结果"})}
})
module.exports=router


