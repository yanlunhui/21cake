<template>
    <div class="content">
        <div class="content-box">
            <div class="form-login">
                <form action="/Reg" method="get">
                    <h2>用户注册</h2>
                    <ul>
                        <li><input type="text" placeholder="输入手机号码" name="uname" @blur="cTelNumber1" v-model="telNumber1"></li>
                        <li><input type="password" placeholder="密码：请输入8~20字符,需同时包含英文和数字" name="upwd" class="c_pwd" @blur="cPassword" v-model="cPwd"></li>
                        <li><input type="password" placeholder="确认密码" name="rupwd" @blur="rCpwd" v-model="cPwd1"></li>
                        <li>
                            <input type="text" placeholder="请输入图片字符" name="img-char" class="" v-model="img_code">
                             <canvas id="c3" width="116" height="38" @click="code"></canvas>
                              <a href="javascript:;" @click="code"></a>
                        </li>
                        <li>
                            <input type="text" placeholder="短信验证码" name="v-code" v-model="msg_code">
                            <a href="javascript:;" @click="get_code">获取验证码</a>
                        </li>
                        <li><input type="date" placeholder="请选择生日" name="birthday" v-model="date"></li>
                        <li class="err-text" v-text="errMsg1"></li>
                        <li><input type="submit" value="注册" class="register" @click="btn_reg"></li>
                    </ul>
                    <div>
                        <label for="agree">
                            <input type="checkbox" checked id="agree">
                            已阅读并同意 
                        </label>
                        <a href="">21客会员协议</a>和<a href="">隐私保护政策</a> 
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
            str:"",
            errMsg1:"",
            telNumber1:"",
            cPwd:"",
            cPwd1:"",
            str:"",
            img_code:"",
            save_code:"",
            msg_code:"",
            date:""
        }
    },
    methods:{
        code(){
            
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
            console.log("图片验证码为:"+this.str)
        },
        // 验证手机号码格式 数据库中是否存在
        cTelNumber1(){
            var reg=/^[1][3-9]\d{9}$/;
            if(reg.test(this.telNumber1)){
                this.errMsg1="";
                var url="http://127.0.0.1:3000/user/verify";
                this.axios(url,{
                    params:{
                        phone:this.telNumber1
                    }
                }).then(result=>{
                    var code=result.data.code;
                    if(code==400){
                        this.errMsg1="该账号已被注册"
                    }
                })
            }else{
                this.errMsg1="手机号码格式不正确"
            }
        },
        // 获取短信验证码 图片验证码是否正确 是否为空
        get_code(e){
            if(this.img_code==this.str&&this.telNumber1!=""){
                var url="http://127.0.0.1:3000/user/reg_getCode"
                this.axios.get(url,{
                params:{
                    phone:this.telNumber1
                }}).then(result=>{
                    this.save_code=result.data.data;
                    console.log("您的短信验证码为:"+this.save_code+",验证码五分钟内有效");
                })
            }else if(this.img_code!=this.str){
                if(this.img_code==""){
                    this.errMsg1="图片验证码不能为空"
                }else{
                    this.errMsg1="图片验证码输入错误"
                }
                console.log(this.img_code,this.str)
            }else {
                this.errMsg1="手机号或密码格式错误"
            }
        },
        cPassword(){
            var reg=/^\w{6,18}$/
            var cpwd=document.getElementsByClassName("c_pwd")[0];
            if(reg.test(this.cPwd)){
                this.errMsg1=""
            }else{
                this.errMsg1="密码格式不正确"
            }
        },
        rCpwd(){
            if(this.cPwd!=this.cPwd1){
                this.errMsg1="密码不一致"
            }
        },
        btn_reg(e){
            e.preventDefault();
            console.log(this.telNumber1+":"+this.cPwd+":"+this.date)
            if(this.msg_code==this.save_code&&this.date!=""){
                this.errMsg1=""
                var url="http://127.0.0.1:3000/user/reg";
                this.axios(url,{
                    params:{
                        phone:this.telNumber1,
                        upwd:this.cPwd,
                        birthday:this.date
                    }
                }).then(result=>{
                    console.log(result);
                    if(result.data.code==200) location.href="http://127.0.0.1:8080/#/login"
                })
            }else{
                this.errMsg1="生日未填写"
            }
        }
    },
    mounted(){
        this.code()
    }

}
</script>
<style scoped>
    body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, button, textarea, p, blockquote, th, td {
    margin: 0;
    padding: 0;
    }
    a{
        text-decoration-line: none;
    }
    .content{
        background: url(/img/passport-banner.jpg) no-repeat top center;
        font-size:12px;
    }
    .content-box{
        width: 1200px;
        height: 1120px;
        margin: 0 auto;
        position: relative;
    }
    .form-login{
        width: 388px;
        height: 549px;
        position: absolute;
        border: 1px #E9E9E9 solid;
        right: 0;
        top:114px;
        padding: 28px 42px;
        box-sizing: border-box;

    }
    ul{
        list-style: none;
    }
    h2{
        width: 100%;
        text-align: center;
        color: #482618;
        line-height: 25px;
        font-size: 18px;
        font-weight: normal;
    }
    ul>li input {
    width: 290px;
    padding: 0 5px;
    height: 36px;
    border: 1px solid #efefef;
    border-radius: 2px;
    outline: none;
    color: #442818;
    line-height: 38px;
    }
    ul>li{
        margin-top: 10px;
    }
    .register{
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
    ul>li:nth-child(4)>input,ul>li:nth-child(5)>input{
        width: 128px;
    }
    ul>li:nth-child(5)>a{
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
    li>span{
    line-height: 22px;
    color: #FF714D;
    }
    form div{
    margin-top: 15px;
    height: 18px;
    line-height: 18px;
    padding-bottom: 40px;
    color: #744F3A;
    font-family: 'PingFang SC','Heiti SC','微软雅黑',Helvetica,Arial;
    }
    ul>li:nth-child(4)>img{
    vertical-align: middle;
    margin-left: 10px
    }
    label{
    cursor: pointer;
    line-height: 18px;
    color: #744F3A;
    }
    form div>a{
    color: #2a99fa;
    }
    .err-text{
        color: red;
        line-height: 22px;
        margin: 10px 0;
        height: 22px;
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
    canvas{
    background-color: #ddd;
    vertical-align: middle;
    margin-left: 10px
    }
</style>
