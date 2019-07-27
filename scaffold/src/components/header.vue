<template>
  <div id="header">
    <div>
      <!-- 头部左边 -->
      <ul>
        <li><a href=""><img src="img/logo.png"></a></li>
        <li><a href="http://127.0.0.1:8080/#/">首页</a></li>
        <li><a href="">蛋糕</a></li>
        <li><a href="">面包</a></li>
        <li><a href="">冰淇淋</a></li>
        <li><a href="">咖啡下午茶</a></li>
        <li><a href="">咖啡全国送</a></li>
        <li><a href="">企业专区</a></li>
      </ul>
      <!-- 头部右边 -->
      <div class="header-right">
        <ul>
          <li>
            <a href="#">APP下载</a>
            <div class="left1">
                <img src="img/erweima.png" alt="">
                <p class="font-size">下载享更多优惠</p>
            </div>
          </li>
          <li>
            <a href="#">重庆<img src="img/down.png" alt=""></a>
            <div class="left2">
              <p><a href="#" class="font-color">北京</a></p>
              <p><a href="#" class="font-color">上海</a></p>
              <p><a href="#" class="font-color">天津</a></p>
              <p><a href="#" class="font-color">杭州</a></p>
              <p><a href="#" class="font-color">无锡</a></p>
              <p><a href="#" class="font-color">苏州</a></p>
              <p><a href="#" class="font-color">深圳</a></p>
            </div>
          </li>
          <li>
            <a href="#">消息</a>
            <div class="left3">
              <a href="#" class="font-color">通知</a>
              <a href="#" class="font-color">物流</a>
            </div>
          </li>
          <li class="aa">
            <a :href="loginOrPhone==='登录'?'http://127.0.0.1:8080/#/login':'javascript:;'" ><span v-text=loginOrPhone></span></a>/<a   :href="regOrLogout==='注册'?'http://127.0.0.1:8080/#/reg':'http://127.0.0.1:8080/'" @click="regAndLogout"><span v-text=regOrLogout ></span></a>
          </li>
          <li>
            <a href="http://127.0.0.1:8080/#/cart" ><img src="img/cart.png" class="icong" alt=""></a>
          </li>
        </ul>
        
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return{
      loginOrPhone:"登录",
      regOrLogout:"注册"
    }
  },
  methods:{
    is_login(){
      var url="http://127.0.0.1:3000/user/is_login"
      this.axios(url,{
        params:{}
      }).then(result=>{
        this.loginOrPhone=result.data.data;
        if(this.loginOrPhone!="登录"){
          this.regOrLogout="注销"
        }
      })
    },
    regAndLogout(e){
      if(this.regOrLogout==="注销"){
        var url="http://127.0.0.1:3000/user/destroy"
        this.axios(url,{}).then(result=>{
        })
      }
    }
  },
  mounted(){
    this.is_login()
  }
}
</script>

<style scpoed>
.aa{
  position: absolute;
    right: -65px;
}
  body,p,ul,li{margin:0;padding:0}
  #header{
    width: 100%;height: 80px;
    background: #fff;
    z-index: 100;
    position:fixed;
    box-shadow: 0 2px 2px 0 rgba(195,195,195,0.50);
  }
   .icong{
    position: absolute;
    top: 28px;
    right: -100px;
    color:#BB9772;
  }
  a{
    text-decoration:none;
  }
  a:hover{
    color:#BB9772
  }
  .font-size{
    font-size:14px;
    color:#684029;
  }
  .font-color{
    color:#BB9772
  }
  #header>div{
    width: 1200px;
       margin: 0 auto
  }
  ul li{
    list-style:none;
  }
  #header>div>ul li{
    list-style:none;
    float:left;
    margin:0 15px;
  }
  ul li a{
    text-decoration:none;
    font-size:14px;
    color:#684029;
    line-height: 80px
  }
  #header>div>ul>li>a>img{
    width: 120px;
    height: 40px;
    margin-top:18px
  }
  .header-right{
    position:relative;
    left:137px;
  }
  .header-right>ul li{
    float: left;
    margin:0 15px;
  }
  .header-right .left1>img{
    width: 100px;height: 100px;
    padding-top:5px;
    padding-left:9px;
  }
  .header-right .left1>p{
    padding-left:9px;
  }
  .left1{
    width: 120px;height: 0px;
    position: relative;
    top: -20px;
    left: -29px;
    overflow: hidden;
    transition:.5s all;
    box-shadow: 0px 0px 5px 0px;
    z-index:10;
    background: #fff;
  }
  .header-right>ul>li:first-child:hover .left1{
    height: 130px;
  }

  .left2{
    width: 110px;height: 0px;
    position: relative;
    top: -20px;
    left: -38px;
    overflow: hidden;
    transition:.5s all;
    box-shadow: 0px 0px 5px 0px;
    z-index:100;
    background: #fff;
  }
  .header-right>ul li:nth-child(2):hover .left2{
    height: 200px;
  }
  .left2 p{
    position:absolute;
  }
  .left2 p:first-child{
    top:-5px;
    left:40px;
  }
  .left2 p:nth-child(2){
    top:16px;
    left:40px;
  }
  .left2 p:nth-child(3){
    top:37px;
    left:40px;
  }
  .left2 p:nth-child(4){
    top:58px;
    left:40px;
  }
  .left2 p:nth-child(5){
    top:79px;
    left:40px;
  }
  .left2 p:nth-child(6){
    top:100px;
    left:40px;
  }
  .left2 p:nth-child(7){
    top:121px;
    left:40px;
  }
  .left2 p a:hover{
    color:#684029
  }
  .left3{
    position:absolute;
    top: 60px;
    left: 948px;
    width: 105px;height: 0px;
    overflow: hidden;
    z-index: 100;
    background: #fff;
    transition: 0.5s all;
    box-shadow: 0 0 5px 0;
  }
  .header-right ul li:nth-child(3):hover .left3{
    height: 80px;
  }
  .left3 a:hover{
    color:#684029
  }
  .left3 a{
    position:absolute;
  }
  .left3 a:first-child{
    top:-10px;
    left:40px;
  }
  .left3 a:last-child{
    top:16px;
    left:40px;
  }
</style>
