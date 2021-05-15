// pages/info/info.js
const app = getApp();
Page({
  properties: {
    cz:{
      type:Number,
      value:123
    }
  },
  /**
   * 页面的初始数据
   */
  data: {
      info:{
        username:'lcc',
        eqName:"",
        address:"",
        contacts:"",
      },
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
     wx.request({
      url:`${app.apiAddress}/getWxInfo`,
      method:"post",
      data:getApp().globalData.userInfo.nickName,
      success:(res)=>{
        // console.log(res)
        //不等于空
        if(res.data.wxInfo!=null)
        {
          this.setData({
            info:res.data.wxInfo
          })
        }else{
         // 获取全局变量用户id信息并赋值到info上
          this.setData({
            info:{},
            ["info.username"]:getApp().globalData.userInfo.nickName
          })
        }
      }
    })
  },
  /**
   * 保存按钮处理函数
   */
  handleSaveBtu(){
    // console.log(this.data.info)
    let data = JSON.stringify(this.data.info);
    console.log(data)
    wx.request({
      url:`${app.apiAddress}/updateWxInfo`,
      method:"post",
      data:data,
      success:(res)=>{
        // console.log(res)
        wx.showToast({
          title: res.data,
        })
        //返回上一页
        setTimeout(()=>{
          wx.switchTab({
            url: '/pages/myTabBar/myTabBar'
          })
        },1000)
        // this.setData({
        //   ["info.eqName"]:res.data
        // })
      }
    })

  },
  /**
   * 表单值绑定函数
   */
  handleBlurIpt(e){
    // console.log(e)
    //解构input标签的id
   let {currentTarget:{id},detail:{value}} = e;
  //  console.log(value,id)
   this.setData({
       ['info.'+[id]]:value
   })
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  }
})