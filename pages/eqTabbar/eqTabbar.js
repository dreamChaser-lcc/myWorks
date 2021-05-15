import Toast from '@vant/weapp/toast/toast'

const app = getApp()
Page({
data: {    
            fal:true,
            // tab切换
            currentTab: 0,
            //顶部导航标签
            tabs:[
              {
                id:0,
                name:"当前",
                isActive:true
              },
              {
                id:1,
                name:"温度",
                isActive:false
              },
              {
                id:2,
                name:"烟雾",
                isActive:false
              },
              {
                id:3,
                name:"可视化",
                isActive:false
              }
            ],
            equipmentData:{
              wd:"",
              ph:"",
              zl:"",
              gz:"",
              switch_wd:"",
              switch_zl:"",
              switch_gz:"",
              time:""
            } ,
            dataList:[],
            legendWd:[],
            legendGz:[],
            legendZl:'',
            userInfo:{},//用户信息
            isBind:false,//是否绑定了设备
            timer:""
},
onLoad(){
},
//查看是否绑定设备
isBindEq(username){
  // console.log(username)
  wx.request({
    url: `${app.apiAddress}/getWxInfo`,
    method:"post",
    data:username,
    success:(res)=>{
      // console.log(res);
      if(res.statusCode==200){
        if(res.data.wxInfo&&res.data.wxInfo.eqName&&res.data.wxInfo.state==true){
          this.setData({
            userInfo:res.data.wxInfo,
            isBind:true,
          })
        }else{
          this.setData({
          isBind:false,
          })
          if(res.data.wxInfo.state==false){
            Toast.fail( `请绑定有效id\n或联系管理员`)
          }else{
            wx.showToast({
              icon:'error',
              title: '请先绑定设备id',
            })
          }
           setTimeout( ()=>{
            wx.reLaunch({
              url: '/pages/info/info'
            })
           },3000)
        }
      }
    },
    fail:()=>{
      wx.showToast({
        title: `后端访问失败`,
        icon:"error"
      })
    }
  })
},
//改变状态栏
handleItemChange(e){
const {index} = e.detail;
this.isBindEq(this.data.userInfo.username);
if(!this.data.isBind)
{
  wx.showToast({
    title: '设备异常',
    icon:"error"
  })
}else{
    this.handleGetData(index);
    let {tabs}= this.data;
    tabs.forEach((v,i)=>i===index?v.isActive=true:v.isActive=false);
    // console.log(this)
    // 设置状态条 更新当前页
    this.setData({
      tabs:tabs,
      currentTab:index
    }); 
}
},
onPullDownRefresh: function () {
  let current = this.data.currentTab;
  //根据所在页面索引，刷新当前页的内容
  this.isBindEq(this.data.userInfo.username);
  if(this.data.isBind){
    if(current==0){
      // console.log('进')
      if(this.data.timer==""){
        let timer=setInterval(()=>{
          // console.log('ds')
          this.handleGetData(current);
        },1000)
        //设置定时器
        this.setData({timer})
      }
    }else{
      this.handleGetData(current);
    }
  }
  wx.stopPullDownRefresh()
    // this.handleGetData(0);
    // this.handleGetData(1);
    // // this.handleGetData(3); 可视化界面
},
  
onShow: function() {
  //console.log("bei初始化了")
   /**
   * 判断是否已绑定设备
   * 未绑定跳转到用户界面进行绑定
   */
  this.isBindEq(app.globalData.userInfo.nickName)
},
 handleGetData:function(index){
   if(index!=0){
     clearInterval(this.data.timer)
     this.setData({timer:""})
   }
    if(index==0)
    { 
      let that =this;  
      // console.log(this.data.equipmentData) 
      wx.request({
        url:`${app.apiAddress}/wxData`,
        method: 'post',
        data:{
          eqName:this.data.userInfo.eqName,
        },
        success(res){
          let {data} =res;
          // console.log(data)
          if(!data){
            Toast.fail(`设备异常\n或不存在`);
            that.setData({
              equipmentData:{},
            })
          }else{
            that.setData({
              equipmentData:data,
            })
          }
        },
        fail:()=>{
          wx.showToast({
            title: '后端连接失败',
            icon:"error"
          })
        }
      })
    }
    if(index==1||index==2){
      let that =this;
      // url:"http://192.168.43.67:9000/getDataList",
      wx.showLoading({
        title: '正在加载',
      })
      wx.request({
          url:`${app.apiAddress}/getDataList`,
          method:"post",
          data:{
            eqName:this.data.userInfo.eqName,
          },
          success(res){
            let dataList=res.data;
            //只展示前100条数据
            dataList.splice(80,dataList.length-1)
            // console.log("sdsd",dataList)
            if(res.data.length===0){
              Toast.fail(`设备异常\n或不存在`)
            }
             that.setData({
              dataList:dataList,
            })
            setTimeout(()=>{ wx.hideLoading()},1000)
            // console.log(res.data)
          },
          fail(){
            wx.showToast({
              title: '获取数据失败请联系管理员',
              icon:'none'
            })
          }
      })
    }
    if(index==3)
    {
        let that = this;
        wx.request({
          url:`${app.apiAddress}/getLegend`,
          method:"post",
          data:{
            eqName:this.data.userInfo.eqName,
            date:"2020-12-31"
          },
          success(res){
            // console.log(res.data);
            let d= res.data;
            let isUnNull= d.some((item)=>{
              return item!=null
            });
            // console.log(d[0].wd);
            if(isUnNull){
              let wd = d.map((item)=>{
                if(item!=null){ return item.wd;}
                else return "";
              });
              // console.log(wd);
              // ！！！将两个图都赋值了，Gz的还需要更改，数据是写死的
              that.setData({
                  legendWd:wd,
                  legendGz:wd,
              });
            }else{
              setTimeout(()=>{
                Toast.fail(`设备数据异常\n或数据不存在`)
              },1000)
            }
          },
          fail:()=>{
            Toast.fail("服务器请求失败")
          }
        })
    }
 }
})
