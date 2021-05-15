import Vue from 'vue'
import App from './App.vue'
import router from './router'
import './plugins/element.js'
// 引入全局样式
import './assets/css/global.css'
//全局引入登录图片
import './assets/image/img_login/iconfont.css'
//全局导入element ui组件并use
import ElementUI from 'element-ui'
import axios from 'axios'  //导入axios
import echarts from 'echarts' //引可视化图
import VCharts from 'v-charts'
Vue.use(VCharts)
Vue.prototype.$echarts = echarts //命名可视化


//挂载axios
Vue.prototype.$http = axios  //命名全局变量axios为$axios
//设置默认访问根路径 异步访问
axios.defaults.baseURL = "http://106.15.204.66:9000" //请求跨域
// axios.defaults.baseURL = "http://localhost:9000"


Vue.use(ElementUI)
Vue.config.productionTip = false
new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
