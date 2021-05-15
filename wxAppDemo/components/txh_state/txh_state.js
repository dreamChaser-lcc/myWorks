import * as echarts from '../ec-canvas/echarts';
var chart = null;


function initChart(canvas, width, height, dpr) {
    // console.log(canvas,width,height)
   chart = echarts.init(canvas, null, {
    width: width,
    height: height,
    devicePixelRatio: dpr // new
  });
  canvas.setChart(chart);
  //console.log(this);
  var option = option = {
    xAxis: {
        type: 'category',
        data: ["0:00", "2:00", "4:00", "6:00", "8:00", "10:00","12:00", "14:00", "16:00", "18:00", "20:00", "22:00", "24:00"],
    },
    legend: {
      data: ['24H温度变化']
    },
    yAxis: {
        type: 'value'
    },
    series: [{
        name:'24H温度变化',
        // data: [1,52,3,4,9,10],
        type: 'line'
    }]
};
  chart.setOption(option);
  return chart;
}
// components/txh_state/txh_state.js

Component({
  /**
   * 组件的属性列表
   */
  properties: {
      legendWd:{
        type:Array,
        value:[]
      }
  },
  // created: function () {
  //   let that =this;
  //   wx.showLoading({
  //     title: '正在加载',
  //   })
  //    setTimeout(function () {
  //    wx.hideLoading()
  //   //  console.log(that.data.legendWd)
     
  //    chart.setOption({ series: [{ data: that.data.legendWd}]});
  //   }, 1000);
  // },
  //监听legendWd
  observers:{
    'legendWd':function(num){
      this.handleChange();
    },
  },
  /**
   * 组件的初始数据
   */
  data: {
   
    ec: {
      onInit: initChart
    },
    
  },
  /**
   * 组件的方法列表
   */
  methods: {
    handleChange(){
      wx.showLoading({
        title: '正在加载',
      })
      setTimeout(()=>{
        chart.setOption({ series: [{ data: this.data.legendWd}]});
      },1000)
      
      // this.chart.setOption({ series: [{ data: this.data.legendWd}]});
    }
  }
})
