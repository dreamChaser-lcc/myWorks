<template>
  <div>
    <!-- 面包屑导航 -->
    <div>
      <el-breadcrumb  class="home" separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/Welcome' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/equipmentAdd' }">设备管理</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/equipmentAdd' }">绑定设备</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <el-card class="addCard" body-style="height:380px;margin-left:20px" style="margin:30px 20px;width:800px;box-shadow:10px 10px 5px #000">
      <el-row style="border-bottom:1px solid black;height:40px">
        添加设备
        <i class="el-icon-circle-plus-outline"></i>
      </el-row>

      <el-form   ref="addEqFormRef" :model="addEqForm" label-width="60px">
        <el-row style="height:60px" >
          <el-col :span="3">
            <h3>产品ID:</h3>
          </el-col>
          <el-col :span="19" :pull="2">
            <el-form-item prop="productKey">
              <el-input v-model="addEqForm.productKey" placeholder="请填写产品ID号:ProductKey"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row style="height:60px">
          <el-col :span="3">
            <h3>产品密钥:</h3>
          </el-col>
          <el-col :span="19" :pull="2">
            <el-form-item prop="productSecret">
              <el-input v-model="addEqForm.productSecret" placeholder="请填写产品密钥：ProductSecret"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row style="height:60px">
          <el-col :span="3">
            <h3>设备ID:</h3>
          </el-col>
          <el-col :span="19" :pull="2">
            <el-form-item prop="eqName">
              <el-input v-model="addEqForm.eqName" placeholder="请填写设备ID号：DeviceName"></el-input>
            </el-form-item>
          </el-col>
        </el-row> 
        <el-row style="height:60px">
          <el-col :span="3">
            <h3>设备密钥:</h3>
          </el-col>
          <el-col :span="19" :pull="2">
            <el-form-item prop="deviceSecret">
              <el-input v-model="addEqForm.deviceSecret" placeholder="请填写设备密钥：DeviceSecret"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <el-row style="height:60px">
        <el-col :span="4" :push="2" style="margin-right:50px"> 
          <el-button type="success" @click="submitAddEq()" plain>确认提交</el-button>
        </el-col>
        <el-col :span="5" :push="1">
          <el-button type="info" plain @click="resetAddEqForm()">重置</el-button>
        </el-col>
      </el-row>
    </el-card>
  </div>
</template>
<script>
export default {
  data() {
    return {
      addEqForm: {
        eqName: "",
        productKey: "",
        productSecret: "",
        deviceSecret:""
      },
    };
  },
  methods: {
    async submitAddEq() {
      // console.log("addEq",this.addEqForm);
      const { data: res } = await this.$http.post("/addEq", this.addEqForm);
      if (res != "success") {
        this.$message.error("添加设备失败");
        return;
      } else this.$message.success("添加设备成功！！");
      
      console.log(res);
    },
    resetAddEqForm() {
      this.$refs.addEqFormRef.resetFields();
    },
  },
};
</script>
<style lang="less" >
.home /deep/ .el-breadcrumb__inner.is-link{
  color:#DEB185
}
.home /deep/ .el-breadcrumb__inner.is-link:hover{
  color: blue;
}
.el-breadcrumb {
  //面包屑的样式
  margin-bottom: 15px;
  font-size: 15px;
}
// .arrow{
//   color:#DEB185 !important;
// }
.addCard {
  .el-row {
    height: 90px;
    .el-input {
      margin-top: 10px;
    }
  }
}
</style>