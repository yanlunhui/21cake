
<template>
<div class="deta">
  <div :id="`d${i+1}`" v-for="(elem,i) of list " :key="i">
    <div class="d1">
      <h6 v-if="`${elem[0].lid}`">{{elem[0].lname}}/<span>专区</span> </h6>
      <img class="lgimg" :src="`http://127.0.0.1:3000/img/${elem[0].img2}`">
    </div>
    <div class="product-father" >
      <div class="list" v-for="(t,i1) of elem " :key="i1">
        
        <router-link   :to="`details/${t.cid}`">
          <img  :src="`http://127.0.0.1:3000/img/${t.img1}`">
        </router-link>
            <h6  v-text="t.title"></h6>
        <p  v-text="t.subtitle"></p>
        
        <div class="cart-info">
          <span class="spec" v-text="`¥${parseInt(t.price).toFixed(2)}/1.0磅`"></span>
          <router-link   to="/">加入购物车</router-link>
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
    lid:0,
    list:[],
    // list:[][{price:0}]
    // list1:[[{lname:""}]],
    
    }
  },
  methods:{
    lode(x){
      this.axios.get("select/limg",{params:{lid:x}}).then(result=>{
       var c=result.data.pics
       //console.log(c)
       var a=result.data.price
       var b=result.data.details
       var d=result.data.lgname
       for(var i=0;i<c.length;i++){
         //console.log(this.list.length)
          for(var de in b[i]){
            c[i][de]=b[i][de]
          }
          for(var ae in a[i]){
            c[i][ae]=a[i][ae]
          }  
          for(var dd in d[i]){
            c[i][dd]=d[i][dd]
          }
        }    
        this.list.push(c)
        //  console.log(this.list)
      })
    }
    // lode1(){
    //   this.axios.get("select/la",{params:{}}).then(result=>{
    //     console.log(result)
    //     this.list1=result.data
    //   // console.log(this.list1)
    //   })
    // }
  },
  // watch(){
  //   console.log(this.lid)
  // },
  created(){
     for(var i=1;i<5;i++){
       this.lode(i)   
     }
    //  this.lode1()
  },
}
</script>

<style scoped>
.d1{
  margin: 0 auto;
  width: 1200px;
}
.d1 h6{
  color:#d5bfa7;
  font-size:25px; 
  font-weight:normal;
  padding:50px 0 15px 0;
}
.d1>h6>span{
  font-size:12px;
  
}
.lgimg{
  width: 1200px;
}
.product-father{
  width: 1200px;
  height: 365px;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
}
   a{
      text-decoration: none;
    }
    .list{
      width: 263px;
      height: 365px;
      box-sizing: border-box;
    }
    .list>a>img{
      width: 263px;
      height: 230px;
      background-color:#fafafa;
      border-radius:8px;
    }
    .list>h6{
      font-size:16px;
      margin-top: 10px;
      line-height: 22px;
      color:#000;
    }
    .list>p{
      font-size:14px;
      color:#616161;
      line-height:24px;
      overflow: hidden; 
      white-space: nowrap; 
      text-overflow: ellipsis;

    }
    .tag-list{
      font-size:0;
      width: 263px;
      height: 35px;
      overflow: hidden;
    }
    .tag-list a{
      display: inline-block;
      border:1px solid #d5bfa7;
      color:#d5bfa7;
      border-radius:100px;
      padding:0 6px 0 8px;
      font-size: 12px;
    }
    .cart-info{
      border-top:1px dashed #d5bfa7;
      height: 37px;
      margin-top: 6px;
      padding-top:14px;
      color:#d5bfa7;
    }
    .cart-info a{
      float:right;
      display: inline-block;
      line-height: 20px;
      font-size: 12px;
      background-color:#643e28;
      color:#fff;
      padding:0 10px;
    }
    .data{
      display: flex;
      flex-direction:column;
    }
  
</style>