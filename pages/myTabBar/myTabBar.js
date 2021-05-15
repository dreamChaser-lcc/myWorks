
//获取应用实例
const app = getApp()

Page({
  data: {
    motto: 'Hello World',
    userInfo: {},
    hasUserInfo: false,
    canIUse: wx.canIUse('button.open-type.getUserInfo'),
    swiperImges:[
        {id:"101",img:"./image/swiper1.jpg"},
        {id:"102",img:"./image/swiper2.jpg"},
    ],
    cz1:123,
    gird_option:[
      {text:'个人资料',url:'/pages/info/info',icon:'/pages/myTabBar/image/my_info.png'},
      {text:'意见反馈',url:'/pages/feedback/feedback',icon:'/pages/myTabBar/image/my_feedback.png'},
      {text:'消息',url:'/pages/message/message',icon:'/pages/myTabBar/image/my_message.png'},
      {text:'常见问题',url:'/pages/problem/problem',icon:'/pages/myTabBar/image/my_problem.png'},
      {text:'客服',url:'',onclick:'handlePhone',icon:'/pages/myTabBar/image/my_setting.png'},
      {text:'关于',url:'/pages/clause/clause',icon:'/pages/myTabBar/image/my_clause.png'},
      
    ]
  },
  //事件处理函数
  bindViewTap: function() {
    wx.navigateTo({
      url: '../logs/logs'
    })
  },
  onLoad: function () {
    if (app.globalData.userInfo) {
      console.log('app.globalData.userInfo',app.globalData.userInfo)
      this.setData({
        userInfo: app.globalData.userInfo,
        hasUserInfo: true
      })
    } else if (this.data.canIUse){
      // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
      // 所以此处加入 callback 以防止这种情况
      app.userInfoReadyCallback = res => {
        // console.log(res)
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
      }
    } else {
      // 在没有 open-type=getUserInfo 版本的兼容处理
      wx.getUserInfo({
        success: res => {
          console.log(res)
          app.globalData.userInfo = res.userInfo
          this.setData({
            userInfo: res.userInfo,
            hasUserInfo: true
          })
        }
      })
    }
  },
  getUserProfile: function(e) {
    wx.getUserProfile({
      desc: '用于完善会员资料', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
      success: (res) => {
        app.globalData.userInfo = res.userInfo;
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        })
        console.log(this.data.userInfo)
      }
    })
    // console.log(e)
    // app.globalData.userInfo = e.detail.userInfo
    // this.setData({
    //   userInfo: e.detail.userInfo,
    //   hasUserInfo: true
    // })
  },
  handlePhone(){
    wx.showActionSheet({
      itemList:['请拨打：18289298006'],
      success(){   
      },
      fail(){
      }
    })
  },
})
