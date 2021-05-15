
Page({
  
  data: {
   
  },
  onLoad:function(){
    console.log("进入")
    wx.request({
      url: 'http://localhost:9000/wx',
      success(res){
        console.log(res)
      }
    })
  }
  
});