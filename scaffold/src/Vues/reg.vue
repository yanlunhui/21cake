<template>
  <div>
    <hea class="ha"></hea>
    <reg></reg>
    <foo></foo>
  </div>
</template>

<script>
import hea from "../components/header"
import reg from "../components/Reg"
import foo from "../components/Footer"
export default {
  data(){
    return{}
  },
  components:{
    hea,
   reg,
    foo,
   
  }
}
</script>

<style scoped>
.ha{
  top:0;
  z-index: 100;
}
</style>