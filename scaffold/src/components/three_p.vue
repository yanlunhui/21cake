<template>
  <div id="bd">
    <div class="top">
      <h4>
        活动门
        <span class="font-size">/</span>
        <span class="font-size">是被吸引了吧</span>
      </h4>
        <a href=""><img src="img/ltop.jpg" alt=""></a>
    </div>

    <div class="down">
      <h4>
        廿一客
        <span class="font-size">/</span>
        <span class="font-size">文章</span>
        <a href="#" class="font-size">查看更多></a>
      </h4>
      <div class="down1">
        <a href=""><img src="img/left.jpg" alt=""></a>
        <h4><a href="#">冬季刊·进博会</a></h4>
        <p><a href="#" class="font-size">阅读全文>></a></p>
      </div>

      <div class="down2">
        <a href=""><img src="img/right.jpg" alt=""></a>
        <h4><a href="#">甘一志秋刊·客服Q&A</a></h4>
        <p><a href="#" class="font-size">阅读全文>></a></p>
      </div>
    </div>
    
  </div>
</template>

<script>
export default {
  data(){
    return{}
  }
}
</script>

<style scoped>
  h1,h2,h3,h4,h5,h6,body,p,a,ul,li,div{
    margin:0;padding:0;
  }
  #bd{
    width: 1200px;
    margin:0 auto;
  }
  .top,.down{
    padding-top:60px;
  }
  .top>a>img{
    border-radius:5px;
  }
  .top>h4,.down>h4{
    font-size:24px;
    color:#684029;
    margin-bottom:20px;
  }
  .top>h4>span:last-child,.down>h4>span:nth-child(2){
    margin-left:6px;
  }
  .font-size{
    font-size:13px;
    color:#684029;
  }
  .down>h4>a{
    float:right;
  }
  .down1>a>img,.down2>a>img{
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
  }
  .down1{
    width: 580px;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
    box-shadow: 0 0 2px 0;
    float:left;
  }
  .down2{
    width: 580px;
    float: right;
    border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
    box-shadow: 0 0 2px 0;
  }
  .down1>h4>a{
    font-size:24px;
    color:#000;
  }
  .down1>h4{
    padding:14px 8px;
  }
  .down1>p{
    padding:0 8px 8px;
  }
  .down2>h4>a{
    color:#000;
    font-size:26px
  }
  .down2>h4{
    padding:14px 8px;
  }
  .down2>p{
    padding:0 8px 8px;
  }
</style>
