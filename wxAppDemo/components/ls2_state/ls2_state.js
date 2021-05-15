
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
  created(){
    console.log(this.data.dataList)
  },
  /**
   * 组件的初始数据
   */
  data: {
      dataList:[
        
        // { "wd" : "38度","ph" : "8du","zl" : "38kg","gz" : "78Lux","sj" : "2020-06-17 12:00",},
        // { "wd" : "38度","ph" : "8du","zl" : "38kg","gz" : "78Lux","sj" : "2020-06-15 12:00",},
        // { "wd" : "38度","ph" : "8du","zl" : "38kg","gz" : "78Lux","sj" : "2020-06-16 12:00",},
        // { "wd" : "38度","ph" : "8du","zl" : "38kg","gz" : "78Lux","sj" : "2020-06-17 12:00",},
        // { "wd" : "38度","ph" : "8du","zl" : "38kg","gz" : "78Lux","sj" : "2020-06-15 12:00",},
      ]
  },

  /**
   * 组件的方法列表
   */
  methods: {

  }
})
