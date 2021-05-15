// components/ls_state/ls_state.js
Component({
  /**
   * 组件的属性列表
   */
  properties: {
    dataList:{
      type:Array,
      //默认值
      value:""
    },
  },
  /**
   * 组件的初始数据
   */
  data: {
      //不执行，执行父组件传来的数据
      dataList:[
        // { "wd" : "37°C","ph" : "7","zl" : "38kg","gz" : "78Lux","sj" : "2020-06-15 12:00",},
        // { "wd" : "37°C","ph" : "7","zl" : "38kg","gz" : "78Lux","sj" : "2020-06-16 12:00",},
        // { "wd" : "37°C","ph" : "7","zl" : "38kg","gz" : "78Lux","sj" : "2020-06-17 12:00",},
        // { "wd" : "37°C","ph" : "7","zl" : "38kg","gz" : "78Lux","sj" : "2020-06-18 12:00",},
        // { "wd" : "37°C","ph" : "7","zl" : "38kg","gz" : "78Lux","sj" : "2020-06-19 12:00",},
      ],
      currentPage:1, //unused
      totalPage:10, //unused
  },
  /**
   * 组件的方法列表
   */
  methods: {
    //点击上一页，unused
     prePage(e){
        if(this.data.currentPage>1){
          this.setData({
            currentPage:--this.data.currentPage
          })
        }
        this.reque();
     },
    //  点击下一页触发函数，unused
     nextPage(e){
        //console.log(e)
        if(this.data.currentPage<this.data.totalPage){
          this.setData({
            currentPage:++this.data.currentPage
          })
          // let that =this;
          this.reque();
          // console.log(this.data.dataList.length)
        }
     },
     //访问后端调用数据,unused
     reque(){
       let that =this;
        wx.request({
          url:"http://192.168.43.67:9000/getDataList",
          method:"post",
          data:{
            eqName:'设备1',
            currentPage:that.data.currentPage
          },
          success(res){
            // let dataList=res.data;
            that.setData({
              dataList:res.data,
            })
            //console.log(that.data.dataList)
          }
      })
    } 
  }
})
