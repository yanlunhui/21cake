import Vue from 'vue'
import App from './App.vue'
import router from './router'
 //引入axios文件
import axios from "./axios.js"
// 引入vuex
import Vuex from "vuex"

//7: 注册vuex组件
Vue.use(Vuex)
//8: 创建vuex实例 store 
var store = new Vuex.Store({
  //vuex中全局共享数据
  state:{
    cartCount:0,
    gwlist:[]
  },
  //修改vuex中全局共享数据
  mutations:{
    // 根据传入的
    //购物车数量加 1
    increment(state){
      state.cartCount++;
    },
    clear(state){
      state.cartCount = 0;
    },
    //购物车数量增加指定值 
    updateCount(state,c){
       state.cartCount+=c;
    },
    // 添加商品数据
    updata(state,obj){
      // console.log(obj)
      state.gwlist.push(obj)
    }
  },
  //获取vuex中全局共享数据
  getters:{
   getCartCount:function(state){
    return state.cartCount;
   },
   getdata:state=>{
     return state.gwlist;
   }
  }
})

Vue.config.productionTip = false
new Vue({
  router,
  render: h => h(App),
  // 将store保存vue实例中
  store
}).$mount('#app')
