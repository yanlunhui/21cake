<template>
    <div class="content">
        <div class="content-box">
            <!-- 账号密码登陆 -->
            <div class="form-login">
                <h2> 
                    <span class="span1" @click="unameLogin" id="s1">账号密码登陆</span>
                    <span>|</span>
                    <span class="text-color" @click="telLogin" id="s2">手机验证码登陆</span>
                </h2>
                    <form action="/login" method="get" class="" id="form1">
                        <ul>
                            <li>
                                <input type="text" name="uname" @blur="cNumber" placeholder="请输入您的账号" class="phone" v-model="telNumber">
                            </li>
                            <li>
                                <input type="password" name="upwd" placeholder="输入密码" class="c_pwd" v-model="cPwd" @blur="cPassword">
                            </li>
                            <li class="err-msg" v-text=errMsg></li>
                            <li>
                                <input type="submit" value="登陆" @click="login">
                            </li>
                        </ul>
                        <div class=login-remember>
                            <label for="remember">
                                <input type="checkbox" checked id="remember">
                                <span>记住账号</span>    
                            </label>
                            <div>
                                <a href="">忘记密码</a>
                                <a href="">去注册</a>
                            </div>  
                        </div>
                    </form>
                     <!-- 手机验证码登陆 -->
                    <form action="/Login1" id="form2" class="fade" method="get">
                        <ul>
                            <li>
                                <input type="text" placeholder="请输入您的手机号"  class="phone2" name="phone" v-model="telNumber1" @blur="cTelNumber1">
                            </li>
                            <li>
                                <input type="text" placeholder="请输入图片字符" v-model="img_code">
                                <canvas id="c3" width="116" height="38" ></canvas>
                                <a href="javascript:;" @click="code"></a>
                                <div></div>
                            </li>
                            <li>
                                <input type="text" placeholder="短信验证码" v-model="msgCode">
                                <a href="javascript:;" @click="get_code">获取验证码</a>
                            </li>

                            <li v-text=errMsg1></li>
                            
                            <li>
                                <input type="submit" value="登陆" class="login-button" @click="login1">
                            </li>
                        </ul>
                        <div class=login-remember>
                            <label for="remember1">
                                <input type="checkbox" checked id="remember1">
                                <span>记住账号</span>    
                            </label>
                            <div>
                                <a href="">忘记密码</a>
                                <a href="">去注册</a>
                            </div>  
                        </div>
                    </form>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            telNumber:"",
            telNumber1:"",
            errMsg:"",
            errMsg1:"",
            cPwd:"",
            save_code:"",
            str:"",
            img_code:"",
            msgCode:""
        }
    },
    methods:{
        //当点击短信登陆，为账号密码登陆的form表单加class=fade
        //把短信登陆的form表单的class="";
        //用户名登陆和手机号登陆切换
        telLogin(){
            var form2=document.getElementById("form2");
            var s2=document.getElementById("s2");
            var formLogin=document.getElementsByClassName("form-login")[0];
            formLogin.style.height="405px"
            s2.className=""
            s1.className="text-color"
            form2.className="";
            form1.className="fade";
        },
        unameLogin(){
            var form1=document.getElementById("form1");
            var s1=document.getElementById("s1");
            var formLogin=document.getElementsByClassName("form-login")[0];
            formLogin.style.height="357px"
            s1.className=""
            s2.className="text-color"
            form1.className="";
            form2.className="fade";
        },
        // 验证账号格式
        cNumber(){
            var reg=/^[1][3-9]\d{9}$/
            var phone=document.getElementsByClassName("phone")[0];
            if(reg.test(this.telNumber)){
                this.errMsg=""
            }else{
                this.errMsg="账号格式不正确"
            }
        },
        // 验证密码格式
        cPassword(){
            var reg=/^\w{6,18}$/
            var cpwd=document.getElementsByClassName("c_pwd")[0];
            if(reg.test(this.cPwd)){
                this.errMsg=""
            }else{
                this.errMsg="密码格式不正确"
            }
        },
        // 验证手机号码格式
        cTelNumber1(){
            var reg=/^[1][3-9]\d{9}$/;
            if(reg.test(this.telNumber1)){
                this.errMsg1=""
            }else{
                this.errMsg1="手机号码格式不正确"
            }
        },
        // 动态生成图片验证码
        code(e){
            // e.preventDefault();
            var list=["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",1,2,3,4,5,6,7,8,9,0]
            var c3=document.getElementById("c3");
            var ctx=c3.getContext("2d");
            ctx.clearRect(0,0,116,38);
            var x3=0;
            this.str="";
            for(var i=0;i<5;i++){
                // --------线条随机位置---------------------------------------
                var x1=parseInt(Math.random()*40)+1
                var x2=parseInt(Math.random()*40)+97
                var y1=parseInt(Math.random()*37)+1
                var y2=parseInt(Math.random()*37)+1
                var a=parseInt(Math.random()*7)+3
                // -------线条的随机颜色----------------------------------------
                var r=parseInt(Math.random()*255)
                var g=parseInt(Math.random()*255)
                var b=parseInt(Math.random()*255)
                var rgb=(r,g,b)
                // -----------------------------------------------
                ctx.beginPath();    //开始一条新路径(上一条路径结束)
                ctx.moveTo(x1,y1);    //移动到指定点
                ctx.lineTo(x2,y2);     //从当前点到指定点画一条直线
                ctx.lineWidth="2"
                ctx.strokeStyle=`rgb(${r},${g},${b},${a/10})`
                ctx.stroke(); 
                // -------------------------------------------------
                x3+=parseInt(Math.random()*10)+15//字体y轴位置随机
                var y3=parseInt(Math.random()*8)+8 //字体x轴位置随机
                var r1=parseInt(Math.random()*62); //取随机字母或者数字
                var text_weight=parseInt(Math.random()*5)+15+"px"
                var str1=list[r1];
                this.str+=str1;
                ctx.fillStyle=`rgb(${r},${g},${b})`
                ctx.textBaseline="top"
                ctx.font = `${text_weight} '微软雅黑'`;
                ctx.fillText(str1,x3,y3)
            }
            console.log(this.str)
        },
        // 账号登陆 登陆验证ajax
        login(e){
            e.preventDefault();
            if(this.errMsg){
            this.errMsg="请检查用户名或密码格式是否正确"
            }else if(this.telNumber==""||this.upwd==""){
                this.errMsg="用户名或密码不能为空"
            }else{
                console.log(this.telNumber)
                var url="http://127.0.0.1:3000/user/login"
                this.axios.get(url,{
			        params:{
                        phone:this.telNumber,
                        upwd:this.cPwd
			        }
		        }).then( result=> {
                    console.log(result.data);
                    if(result.data.code==400){
                        this.errMsg="用户名或密码错误"
                    }else{
                        location.href=" http://127.0.0.1:8080/"
                        console.log("跳转页面")
                    }
                })
            }
        },
        // 获取验证码 保存随机验证码
        get_code(){
            if(this.img_code==this.str){
                var url="http://127.0.0.1:3000/user/getCode"
                this.axios.get(url,{
                params:{
                    phone:this.telNumber1
                }}).then(result=>{
                    this.save_code=result.data.data;
                    console.log(this.save_code);
                })
            }else{
                this.errMsg1="图片验证码输入错误"
            }
        },
        // 手机验证码登陆
        login1(e){
            e.preventDefault();
            if(this.msgCode==this.save_code&&this.msgCode!=""){
                console.log("登陆成功 跳转到首页")
            }else{
                this.errMsg1="手机号或验证码错误"
            }
        }
    },
    mounted(){
        this.code()//页面加载完后，加载一次二维码图片
    }

}
</script>
<style scoped>
    body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend,input, button, textarea, p, blockquote, th, td {
        margin: 0;
        padding: 0;
    }
    a{
        text-decoration-line: none;
    }
    .content{
        background: url(/img/passport-banner.jpg) no-repeat top center;
        font-family: 'PingFang SC','Heiti SC','微软雅黑',Helvetica,Arial;
        font-size: 12px;
    }
    .content-box{
        width: 1059px;
        height: 873px;
        margin: 0 auto;
        position: relative;
    }
    .form-login{
    width: 388px;
    height: 357px;
    position: absolute;
    top: 114px;
    right: 0;
    padding: 28px 42px;
    border: 1px #E9E9E9 solid;
    background: #fff;
    text-align: center;
    box-sizing: border-box;
    padding: 28px 41px;
    }
    h2{
        display: inline;
        font-weight: normal;
    }
    h2>a{
        /* color: #c9c9c9; */
        color: #482618;
        font-size: 20px;
    }
    h2>span:nth-child(2){
        color: #482618;
        font-size: 20px;
        font-weight: normal;
        margin-left: 15px;
        margin-right:15px;
    }
    ul>li{
        list-style: none; 
    }
    #form1 li>input{
    width: 290px;
    padding: 0 5px;
    height: 36px;
    border: 1px solid #efefef;
    border-radius: 2px;
    outline: none;
    color: #442818;
    line-height: 38px;
    }
    #form1 ul>li:nth-child(3){
    position: static;
    height: 22px;
    }
    #form1 ul>li:nth-child(1){
        padding-top: 15px;
    }
    #form1 ul>li:nth-child(2){
        padding-top: 15px;
    }
    #form1 ul>li:nth-child(3){
        position: static;
        height: 22px;
        margin: 10px 0;
    }
    #form1 ul>li:nth-child(4)>input{
        display: block;
        background: #442818;
        border-radius: 2px;
        height: 48px;
        width: 302px;
        line-height: 48px;
        text-align: center;
        font-size: 18px;
        border: 0;
        cursor: pointer;
        color: #fff;
    }  
    .login-remember{
        margin-top: 15px;
        display: flex;
        justify-content: space-between;
    }
    .login-remember>div>a{
        font-size: 12px;
        color: #442818;
        margin-left: 15px;
    }  
    label{
        display: block;
        float: left;
        cursor: pointer;
    }
    label>span{
        font-size: 12px;
    }
    .text-color{
        color: #c9c9c9;
    }
    div>h2>span:nth-child(1),div>h2>span:nth-child(3){
        cursor: pointer;
    }
    .fade{
        display: none;
    }
    #form2 li input{
        width: 290px;
        padding: 0 5px;
        height: 36px;
        border: 1px solid #efefef;
        border-radius: 2px;
        outline: none;
        color: #442818;
        line-height: 38px;
    }
    #form2 li:nth-child(2)>input,#form2 li:nth-child(3)>input{
        float: left;
        width: 128px;
        padding: 0 5px;
        height: 36px;
        border: 1px solid #efefef;
        border-radius: 2px;
        outline: none;
        color: #442818;
        line-height: 38px;
    }
    #form2 li:nth-child(1){
        margin-top: 15px;
    }
    #form2 li:nth-child(2){
        margin: 15px 0;
    }
    #form2 li:nth-child(2) div{
        clear: both;
    }
    #form2 li:nth-child(3)>a{
        display: block;
        width: 149px;
        height: 36px;
        line-height: 36px;
        text-align: center;
        float: right;
        cursor: pointer;
        background: #FAFAFA;
        border: 1px solid #EBEBEB;
        border-radius: 2px;
        color: #442818;
    }
    #form2 li:nth-child(3){
        clear: both;
    }
    #form2 input.login-button{
        display: block;
        background: #442818;
        border-radius: 2px;
        height: 48px;
        width: 302px;
        line-height: 48px;
        text-align: center;
        font-size: 18px;
        color: #fff;
        border: 0;
        cursor: pointer;
    }
     #form2 li:nth-child(3){
         margin-bottom: 63px;
     }
    #form2 li:nth-child(4){
        position: static;
    height: 22px;
    margin: 10px 0;
    }
    .err-msg{
        text-align: left;
        color: red;
    }
    #form2 ul>li:nth-child(4){
        text-align: left;
        color: red;
    }
    canvas{
    background-color: #ddd;
    vertical-align: middle;
    margin-left: 10px;
    float: left;
    }
    canvas+a{
        display: inline-block;
        width: 26px;
        height: 22px;
        cursor: pointer;
        background-image: url(/img/icon.png);
        background-position: -15px -41px;
        background-size: 310px 120px;
        float:right;
        margin-top: 8px;
    }
</style>
