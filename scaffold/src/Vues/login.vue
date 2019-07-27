<template>
  <div>
    <hea class="hea"></hea>
    <login></login>
    <foo></foo>
  </div>
</template>

<script>
import hea from "../components/header"
import login from "../components/Login"
import foo from "../components/Footer"
export default {
  data(){
    return{}
  },
  components:{
    hea,
   login,
    foo,
   
  }
}
</script>
 
<style>
  .hea{
    top:0;
  }
</style>
