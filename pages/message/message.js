// pages/message/message.js
const app= getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
    msg:"",
    detail: ['1'],
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // console.log(app.globalData.userInfo.nickName)
    const username= app.globalData.userInfo.nickName;
    this.getMsg(username);
    
  },
  //获取消息列表
  getMsg(username){
    wx.request({
      url:`${app.apiAddress}/getFeedBack`,
      method:'post',
      data:username,
      success:(res)=>{
      //  console.log(res)
       if(res.data.code!="0000"){
         wx.showToast({
           icon:'error',
           title: '暂无消息',
         })
       }else{
         this.setData({
           msg:res.data.list
         })
       }
      }
    })
  },
  //展开消息
  onChange(e) {
    this.setData({
      detail:e.detail
    });},
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