<template>
   <div class="home-menu">
    <a  herf="#d1"><img src="/img/label-1-sm.png"></a>
    <a  herf="#d2"><img src="/img/label-2-sm.png"></a>
    <a  herf="#d3"><img src="/img/label-3-sm.png"></a>
    <a  herf="#d4"><img src="/img/label-4-sm.png"></a>
    <a  herf="#d5"><img src="/img/label-5-sm.png"></a>
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
  .home-menu{
    width: 1124px;
    margin:26px auto 50px;
    padding-top: 0;
    display: flex;
    justify-content: space-between;
  }
  .home-menu>a{
    box-shadow: 0 2px 0 rgba(0, 0, 0, .06);
    border-radius:8px;
    margin:6px 12px;
    overflow: hidden;
  }
  .home-menu>a:hover{
    transform: scale(1.1)
  }
</style>
