<template>
  <div class="details-father">
    <div class="details-banner">
      <div class="img-left">
        <img :src="`http://127.0.0.1:3000/img/${img[i].lg}`">
      </div>
      <div class="right-list">
        <ul>
          <li  v-for="(item,i) of img" :key="i" @mousemove="getindex(i)"><img :src="`http://127.0.0.1:3000/img/${item.lg}`" ></li>
        </ul>
      </div>
    </div>
    <div class="content-box">
      <div class="pro-con">
        <div class="con-left">
          <h1>{{title}}</h1>
          <p v-text="details"></p>
          <div class="con-label">
            <a href="javascript:;">儿童 ></a>
            <a href="javascript:;">新品 ></a>
            <a href="javascript:;">生日 ></a>
            <a href="javascript:;">力荐单品 ></a>
          </div>
          <ul>
            <li><img src="img/001.png"><span>五常大米</span></li>
            <li><img src="img/pcicon-24.png"><span>鹰嘴豆</span></li>
            <li><img src="img/pcicon-36.png"><span>综合水果果酱</span></li>
          </ul>
          <h5 v-text="subtitle"></h5>
        </div>
        <div class="con-right">
          <div>
            <img :src="`http://127.0.0.1:3000/img/${img[y].w_img}`" alt="">
            <ul  class="ul926">
              <li  v-for ="(p,x) of detasils[y]" :key="x" v-text="p">
                <i class="cha"></i>
              </li>
              <!-- <li v-text="detasils[0].unumber">
                <i class="friend"></i>         
              </li>
              <li v-text="detasils[0].laid">
                <i class="cha"></i>
              </li>
              <li v-text="detasils[0].time">
                <i class="time"></i>
              </li> -->
            </ul>
            <p class="details-price">¥<span id="ssp" v-text="parseInt(detasils[y].price).toFixed(2)"></span>/
            <span v-text="`${detasils[y].wid==1?1:detasils[y].wid==2?1.5:detasils[y].wid==3?2:detasils[y].wid==4?3:detasils[y].wid==5?5:tes}磅`"></span></p>
          </div>
          <div class="details-ch">
            <!-- <div>
              <span>撒粉图案</span><a href="javascript:;">可可撒粉</a><a href="#">芒果撒粉</a>
            </div> -->
            <div>
              <span>商品规格:
                </span><a class="a926"  :style="y==0?active926:0" v-for="(p,y) of detasils" :key='y' @click="change" :data-id="y" v-text="`${p.wid==1?1:p.wid==2?1.5:p.wid==3?2:p.wid==4?3:p.wid==5?5:tes}磅`"></a>
            </div>
          </div>
          <div class="details-button">
            <a href="#" class="button buy">立即购买</a>
            <a href="javascript:;" @click="adc" class="button cart" >加入购物车</a>
          </div>
        </div>
      </div>
    </div> 
  </div>
</template>

<script>
export default {
  data(){
    return{
      title:'',
      subtitle:'',   
      details:'',
      // //////////////////////////////////////
      detasils:[{laid:''}],
      i:0,
      img:[{lg:0}],
      y:0,
      tes:"更多",
      obj:{},
      active926:{
        background:"#D5BFA7"
      }
    }
  },
  props:['cid'],//接参数
  created(){
    this.load();
    // console.log(this.$router)
    
  },
  methods:{
    adc(){         
      var price=this.detasils[this.y].price
      var weigth=this.detasils[this.y].wid
      // console.log(price)
      this.obj.cid=this.cid,
      this.obj.img=this.img[0].md
      this.obj.title=this.title
      this.obj.price=price;
      this.obj.count=1;
      this.obj.weigth=weigth

      // console.log(this.obj)
       this.$store.commit("updata",this.obj)
      //  console.log(this.$store.getters.getdata)
    },
    getindex(i){
      this.i=i;
    },
    change(e){
     var y= e.target.dataset.id
     var da=document.getElementsByClassName("a926")
      for(var i=0;i<da.length;i++){
        da[i].style="background:#fff;"
      }
     da[y].style="background:#D5BFA7;"
      this.y=y
    },
    load(){
      this.axios.get('http://127.0.0.1:3000/select/details',
      {params:{cid:this.cid}
      }
      ).then(result=>{
        // console.log(result);
        // for(var item of result.data.pics){    
          // console.log(this.img)
        // }
        this.title=result.data.product.title;
        this.subtitle=result.data.product.subtitle;  
        this.details=result.data.product.details;
        //、、、、·············································
        this.detasils=result.data.detasils;
        this.img=result.data.pics;
      })
    }
  }
}
</script>

<style>
body{padding: 0;margin: 0;font-size: 12px;}
.ul926>li:nth-child(1),.ul926>li:nth-child(2){
  display: none;
}
.active926{
  background: #D5BFA7;
}
/* .activ{
  background: #D5BFA7;
} */
.a926{
  text-align: center;
  border: 1px solid #999;
  margin: 5px;
  width: 60px;
  border-radius:5px;
  display: inline-block;
  height: 20px;
  cursor:pointer; 
}

.details-banner{
  width: 1200px;
  margin: 10px auto 0;
  height: 612px;
}
.img-left{
  float: left;
  width: 1088px;
  height: 612px;
  position: relative;
}
.right-list{
  float: right;
  width: 90px;
  position: relative;
  height: 612px;
}
.right-list>ul{
  width: 90px;
  position: absolute;
  bottom: 0;
  left: 0;
  max-height: 280px;
  overflow: hidden;
  list-style: none;
}
.right-list>ul>li{
  height: 50px;
  width: 90px;
  margin-top: 20px;
  cursor: pointer;
}
.right-list>ul>li:hover{/*active样式*/
  border: 1px solid #C69C6D;
  height: 48px;
  width: 88px;
}
.right-list>ul img{
  width: 100%;
  height: 100%;
  background: #eee;
}
.content-box{
  width: 1200px;
  margin: 0 auto;
  padding-bottom: 50px;
}
.pro-con{
  position: relative;
  overflow: hidden;
  padding-bottom: 10px;
  border-bottom: #D8D8D8 solid 1px;
}
.con-left{
  width: 484px;
  float: left;
}
.con-left>h1{
  font-size: 20px;
  line-height: 28px;
  padding-top: 20px;
}
.con-left>p{
  min-height: 17px;
  line-height: 17px;
  color: #FF3933;
}
.con-left ul{
  overflow: hidden;
  margin-bottom: 14px;
  list-style: none;
  padding: 0 !important;
}
.con-left ul>li{
  float: left;
  height: 50px;
  line-height: 50px;
  color: #684029;
}
.con-left ul img{
  display: inline-block;
  height: 50px;
  width: 50px;
  vertical-align: middle;
}
.con-left ul>li>span{
  height: 20px;
  line-height: 20px;
  vertical-align: middle;
}
.con-label{
  margin: 20px 0 14px;
  font-size:12px;
}
.con-label>a{
    display: inline-block;
    line-height: 18px;
    color: #D5BFA7;
    padding: 0 10px;
    border: 1px solid #D5BFA7;
    border-radius: 100px;
    margin-right: 6px;
}
h5{
  font-size: 12px;
  width: 484px;
  line-height: 2em;
  min-height: 30px;
}
.con-right{
  width: 630px;
  margin-left: 84px;
  position: relative;
  overflow: auto;
}
.con-right div:first-child{
  overflow: hidden;
  padding-top: 28px;
  margin-bottom: 24px;
  min-height: 80px;
}
.con-right div:first-child img{
  float: left;
  width: 300px;
  height: 170px;
  display: block;
}
.con-right ul{
  margin-top: 8px;
  list-style: none;
}
.con-right ul li{
  height: 25px;
  line-height: 25px;
  margin: 5px 0;
}
.con-right ul li i{
  display: inline-block;
  width: 25px;
  height: 25px;
  vertical-align: middle;
  background-repeat: no-repeat;
}
.cha{
  background-image: url()
}
/* .friend{
   background-image: url('../assets/img/pengyou.png') 
}
.time{
   background-image: url('../assets/img/time.png') 
} */
.details-price{
  height: 25px;
  line-height: 25px;
  font-size: 18px;
  color: #C69C6D;
}
.details-price span{
  font-size: 26px;
}
.details-button{
 
  height: 40px;
  font-size: 13px;
}
.button{
  width: 167px;
  height: 30px;
  line-height: 30px;
  text-align: center;
}
.details-button .buy{
  float: right;
  background: #F4F4F4;
  color: #7A5844;
}
.details-button .cart{
  float: right;
  background: #684029;
  color: #fff;
}
</style>
