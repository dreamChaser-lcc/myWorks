<template>
  <!-- <div>值:{{this.eqData}}
        <div>{{this.eqData.eqName}}</div>    
  </div>-->
  <div>
    <!-- 面包屑导航 -->
    <el-breadcrumb class='home' separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/Welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/equipment' }">设备管理</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/equipment' }">设备信息</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/getEqData' }">设备实时状态</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 查询对象 -->
    <el-card class="targetUser" >
      <span> 当前查询设备：
        <strong class="Eitem">{{this.eqData.eqName}}</strong>
      </span>
      <span class="second-child" >使用用户：<strong class="Eitem">{{this.eqData.userName}}</strong> </span>
      <span class="second-child" >数据更新时间：<strong class="Eitem">{{this.current.time}}</strong> </span>
      <span class="third-child" >实时刷新 <el-switch v-model="refresh" active-color="#061740"></el-switch></span>
    </el-card>
    <div class="container">
        <div class="first-child">
        <el-card style="margin-bottom:20px;box-shadow:10px 10px 5px #000;text-align:center">
        小灯开关  <el-switch style="margin-left:20px;" :disabled="disable" v-model="current.ledSwitch" active-color="green"></el-switch>
        </el-card>
        </div>
         <div class='two-child'>
        <el-card style="margin-bottom:20px;box-shadow:10px 10px 5px #000;text-align:center">
         室内湿度：
          <strong class="Eitem">{{current.hum}}%</strong>
        </el-card>
        </div>
         <div class='three-child'>
        <el-card style="margin-bottom:20px;box-shadow:10px 10px 5px #000;text-align:center">
        风扇开关  <el-switch v-model="current.fanSwitch" :disabled="disable" style="margin-left:20px;" active-color="green"></el-switch>  
        </el-card>
        </div>
         <div class='four-child'>
        <el-card style="margin-bottom:20px;box-shadow:10px 10px 5px #000;text-align:center">
         烟雾浓度：
         <strong class="Eitem"> {{current.smoke}}ppm</strong>
        </el-card>
        </div>
    </div>
    <!-- 可视化图形 -->
    <div>
      <el-row :gutter="20" style="margin-bottom:10px">
        <el-col :span="12">
          <el-card style="height:360px">
            <zl :params="this.params" :wd="this.current.wd" ref="child1" style="margin:auto;margin-top:10px"></zl>
            <div style="margin-top:20px;text-align:center">室内温度</div>
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card style="height:360px;margin:auto">
            <gz :eqName="this.eqData.eqName" :smoke="this.smokeList" ref="child2" :refresh="this.refresh"></gz>
            <!-- <gz></gz> -->
            <div style="margin-top:-25px;text-align:center">最近四小时内烟雾浓度变化</div>
          </el-card>
        </el-col>
      </el-row>
      <!-- <el-row :gutter="20">
        <el-col :span="12">
          <el-card>
            <wd></wd>
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card>
            <ph></ph>
          </el-card>
        </el-col>
      </el-row> -->
      
    </div>
  </div>
</template>
<script>
//引入组件
import wd from "./EqData/wdLegend";
import ph from "./EqData/phLegend";
import gz from "./EqData/gzLegend";
import zl from "./EqData/zlLegend";
export default {
  //声明组件的名称
  components: {
    wd,
    ph,
    zl,
    gz,
  },
  data() {
    return {
      disable:true,
      refresh:0,
      timer:"",
      is:1,
      eqName: "sdad",
      eqData:{},
      current:{},
      smokeList:[],
      params:{    //传入后端的参数
        productKey:'',
        productSecret:'',
        deviceSecret:'',
        eqName:'',
        userName:'',
        state:'',
      }
    };
  },
  watch:{
    refresh(e){
     if(e===true)
      {
       this.autoRefresh();
      }
      else{
        clearInterval(this.timer);
      }
    },
    smokeList(e){
      this.$refs.child2.init(this.refresh,e);
    }
  },
  created() {
    //默认清除上次未关闭自动刷新的定时器
    clearInterval(this.timer);
    if (this.$route.params.data==null||this.$route.params.data.state != true) {
      this.$message.error( "该设备异常，请重新选择访问，2秒后将自动返回！！" );
      //设置定时函数
      setTimeout(() => {
        //设置延迟函数，1000ms后进行箭头函数里的内容
        this.$router.go(-1); //返回历史的上一页
      }, 2000);
    } else {
      this.eqData = this.$route.params.data;
      this.params = {...this.$route.params.data}
      // console.log("router--params",this.$route.params)
       this.getEqData();
    }
  },
  destroyed(){
    //销毁定时器
    clearInterval(this.timer);
  },
  methods:{
      async getEqData(){
          const { data: res } = await this.$http.get("/currentEqData",{params:this.params});
          // console.log(res);
          if(res.currentEqData&&res.smokeList){
              let {currentEqData,smokeList} =res;
              this.smokeList = smokeList;
              this.current = currentEqData;
              // this.current = res;
              // // 将开关转换成Boolean值
              this.current.ledSwitch = Boolean(this.current.ledSwitch); 
              // console.log(this.current) 
          }else{
              this.$message.error( "该设备异常，请重新选择访问，2秒后将自动返回！！" );
              //设置定时函数
              setTimeout(() => {
                //设置延迟函数，1000ms后进行箭头函数里的内容
                this.$router.go(-1); //返回历史的上一页
              }, 2000);
          }
      },   
      autoRefresh(){
        this.timer=setInterval(()=>{
          //获取并更新数据
          this.getEqData();
          //父组件通过ref触发子组件的方法可以传值
          this.$refs.child1.update(this.current.wd);
          // this.smokeList =[500,600,700,900]
          this.$refs.child2.update(this.refresh,this.smokeList);
          // this.current.wd++;
        },5000)
      }
  }
};
</script>
<style lang="less" scoped>
.home /deep/ .el-breadcrumb__inner.is-link{
  color:#DEB185
}
.home /deep/ .el-breadcrumb__inner.is-link:hover{
  color: blue;
} 
.targetUser{
   margin-bottom:20px;
   box-shadow:10px 10px 5px #000;
  //  color:red;
   .first-child{
     
   }
   .second-child{
     display:inline-block;
     margin-left:50px
   }
  .third-child{
     display:inline-block;
     margin-left:50px;
     position:relative;
     left:10%;
   }
}
.Eitem{
      color:#061740;
}
.container{
  display:flex;
  .first-child{
     flex:1;
     margin-right:20px;
   }
   .two-child{
     flex:1;
     margin-right:20px;
   }
   .three-child{
     flex:1;
     margin-right:20px;
   }
   .four-child{
     flex:1;
   }
 }
</style>