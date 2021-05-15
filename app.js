//app.js
App({
  onLaunch: function () {
    // 展示本地存储能力
    var logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)

    // 登录
    wx.login({
      success: res => {
        // 发送 res.code 到后台换取 openId, sessionKey, unionId
      }
    })
    // 获取用户信息
    wx.showModal({
      title: '温馨提示',
      content: '正在请求您的个人信息',
      success:(res)=> {
        if (res.confirm) {
          wx.getUserProfile({
          desc: "获取你的昵称、头像、地区及性别",
          success: res => {
            // console.log(res)
            this.globalData.userInfo = res.userInfo;
            if (this.userInfoReadyCallback) {
                 this.userInfoReadyCallback(res)
              }
          },
          fail: res => {
             //拒绝授权
            this.showErrorModal('您拒绝了请求');
            return;
          }
        })} else if (res.cancel) {
          //拒绝授权 showErrorModal是自定义的提示
          that.showErrorModal('您拒绝了请求');
          return;
        }
      }
    })

    // wx.getSetting({
    //   success: res => {
    //     if (res.authSetting['scope.userInfo']) {
    //       // 已经授权，可以直接调用 getUserInfo 获取头像昵称，不会弹框
    //       wx.getUserProfile({
    //         success: res => {
    //           console.log(res)
    //           // 可以将 res 发送给后台解码出 unionId
    //           this.globalData.userInfo = res.userInfo

    //           // 由于 getUserInfo 是网络请求，可能会在 Page.onLoad 之后才返回
    //           // 所以此处加入 callback 以防止这种情况
    //           if (this.userInfoReadyCallback) {
    //             this.userInfoReadyCallback(res)
    //           }
    //         }
    //       })
    //     }
    //   }
    // })
  },
  globalData: {
    userInfo: null
  },
  // apiAddress:"http://192.168.2.112:9000"
  apiAddress:"http://106.15.204.66:9000"

})