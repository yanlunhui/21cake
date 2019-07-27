<template>
  <div>
    <!-- 测试vuex -->
    <!-- <div>{{$store.getters.getCartCount}}</div> -->
    <hear class="hear"></hear>
    <carousel class="carousl"></carousel> 
    <me></me>
    <bod></bod>  
    <thre></thre>
    <foo></foo>
    
  </div>
</template>

<script>
import bod from "../components/product.vue"
import carousel from "../components/Carousel.vue"
import foo from "../components/Footer.vue"
import me from "../components/menu.vue"
import thre from "../components/three_p.vue"
import hear from "../components/header.vue"
export default {
  data(){
    return{}
  },
  components:{
    bod,
    carousel,
    foo,
    me,
    hear,
     thre
  },
  created(){
    // 测试vuex
    // this.$store.commit("updateCount",5)
    // console.log(this.$store.getters.getCartCount)
    
  }
}
</script>
<style scoped>
  .hear{
    
    top:0;
    margin: 0 auto;
  }
.carousl{
  width: 1116px;
  margin: 0 auto;
}
</style>