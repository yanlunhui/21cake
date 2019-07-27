<template>
  <div>
    <hea class="ha"></hea>
    <det class="det" :cid="ab"></det>
    <foo></foo>
  </div>
</template>

<script>
import hea from "../components/header"
import det from "../components/details"
import foo from "../components/Footer"
export default {
  data(){
    return{
     ab:1
    }
  },
  props:["cid"],
  components:{
    hea,
   det,
    foo
  },
  created(){
    // console.log(this.cid)
    this.ab=this.cid
  }
}
</script>

<style scoped>
.ha{
  top:0;
  z-index: 100;
}
.det{
  margin-top:100px; 
}
</style>
