// components/Gz_state/Gz_state.js
import * as echarts from '../ec-canvas/echarts';
let chart = null;
function initChart(canvas, width, height, dpr) {
//    console.log(canvas,width,height, dpr)
        chart = echarts.init(canvas, null, {
            width: width,
            height: height,
            devicePixelRatio: dpr // new
        });
        canvas.setChart(chart);
        var XName = ["0:00", "2:00", "4:00", "6:00", "8:00", "10:00","12:00", "14:00", "16:00", "18:00", "20:00", "22:00","24:00"];
        var data1 = [, ,, , , , ];
        var img = '';

        var data = [{
            coords: [
                ['0:00', 67],
                ['2:00', 97],
                ['4:00', 51],
                ['6:00', 338],
                ['8:00', 32],
                ['10:00', 11],
                ['12:00', 1],
                ['14:00', 67],
                ['16:00', 97],
                ['18:00', 51],
                ['20:00', 338],
                ['22:00', 32],
                ['24:00', 11],
            
            ]
        }]
        // console.log(data)
        // console.log(data1)
    let option ={
        backgroundColor: '#0e2147',
        grid: {
            // left: '5%',
            // top: '5%',
            // bottom: '5%',
            // right: '5%',
        },
        legend: {
            type: "scroll",
            data: ["24H烟雾浓度变化"],
            itemWidth: 18,
            itemHeight: 12,
            textStyle: {
                color: "#00ffff",
                fontSize: 14
            },
        },
        yAxis: [{
            type: 'value',
            position: 'left',
            nameTextStyle: {
                color: '#00FFFF'
            },
            splitLine: {
                lineStyle: {
                    type: 'dashed',
                    color: 'rgba(135,140,147,0.8)'
                }
            },
            axisLine: {
                show: false
            },
            axisTick: {
                show: false
            },
            axisLabel: {
                formatter: '{value}',
                color: '#fff',
                fontSize: 14
            }
        }, ],
        xAxis: [{
            type: 'category',
            axisTick: {
                show: false
            },
            axisLine: {
                show: false,
                lineStyle: {
                    color: '#0696f9',
                }
            },
            axisLabel: {
                inside: false,
                textStyle: {
                    color: '#fff', // x轴颜色
                    fontWeight: 'normal',
                    fontSize: '14',
                    lineHeight: 22
                }

            },
            data: XName,
        }, ],
        series: [{
                symbolSize: 5,
                // symbol: img,
                name: '24H光照变化',
                type: "line",
                data: data1,
                itemStyle: {
                    normal: {
                        borderWidth: 5,
                        color: '#0696f9',
                    }
                }
            },
            {
                name: '滑行的光点',
                type: 'lines',
                coordinateSystem: 'cartesian2d',
                symbolSize: 30,
                polyline: true,
                effect: {
                    show: true,
                    trailLength: 0,
                    symbol: "arrow",
                    period: 10, //光点滑动速度
                    symbolSize: 15,
                    // symbol: img
                },
                lineStyle: {
                    normal: {
                        width: 1,
                        opacity: 0.6,
                        curveness: 0.2
                    }
                },
                data: data
            }
        ],
    };
    chart.setOption(option);
    return chart;
}

Component({
  /**
   * 组件的属性列表
   */
  properties: {
      legendGz:{
        type:Array,
        value:[]
      }
  },
  /**
   * 组件的初始数据
   */
  data: {
    legendGz:[],
    ec: {
      onInit: initChart
    }
  },
  observers:{
    'legendGz':function(num){
      this.handleChange();
    },
  },
  /**
   * 组件的方法列表
   */
  methods: {
    handleChange(){
        setTimeout(()=>{
            // console.log('我改变饿了')
            wx.hideLoading()
            this.created();
          },1000)
    },
    created(){
        let y = ["0:00", "2:00", "4:00", "6:00", "8:00", "10:00","12:00", "14:00", "16:00", "18:00", "20:00", "22:00"];
        setTimeout(()=> {
        y=y.map((item,index)=>{
            var s = [];
            s.push(item);
            s.push(this.data.legendGz[index]);
            return s	
        })
        let k ={};
        k.coords=y
        let c =[];
        c.push(k);
        // console.log(c)
        chart.setOption({ series: [{data:this.data.legendGz},{data:c}]});
        }, 0);
      },
  }
})

