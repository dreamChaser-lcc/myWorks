// pages/feedback/feedback.js
const app = getApp();
Page({

  /**
   * 页面的初始数据
   */
  data: {
      fbtype:"功能障碍",
      content:"",
      contacts:"",
      isDisabled:true,
  },
  //问题类型的获取
  handleType(){
    let list =['功能障碍','传感器出错',"开关障碍","建议","其他"];
    // console.log("点击了")
    wx.showActionSheet({
      itemList: list,
      success:(val)=>{
        // console.log(val)
        // console.log(list[val.tapIndex])   //取得点击的选项值
        this.setData({ fbtype:list[val.tapIndex]})
      },
      fail(){}
    })
  },
  // 描述和电话文本域内容的获取
  textValue(e){
    // console.log(e)
    let id =e.currentTarget.id;
    // console.log(id)
    let val = e.detail.value;
    // console.log(val)
    if(id=="content"){
      this.setData({content:val}) 
    }
    else{
      this.setData({contacts:val})
    }
    if(this.data.content!=""&&this.data.contacts!=""){ 
      this.setData({isDisabled:false})
    }else{
      this.setData({isDisabled:true})
    }
    // console.log(this.data)
  },
  handleSaveBtu(){
    let date = new Date().toLocaleDateString().split('/').join('-');;
    //拼接请求参数
    let params ={
      username:app.globalData.userInfo.nickName,
      time:date,
      ...this.data
    }
    // console.log(params)
    //将反馈信息写入数据库
    wx.request({
      url: `${app.apiAddress}/feedBack`,
      method:"post",
      data:params,
      success:(res)=>{
        // console.log(res)
        if(res.statusCode==200)
        {
          wx.showToast({
            title: res.data,
          })
          //反馈成功后返回信息页面
          setTimeout(()=>{
            wx.switchTab({
              url: '/pages/myTabBar/myTabBar',
            })
          },3000)
        }
      }
    })
    // console.log(this.data)
  },
})