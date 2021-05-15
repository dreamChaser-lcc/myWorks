
<template>
  <el-row :gutter="20" class="box">
    <el-col :span="9" class="left-col">
      <el-row>
        <el-card  style="box-shadow:10px 10px 5px #000;">
          <div class="info_box" style="border-bottom:1px solid black">
            <!-- 调整i标签的大小通过调整字体大小而该表 -->
            <i  class="el-icon-user-solid" style="font-size:150px;color:rgb(202, 202, 202)"></i>
            <div>
              <p>用户名：{{this.user.username}}</p>
              <p>权限：管理员用户</p>
            </div>
          </div>
          <div style="font-size:14px;">
            <p>当前登录时间：{{this.currentTime}}</p>
          </div>
        </el-card>
      </el-row>
      <el-row>
        <el-card  style="height:290px;box-shadow:10px 10px 5px #000;">
          <h2>用户反馈信息</h2>
            <!-- <p v-for="item in 3" :key="item">温度数据监控失败，时间2020-09-20</p> -->
            <el-table  border :data="this.WelcomeInfo.allFeedBack">
                <el-table-column prop="content" label="反馈内容">
                </el-table-column>
                <el-table-column prop="time" label="时间">  
                </el-table-column>
            </el-table>
         
        </el-card>
      </el-row>
    </el-col>
    <el-col :span="15" class="right-col">
      <div class="num">
        <el-card shadow="hover">
          <i style="color:rgb(202, 202, 202)" class="iconfont icon-wode1"></i>
          <div class="detail">
            <!-- <p class="money">20</p> -->
            <p class="txt">所有会员用户：{{this.WelcomeInfo.userCount}}人</p>
          </div>
        </el-card>
        <el-card shadow="hover">
          <i class="el-icon-star-on" style="color:#FF3333"></i>
          <div class="detail">
            <!-- <p class="money">20</p> -->
            <p class="txt">已绑定用户：{{this.WelcomeInfo.bindEq}}人</p>
          </div>
        </el-card>
        <el-card shadow="hover">
          <i style="color:#61A0A8" class="el-icon-cpu"></i>
          <div class="detail">
            <!-- <p class="money">200</p> -->
            <p class="txt">总设备数：{{this.WelcomeInfo.bindEq+this.WelcomeInfo.unBindEq}}个</p>
          </div>
        </el-card>
      </div>
      <el-card style="box-shadow:10px 10px 5px #000;">
        <div style="height:400px;">
          <hello3></hello3>
        </div>
      </el-card>
    </el-col>
  </el-row>
  <!-- <div> <h3>欢迎访问Welcome</h3>
                <hello></hello>
  </div>-->
</template>
<script>
import hello2 from "./NavList/Sport";
import hello from "./NavList/Rights";
import hello3 from "../views/Map";
export default {
  components: {
    hello,
    hello2,
    hello3,
  },
  data(){
       return{   
        WelcomeInfo:[],
        user:[],
        currentTime:'',
       }
  },
  created() {
    this.currentTime = new Date().toLocaleString();
    // 从登录界面传来的用户sessionStorage
    const res = window.sessionStorage.getItem("user");
    // console.log(res)
    this.user = JSON.parse(res); 
    console.log("user",this.user)
    // console.log(this.WelcomeInfo);
    // 初始值触发获取页面数据函数
    this.getWelcome();
  },
  methods: {
      // 获取整个界面的数据
      async getWelcome(){
        const {data:res} = await this.$http.get("getWelcome?username="+this.user.username);

        this.WelcomeInfo =res;
        console.log('所有')
           console.log(this.WelcomeInfo);
           if(res.allFeedBack.length>0)
           {
             this.$notify({
                title: '提示',
                message: `当前有${res.allFeedBack.length}条反馈信息未处理`,
                duration: 0
              });
           }
      },   

  },
};
</script>
<style lang="less" scoped>
@import url("../assets/css/welcome.less");
//  <!-- :cell-style="{background:'#272B34'}" :row-style="{background:'#272B34',color:'#DEB185'}" -->
/deep/ .el-table th{
  background:#272B34 !important;
  color:#DEB185 !important;
  text-align: center !important;
}
/deep/.el-table tr{
  background:#272B34 !important;
  color:#DEB185 !important;
  text-align:center !important;
}
/deep/ .el-table tr:hover{
  background: #272B34 !important;
}
</style>