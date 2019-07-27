<template>
<div>
  <he></he>
  <div class="content">
    <!-- 通知栏 -->
    <div class="cart_top">
      <p>
        <img src="../../public/img/notic.png" alt="">
        <span>卜壳面包，不添加的味道，马上品尝</span>
        <a href="#">点击查看>></a>
      </p>
    </div>
    <!-- 头 -->
    <div class="cart_head">
      <ul>
        <li>商品</li>
        <li>生日牌</li>
        <li>单价</li>
        <li>数量</li>
        <li>金额</li>
      </ul>
    </div>

    <!-- 身体 -->
    <div class="cart_body">
      <table>
        <tbody>
          <tr id="sc" v-for="(item,i) of arr" :key="i">
            <td>
              <a href="#">
                <img :src="`http://127.0.0.1:3000/img/${item.img}`" alt="">
              </a>
            </td>
            <td>
              <a href="#" v-text="item.title "></a>
              <span v-text="`${item.weigth==1?1:item.weigth==2?1.5:item.weigth==3?2:item.weigth==4?3:item.weigth==5?5:tes}磅`"></span>
            </td>
            <td>
              <select name="" id="">
                <option value="">生日快乐</option>
                <option value="">节日快乐</option>
                <option value="">Happy Birthday</option>
                <option value="">空</option>
              </select>
            </td>
            <td>￥{{parseInt(item.price).toFixed(2)}}</td>
            <td >
              <button @click="change" :data-ci="i">-</button>
              <span v-text="item.count"></span>
              <button @click="change" :data-ci="i">+</button>
            </td>
            <td class="xj">￥{{parseInt(item.price*item.count).toFixed(2)}}</td>
            <td>
              <a href="#" @click="remove">×</a>
            </td>
          </tr>
          <!-- 二行 -->
        </tbody>
      </table>
    </div>

    <!-- sum -->
    <div class="cart_sum">
        <a href="#">
        <img src="" alt="">
        全部清除
        </a>
        <ul>
          <li v-text="heji"></li>
          <!-- <li>活动优惠：-20</li> -->
        </ul>
        <div class="total">
          <span></span>
        </div>
        <div class="end">
          <a href="#">去结算</a>
        </div>
    </div>
  </div>
  </div>
</template>

<script>
import he from "./header.vue"
export default {
  data(){
    return{
      // img:[],
      // price:[],
      // details:[]
      arr:[],
      // remove:0
      heji:0
    }
  },
  // mounted(){
  //   this.axios.get('http://127.0.0.1:3000/select/limg',
  //     {params:{lid:1}
  //     }
  //     ).then(res=>{
  //       this.img=res.data.pics;
  //       this.price=res.data.price;
  //       console.log(this.price)
  //       this.details=res.data.details;
  //       console.log(this.details)
  //     })
  // },
  methods:{
    // add(i){
    //   // this.arr[i].count++
    //   // this.n[i]=this.arr[i].count
    //   // console.log(e.target)
    //   // console.log(this.n[i])
    //   // console.log(this.n)
      change(e){
         
        // console.log(e.target)
        if(e.target.nodeName=="BUTTON"){

          var xjx=document.getElementsByClassName("xj")
        // // console.log(xjx)
         var sum=0
        // // 遍历数组得到每个元素
         for( var i=0;i<xjx.length;i++){
        //   // 获取元素内容
           var xjx1= xjx[i].innerHTML
        //   // 截取所需要的数字 
          var xjx2= parseInt( xjx1.substr(1,xjx1.length))
        // //  console.log(xjx2)
        // //  得出合计
             sum+=xjx2
         }
         this.heji=sum


          var btn=e.target
          var ci= e.target.dataset.ci
        var span=btn.parentNode.children[1]
         var n=parseInt(span.innerHTML)
          if(btn.innerHTML=="+"){
            n++
            this.arr[ci].count++
            // console.log(this.arr[ci].count)
          }else if(n>1){
            n--
            this.arr[ci].count--
            // console.log(this.arr[ci].count)
          }
          var xoj=btn.parentNode.nextSibling
          // console.log(xj.length)
          // var xj1=xj.innerHTML.substring(1,xj.length)
          var dj=btn.parentNode.previousSibling
          var dj1=dj.innerHTML
          dj1=dj1.substr(1,dj1.length)
          // console.log(xj,dj)
          // console.log(typeof (dj*n))
          xoj.innerHTML=`￥${(dj1*n).toFixed(2)}`
          span.innerHTML=n       
        }
        
      },
      remove(e){
        var ci= e.target.dataset.ci
        e.target.parentElement.parentElement.remove()
        this.arr.splice(ci,1)
      }
    // },
    // reduce(i){
    //   this.arr[i].count--
    //   this.n[i]=this.arr[i].count
    //   // console.log(e.target)
    //   // console.log(this.arr[i].count)
    //   //  console.log(this.n[i])
    //   //  console.log(this.n)    
    // }   
    },
    // del(e){
    //   document.getElementById("sc").remove();
    // },
    // add(e){
    //   var ad=e.target
    //   	if(ad.innerHTML=="+"){
		// 	  this.n++;
		//   }else if(this.n>1){
		// 	  this.n--;
		//   }
    // },
  created(){
    this.arr=this.$store.getters.getdata
  },
  components:{
    he
  },
  mount(){
    
  }
}
</script>

<style scoped>
  p,li,ul{
    margin:0;padding: 0;
  }
  .content{
    weigthth: 1200px;
    margin: 0 auto;
  }
  .cart_top{
    background: rgba(213,191,167,0.15);
    height: 40px;
  }
  .cart_top img{
    weigthth: 33px;height: 20px;
    display: inline-block;
    margin:0 5px -5px 20px;
  }
  .cart_top p{
    line-height:40px;
  }
  .cart_top span{
    color:#685029;
    font-size:13px;
  }
  .cart_top a{
    color:#d5bfa7;
    font-size:13px;
    margin-left:5px;
  }
  .cart_head{
    background: #FAFAFA;
    border: 1px solid #e1e1e1;
    margin-top:32px;
    height: 46px;
  }
  .cart_head ul li{
    font-size:13px;
    color:#684029;
    float: left;
    line-height: 46px;
  }
  .cart_head ul li:first-child{
    weigthth: 285px;height: 44px;
    margin-left:166px;
  }
  .cart_head ul li:nth-child(2){
    weigthth: 300px;height: 44px;
  }
  .cart_head ul li:nth-child(3){
    weigthth: 115px;height: 44px;
  }
  .cart_head ul li:nth-child(4){
    weigthth: 150px;height: 44px;
  }
  .cart_head ul li:nth-child(5){
    weigthth: 180px;height: 44px;
  }
  .cart_sum{
    background: #FAFAFA;
    border: 1px solid #e1e1e1;
    margin-top:20px;
    padding: 26px 60px 32px 60px;
  }
  .cart_sum a{
    font-size:13px;
    color:#684029;
  }
  .cart_sum img{
    weigthth: 18px;height: 21px;
    margin:0px 10px -4px 0px;
  }
  .cart_sum ul li{
    text-align: right;
    font-size:13px;
    color:#684029;
    margin-bottom:10px;
  }
  .total{
    text-align: right;
    font-size:14px;
    color:#ff714d;
  }
  .total span{
    display: inline-block;
    border-top: 2px solid #E2E2E2;
    weigthth: 232px;
    line-height: 42px;
    font-size:13px;
    color:#684029;
  }
  .end{
    text-align: right;
    margin-top: 14px;
  }
  .end a{
    display: inline-block;
    background: #684029;
    weigthth: 232px;
    height: 40px;
    color:#fff;
    line-height: 40px;
    text-align: center;
    font-size:14px;
  }
  .cart_body{
    background: #fff;
    border: 1px solid #E1E1E1;
    margin-top: 20px;
    /* height: 200px; */
  }
  .cart_body table{
    border-collapse: collapse;
    margin: 0 auto;
  }
 .cart_body table tbody tr{
    border-bottom: 2px dashed #F1F1F1;
  }
  .cart_body table tbody tr td{
    padding:24px 0;
  }
  .cart_body tr>td:first-child a{
    margin-left:60px;
  }
  .cart_body tr td:nth-child(2){
    weigthth: 300px;
  }
  .cart_body tr td:nth-child(2) a{
    display:block;
    font-size:14px;
    color:#684029
  }
  .cart_body tr td:nth-child(2) span{
    font-size:13px;
    color:#d5bfa7;
  }
  .cart_body tr td:nth-child(3) select{
    weigthth: 235px;
    height: 25px;
    color: #694029;
  }
  .cart_body tr td:nth-child(3){
    weigthth: 300px;
    color: #694029;
    font-size:13px;
  }
  .cart_body tr td:nth-child(4){
    weigthth: 115px;
    color: #694029;
    font-size:13px;
  }
  .cart_body tr td:nth-child(5){
    weigthth: 150px;
    color: #694029;
    font-size:13px;
  }
  .cart_body tr td:nth-child(6){
    weigthth: 100px;
    color: #ff714d;
    font-size:13px;
  }
  .cart_body tr td:nth-child(7){
    weigthth: 79px;
  }
  .cart_body tr td:nth-child(7) a{
    color: #ccc;
    font-size:20px;
    margin-left: 60px;
  }
  .cart_body tr td:nth-child(5) button{
    weigthth: 22px;
    border:1px solid #e7e7e7;
    background: #fff;
    height: 21px;
  }
  .cart_body tr td:nth-child(5) span{
    display: inline-block;
    weigthth: 48px;
    text-align: center;
    border: 1px solid #e7e7e7;
    height: 19px; 
  }
</style>