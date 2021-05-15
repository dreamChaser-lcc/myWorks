<template>
  <div class="gz">
    <!-- {{num}} -->

    <ve-line
      :data="chartData"
      :settings="chartSettings"
      :mark-line="markLine"
      height="290px"
      width="450px"
    ></ve-line>
  </div>
</template>
<script>
export default {
  name: "gz",
  props: ["eqName","smokeList"],
  // 初始周期函数
  created() {
      //  this.getEqData();
  },
  beforeDestroy(){
     clearInterval(this.timer);
  },
  
  data() {
    this.markLine = {
      data: [
        {
          yAxis: 900,
          label: {
            show: "true",
            position: "middle",
            formatter: "标准值:(900)",
            color: "#FA6E86",
            fontSize: 15,
          },
          lineStyle: {
            color: "#FA6E86",
            width: 1,
          },
        },
        // 需要最大最小值则画第二条线
        // {
        //   yAxis: 7,
        //   label: {
        //     show: "true",
        //     position: "middle",
        //     formatter: "标准值:(7)",
        //     color: "red",
        //     fontSize: 15,
        //   },
        //   lineStyle: {
        //     color: "red",
        //     width: 1,
        //   },
        // },
      ],
    };
    this.visualMap = [
      {
        type: "piecewise",
        splitNumber: 5,
        min: 0,
        max: 10,
        right: -80,
        top: "50%",
      },
    ];

    this.chartSettings = {   //setting配置
      stack: { 数据: ["smoke"] },
      area: true,
      legendName: {'smoke': "烟雾浓度单位ppm" },   //上方图例别名
    };
    return {
      chartData: {
        columns: ["date", "smoke"],
        rows: [
          // { '日期': '9-21', '访问用户': 1393, '下单用户': 1093,下单率：200 },
          { date: "9-22", smoke: 8 },
          { date: "9-23", smoke: 5 },
          { date: "9-24", smoke: 9 },
          { date: "9-25", smoke: 8 },
        ],
      },
      eqData:[],
      // obj:{date: '9-28', yw: 5},
    };
  },
  methods:{
    init(reAble,smokeList){
      //  console.log('我进来二零e')
       this.update(reAble,smokeList);
    },
    update(reAble,smokeList){
      // console.log(reAble,smokeList) 
      let date =new Date();
      let currentDate = date.getHours();
      for(var i=0;i<smokeList.length;i++)
        {
          // console.log(smokeList[i])
          this.chartData.rows[i].date =currentDate-i+":00"; 
          this.chartData.rows[i].smoke =+smokeList[i];
        }
    },
    //动态折线图
    // async getEqData(){
    //   //  console.log(this.refresh)
    //     // console.log(this.eqName);
    //     const {data:res} =await this.$http.get("getEqData?eqName="+this.eqName);
    //     this.eqData =res;
    //     //  console.log(this.eqData.length);
    //     for(var i=0;i<this.eqData.length;i++)
    //     {
    //       console.log(this.eqData[i].ph)
    //       this.chartData.rows[i].PH = this.eqData[i].ph;
    //     }
    //     this.timer=setInterval(()=>{
    //       this.chartData.rows.shift();
    //       this.obj.日期 = this.eqData[0].ph;
    //       this.obj.PH = this.eqData[1].ph;
    //       this.chartData.rows.push(this.obj);
    //       console.log(this.chartData.rows)
    //     },10000);
    // },
  },

};
</script>
<style lang="less" scoped>
.map {
  background-color: #61a0a8;
}
.gz{
    width:200px;
    height:300px;
}
</style>