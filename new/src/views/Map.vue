<template>
  <div class="map">
    <ve-map
      :data="chartData"
      height="600px"
      width="600px"
      :settings="chartSettings"
      :extend="chartExtend"
    ></ve-map>
  </div>
</template>
<script>
export default {
  name: "hello2",
  data() {
    this.chartExtend={
         tooltip: {
            trigger: 'item',
            formatter:(params)=>{
                var than =this;
                this.$http.get('getMap',{       // 还可以直接把参数拼接在url后边
                    params:{
                        "address":params.name
                    }
                }).then(function(res){
                    //  console.log(res.data)
                     than.userCount = res.data;
                    // console.log(count);
                    
                  })
                  .catch((error)=>{
                    // alert(error)
                     this.$message.error("请求数据错误");
                  })
             
              return params.name +"<br> 用户数：" +this.userCount ;
            },
           },
    },
      (this.chartSettings = {
        position: "china",
        label: false,

        itemStyle: {
          normal: {
            borderColor: "#00f",
          },
        },
        label: {
          show: true,
          fontSize: 10,
          // normal: {
          //   // borderColor: "#00f",
          //   formatter:(params)=>{
          //     console.log(params.name)
          //     return params.name
          //   }
          // }
        },
        zoom: 0.8,
        mapGrid: {
          left: 20,
          right: 20,
          top: 0,
          bottom: 150,
        },
        aspectScale: 0.5,
        roam: true, //鼠标缩放与平移
      });

    return {
      userCount: 0,
      chartData: {
        columns: ["位置", "用户数"],
        rows: [
          // { 位置: "吉林", 用户数: 2 },
          // { 位置: "北京", 用户数: 2 },
          // { 位置: "上海", 用户数: 2 },
          // { 位置: "浙江", 用户数: 2 },
        ],
      },
    };
  },
};
</script>
<style lang="less" scoped>
.map {
  background-color: #61a0a8;
}
</style>