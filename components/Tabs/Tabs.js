// components/Tabs/Tabs.js
Component({
  /**
   * 组件的属性列表
   * 父组件向子组件接收的函数
   */
  properties: {
     tabs:{
        type:Array,
        value:[]
     }
  },

  /**
   * 组件的初始数据
   */
  data: {
    tabs:[],
  },
  
  /**
   * 文件中.js事件绑定回调函数放在data同层级
   * 组件中.js事件绑定回调函数放在methods才能生效
   * 组件的方法列表
   */
  methods: {
    hanldeItemTap(e){
      /* 
      1.const 定义变量值，必须初始化，即 有初始赋值，否则报错
      2.变量名{index}
        const {index} = e.currentTarget.dataset; 
        const index = e.currentTarget.dataset.index; 
        含义用处一样，即定义一个index变量
      */
     /* 获取wxml中的索引 */
     const {index} = e.currentTarget.dataset; 
     /* 向父组件传递自定义事件 */
     /*  this.triggerEvent("父组件自定义事件的名称","传向父组件的值") */
      this.triggerEvent("itemChange",{index});

     //console.log(e);
     /* 将原有数组原样赋值到tabs数组 */
     let {tabs}= this.data;
    //  console.log({index});
      /* [].forEach(V,i)遍历数组，遍历数组v的值改变，原数组的值也会发生改变,i是遍历的下标，匹配索引的目录值 */
     tabs.forEach((v,i)=>i===index?v.isActive=true:v.isActive=false
     );
     this.setData({
       tabs:tabs
     }) 
    } 
  }
})
