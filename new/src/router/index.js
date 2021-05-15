import Vue from 'vue'
import VueRouter from 'vue-router'

import Login from '../components/Login.vue' //引入Login组件
//引入组件
import Home from '../components/Home.vue'
//引入欢迎界面
import Welcome from '../components/Welcome.vue'
//引入用户列表界面
import User from '../components/NavList/User.vue'
//引入Rights界面
import Rights from '../components/NavList/Rights.vue'
//引入Sport界面
import Sport from '../components/NavList/Sport.vue'

import Feedback from '../components/feedback.vue'
//设备界面
import Equipment from '../components/equipment.vue'
//添加设备
import Equipment_add from '../components/equipment_add.vue'
// 查看实时数据界面
import getEqData from '../views/getEqData.vue'
Vue.use(VueRouter)

  const routes = [  //配置路由
    {
      path:"/",
      redirect:"/login",    //路由重定向地址，访问根目录，重定向到/login地址上，然后跳转到login.vue的界面
    
    },
    {
        path:"/login",
        component:Login,   //访问/login时跳转显示的是component的界面，组件Login.vue的界面
        meta:{
          title:"欢迎来到智能家居系统"
        }
    },
    {
        path:"/home", //访问路径
        component:Home, 
        redirect:"/Welcome", //重定向访到welcome
        meta:{
          title:"智能家居管理后台"
        },
        children:[
           {  path:"/Welcome",component:Welcome},
           {  path:"/user",component:User},
           {  path:"/rights",component:Rights},
           {  path:"/sport",component:Sport},
           {  path:"/feedback",component:Feedback},
           {  path:"/equipment",component:Equipment},
           {  path:"/equipmentAdd",component:Equipment_add},
           {  
             path:"/getEqData",
             name:'getEqData',
             component:getEqData,
            },
        ]
    },
    
    
]

const router = new VueRouter({
  routes //等价于routes : routes
})
//挂载全局的路由守卫
router.beforeEach((to,from,next)=>{
  
      document.title = to.matched[0].meta.title;   
      
      //to将要访问地址
      //from访问来源
      //next 是重定向到next(url)的url上，如果next为空，继续访问to的地址
      if(to.path=='/login') return next(); //如果访问url是/login就直接跳转到login
      const userFlag = window.sessionStorage.getItem("user");//获取session的登录user值
      if(!userFlag)   //如果为空，即获取不到用户已登录信息，返回到login界面
      {
          return next('/login'); //访问login
      }
      else{
         next(); //获取到;放行  
      }

});
export default router //路由默认出口
