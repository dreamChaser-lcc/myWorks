<template >
  <div class="wrap">
    <!-- 导航面包屑 -->
    
      <el-breadcrumb class="home" separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/Welcome' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/equipment' }">设备管理</el-breadcrumb-item>
        <el-breadcrumb-item :to="{ path: '/equipment' }">设备信息</el-breadcrumb-item>
      </el-breadcrumb>
    
    <!-- 搜索框 -->
    <el-card  style="background:#272B34;color:#DEB185;border:none">
      <el-row :gutter="20">
        <el-col :span="8">
          <el-input v-model="queryInfo.query" placeholder="请输入需要查询的设备ID">
            <el-button slot="append" icon="el-icon-search" @click="findEqInfo"></el-button>
          </el-input>
        </el-col>
        <el-col :span="2">
          <el-button @click="bindEqDialogOpen()" type="success">绑定设备</el-button>
        </el-col>
      </el-row>
    </el-card>
    <el-card style="background:#272B34;color:#DEB185;border:none">
      <el-button type="warning" @click="removeBindEq">解除绑定</el-button>
    </el-card>
    <!-- 列表区 -->
    <div>
      <el-table
        border
        :data="EqList"
        style="width:100%;border:1px solid #fff;border-radius:5px;box-shadow:-10px 10px 5px #000;"
        @selection-change="selsChange"
        :cell-style="bodyCell" 
        :header-cell-style="headerCell"
      >
        <el-table-column type="selection" width="55"></el-table-column>

        <el-table-column prop="eqName" label="设备ID" width="100px"></el-table-column>
        <el-table-column prop="state" label="状态" width="100px" style="align:center">
          <template slot-scope="scope">
            <span v-if="scope.row.state">
              <el-button type="success">正常</el-button>
            </span>
            <span v-else>
              <el-button type="danger">异常</el-button>
            </span>
          </template>
        </el-table-column>
        <el-table-column prop="userName" label="绑定用户">
          <template slot-scope="scope">
            <span v-if="scope.row.userName==='' ">无</span>
            <span v-else>{{scope.row.userName}}</span>
            <!-- {{scope.row.userName}} -->
          </template>
        </el-table-column>

        <el-table-column prop="state" label="绑定状态">
          <template slot-scope="scope">
            <span v-if="scope.row.state">true</span>
            <span v-else>
              <el-button type="danger" @click="updateEqDialog(scope.row)">异常</el-button>
            </span>
          </template>
        </el-table-column>
        <el-table-column prop>
           <template slot-scope="scope">
           <router-link  :to="{name:'getEqData',params:{data:scope.row}}"> 
             <el-button icon="el-icon-view">
               查看实时状况
             </el-button>
             </router-link>
          </template>
        </el-table-column>
        <el-table-column prop label="操作">
          <template slot-scope="scope">
              <el-button @click="detailEq(scope.row)" type="warning" icon="el-icon-notebook-2" size="small">详情</el-button>
            <el-button @click="deleteEq(scope.row)" type="danger" icon="el-icon-delete" size="small"></el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <!-- 翻页块 -->
    <div class="block">
      <span class="demonstration"></span>
      <!-- @size-change="handleSizeChange"
      @current-change="handleCurrentChange"-->
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="queryInfo.pageNum"
        :page-sizes="[3,5,8]"
        :page-size="queryInfo.pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </div>
    <!-- bindDialog区 -->
    <el-dialog title="绑定设备" :visible.sync="isDialogVisible" width="40%"  @close="bindEqDialogClose()"> 
      <el-form  :model="eqForm" label-width="75px" ref="bindEqFormRef">
        <el-form-item prop="eqName" label="设备号:">
          <el-input v-model="eqForm.eqName" placeholder="请填写需要绑定的设备ID"></el-input>
        </el-form-item>
        <el-form-item prop="userName" label="用户名:">
          <el-input v-model="eqForm.userName" placeholder="请填写需要绑定的用户名"></el-input>
        </el-form-item>
      </el-form>

      <el-row slot="footer">
        <el-col :span="2" :push="5">
          <el-button type="success" @click="bindEq" plain>确认提交</el-button>
        </el-col>
        <el-col :span="4" :push="9">
          <el-button type="info" plain @click="bindEqDialogClose()">取消</el-button>
        </el-col>
      </el-row>
    </el-dialog>
    <!-- 设备详情弹窗 -->
    <el-dialog title="设备详情" :visible.sync="isDialogDetail" width="50%">
          <div style="font-size:15px">
            <el-row :gutter="20">
              <el-col :span="12"><strong class="detailSpan">产品ID：</strong>{{this.detailData.productKey}}</el-col>
              <el-col :span="12"><strong class="detailSpan">产品密钥：</strong>{{this.detailData.productSecret}}</el-col>
            </el-row>
            <el-divider></el-divider>
             <el-row :gutter="20">
              <el-col :span="12"><strong class="detailSpan">设备ID：</strong>{{this.detailData.eqName}}</el-col>
              <el-col :span="12"><strong class="detailSpan">设备密钥：</strong>{{this.detailData.deviceSecret}}</el-col>
            </el-row>
            <el-divider></el-divider>
             <el-row :gutter="20">
              <el-col :span="12"><strong class="detailSpan">绑定用户：</strong>{{this.detailData.userName}}</el-col>
              <el-col :span="12"><strong class="detailSpan">绑定状态：</strong>{{this.detailData.state?'绑定成功':"未绑定"}}</el-col>
            </el-row>
            <el-divider></el-divider>
          </div>
          <span slot="footer">
              <el-button @click="isDialogDetail=false">确定</el-button>
          </span>
    </el-dialog>

  </div>
</template>
<script>
export default {
  data() {
    return {
      queryInfo: {
        query: "", //查询的用户信息
        pageNum: 1, //当前页数
        pageSize: 3, //每页展示
      },
      sles: [],
      EqList: [],
      total: 0,
      // bindDialog窗体的数据
      eqForm: {
        eqName: "",
        userName: "",
      },
      isDialogVisible: false,
      isDialogDetail:false,
      detailData:{},
    };
  },
  created() {
    this.getAllEq();
  },
  methods: {
    //表头样式
    headerCell({rowIndex,columnIndex,row,column}){
      // console.log(rowIndex,columnIndex,row,column)
      return "background:#272B34;color:#DEB185;text-align:center;font-size:15px"
    },
    //表格组成
    bodyCell(e){
      // console.log(e)
      if(e.columnIndex == 5)
      {
      return "background:#409EFF;color:#fff;text-align:center";
      }
      else{
        return "background:#409EFF;color:#fff;border-right:1px solid #fff;text-align:center";
      }
    },
    // 获取所有用户数据
    async getAllEq() {
      const { data: res } = await this.$http.get("getEqList", {
        params: this.queryInfo,
      });
      //  console.log(res);
      this.EqList = res.allEq;
      //  console.log(this.EqList);
      this.total = res.numbers;
    },
    handleSizeChange(newsize) {
      this.queryInfo.pageSize = newsize;
      this.getAllEq();
    },
    handleCurrentChange(currentPage) {
      this.queryInfo.pageNum = currentPage;
      this.getAllEq();
    },
    bindEqDialogOpen() {
      // console.log("开启"),
      this.isDialogVisible = true;
    },
    bindEqDialogClose() {
      // alert("dian");
      this.$refs.bindEqFormRef.resetFields();
      this.isDialogVisible = false;
    },
    // 搜索框,查询设备ID条件
    findEqInfo() {
      this.getAllEq();
    },
    // 打开绑定设备的Dialog窗
    updateEqDialog(scope) {
      this.eqForm.eqName = scope.eqName;
      this.bindEqDialogOpen();
    },
    // 绑定设备或修改状态中的确认提交函数
    async bindEq() {
      const { data: res } = await this.$http.get("bindEq", {
        params: this.eqForm,
      });
      if (res != "success") {
        this.$message.error("绑定失败!");
        return;
      }
      this.$message.success("绑定成功!");
      this.getAllEq();
      this.bindEqDialogClose();
    },
    detailEq(scope){
      console.log(scope)
      this.detailData = scope;
      this.isDialogDetail =true;
    },
    //删除设备根据id
    async deleteEq(scope) {
      const confirmResult = await this.$confirm(
        "此操作将永久删除设备，是否继续？",
        "提示",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        }
      ).catch((err) => err);
      if (confirmResult != "confirm") {
        return this.$message.info("已取消删除");
      }
      // console.log(scope);
      const { data: res } = await this.$http.delete("deleteEq?id=" + scope.id);
      // console.log(res);
      if (res != "success") {
        return this.$message.error("删除设备失败");
      }
      this.$message.success("删除设备成功!!");
      this.getAllEq();
    },
    //多项操作,获取已经勾选的值
    selsChange(val) {
      this.sels = val;
      // for(var i=0;i<this.sels.length;i++)
      //  console.log(this.sels)
    },
    //解除设备绑定
    async removeBindEq() {
      //  console.log(this.sels)

      if (this.sels != null && this.sels.length > 0) {
        for (var i = 0; i < this.sels.length; i++) {
          const { data: res } = await this.$http.put(
            "removeBindEq?id=" + this.sels[i].id
          );

          if (res != "success") {
            return this.$message.error("操作失败,请重试!");
          }
          //  console.log(this.sels[i].id)
          // console.log(res);
        }
        this.$message.success("操作完成");
        this.getAllEq();
      } else {
        console.log("未勾选");
        return this.$message.error("请选择要解除的设备");
      }
    },
     getEqData(scope){
        console.log(scope)
        this.$router.push("/");
    },
  },
};
</script>
<style lang="less" scoped>

.home /deep/ .el-breadcrumb__inner.is-link{
  color:#DEB185
}
.home /deep/ .el-breadcrumb__inner.is-link:hover{
  color: blue;
} 
.wrap {
  background-color: #272B34;
  height: 100%;
}
el-table {
  text-align: center;
}
.detailSpan{
  display:inline-block;
  width:80px;
  text-align:center
}
</style>