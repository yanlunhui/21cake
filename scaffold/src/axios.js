//将axios库单独保存
//引入vue实例
import Vue from "vue"
//引入发送异步请求的组件
import axios from "axios"
//发送axios保留session对象信息
axios.defaults.withCredentials=true
//配置axios前置基础路径
axios.defaults.baseURL="http://127.0.0.01:3000/"
//将请求对象强行添加到Vue的原型对象链上
Vue.prototype.axios=axios;   //Vue.use() 它不支持