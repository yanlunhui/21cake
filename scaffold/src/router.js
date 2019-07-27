import Vue from 'vue'
import Router from 'vue-router'

// 引入组件 查看组件详情
 import details from "./Vues/details.vue"
//  import menu from "./components/menu.vue"
import product from "./components/product.vue"
// import productList from "./components/productList.vue"
// import Carousel from "./components/Carousel.vue"
 import index from "./Vues/index.vue"
 import login from "./Vues/login.vue"
 import reg from "./Vues/reg.vue"
import cart from "./components/cart"

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/details/:cid',component:details,props:true},
    //  {path:'/menu',component:menu},
    {path:'/product',component:product},
    {path:'/',component:index},
    {path:'/login',component:login},
    // {path:'/productList',component:productList},
    // {path:'/Carousel',component:Carousel}
    {path:'/reg',component:reg},
      {path:'/cart',component:cart},
    
  ]
})
