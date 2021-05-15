<template>
  <div>
    <!-- 面包屑导航  -->
    <el-breadcrumb class="home" separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/home' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/user' }">用户管理</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/user' }">用户列表</el-breadcrumb-item>
    </el-breadcrumb>
    <!-- 搜索卡片区域 -->
    <el-card style="border:none;" body-style="background:#272B34">
      <!-- gutter--栅格的间隔 -->
      <el-row :gutter="20">
        <!-- slot--插槽,append是表示插在尾部 -->
        <el-col :span="8">
          <el-input v-model="queryInfo.query" placeholder="请输入内容" clearable @clear="getUserList()">
            <el-button type="primary" slot="append" icon="el-icon-search" @click="getUserList()">搜索</el-button>
          </el-input>
        </el-col>
        <!-- 按钮 span是占多少个栅格,每行最多24个栅格 -->
        <el-col :span="2">
          <el-button type="primary" @click="addUserButton">添加用户</el-button>
        </el-col>
      </el-row>
      <!-- {{total}}
      {{userlist}}-->
    </el-card>
    <!-- 表格区域 :data绑定数据,遍历userlist的数据,prop是userlist里的属性名 -->
    <el-table :data="userlist" 
    style="margin:auto;border-radius:5px;border:1px solid #fff;box-shadow:10px 10px 5px #000;width:98%" 
    :cell-style="bodyCell"
    :header-cell-style="headerCell"
    >
      <el-table-column type="index"></el-table-column>
      <el-table-column label="姓名" prop="username"></el-table-column>
      <el-table-column label="联系方式" prop="contacts"></el-table-column>
      <el-table-column label="角色" prop="role"></el-table-column>
      <el-table-column label="状态" prop="state">
        <template slot-scope="scope">
          <!-- {{scope.row}} 每一行封存的数据 -->
          <el-switch
            active-color="#f00"
            v-model="scope.row.state"
            :disabled="scope.row.role=='普通用户'"
            @change="userStateChanged(scope.row)"
          ></el-switch>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="320px">
        <!-- 操作组件 -->
        <template slot-scope="scope">
          <el-button type="primary" icon="el-icon-edit" @click="updateDialogButton(scope.row.id)">编辑</el-button>
          <el-button icon="el-icon-notebook-2" @click="detailUser(scope.row.id)">详情</el-button>
          <el-button type="danger" icon="el-icon-delete" @click="deleteUser(scope.row.id)"></el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 页码部分 -->
    <div class="block" >
      <span class="demonstration"></span>
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="queryInfo.pageNum"
        :page-sizes="[2 , 5, 10, 20]"
        :page-size="5"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </div>
    <!-- 添加用户Dialog窗体 -->
    <el-dialog title="添加用户" :visible.sync="addDialogVisible" width="50%" @close="addDialogColsed()">
      <el-form :model="addFrom"  :rules="addFormRlues" ref="addFormRef" label-width="70px">
        <el-form-item label="用户名" label-width="80px" prop="username">
          <el-input v-model="addFrom.username"></el-input>
        </el-form-item>
        <el-form-item label="密码" label-width="80px" prop="password">
          <el-input v-model="addFrom.password"></el-input>
        </el-form-item>
        <el-form-item label="联系方式" label-width="80px" prop="contacts">
          <el-input v-model="addFrom.contacts"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class>
        <el-button @click="addDialogVisible=false">取消</el-button>
        <el-button @click="addUser()">确定</el-button>
      </span>
    </el-dialog>  
    <!-- 更新用户信息Dialog -->
    <el-dialog title="修改信息" :visible.sync="updateDialogVisible" width="50%" @close="updateDialogColsed()">
          <el-form :model="updateForm"  :rules="updateFormRlues" ref="updateRef" label-width="70px">
              <el-form-item label-width="80px" label="用户名" prop="usernmae">
                  <el-input v-model="updateForm.username"> </el-input>
              </el-form-item>
              <el-form-item 
              label-width="80px"
              label="密码" 
              prop="password">
                <el-input :disabled="updateForm.role!='管理员用户'" v-model="updateForm.password"> </el-input>
            </el-form-item>
              <el-form-item label="联系方式" label-width="80px" prop="contacts">
                  <el-input v-model="updateForm.contacts"> </el-input>
              </el-form-item>
          </el-form>
          <span slot="footer">
              <el-button @click="updateDialogVisible=false">取消</el-button>
              <el-button @click="updateUser()">确定</el-button>
          </span>
    </el-dialog>
    <!-- 详情页弹窗 -->
    <el-dialog title="用户详情" :visible.sync="detailDialogVisible" width="50%">
          <div style="font-size:15px">
             <strong style="display:inline-block;width:80px;text-align:center">用户名：</strong><span>{{this.detailFrom.username}}</span>
            <el-divider></el-divider>
             <strong style="display:inline-block;width:80px;text-align:left">联系方式：</strong><span>{{this.detailFrom.contacts}}</span>
            <el-divider></el-divider>
             <strong style="display:inline-block;width:80px;text-align:center">状态：</strong><span>{{this.detailFrom.state}}</span>
            <el-divider></el-divider>
            <strong style="display:inline-block;width:80px;text-align:center">角色：</strong><span>{{this.detailFrom.role}}</span>
            <el-divider></el-divider>
            <strong style="display:inline-block;width:80px;text-align:center">地址：</strong><span>{{this.detailFrom.address}}</span>
            <el-divider></el-divider>
          </div>
          <span slot="footer">
              <el-button @click="detailDialogVisible=false">确定</el-button>
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
        pageSize: 5, //每页展示
      },
      userlist: [],
      total: 0,
      updateDialogVisible: false,  //更新用户对话框是否可见
      addDialogVisible: false, //添加用户对话框是否可见
      addFrom: { //表单数据绑定对象
        username: "",
        password: "",
        contacts: "",
      },
      addFormRlues: { //添加用户的表单验证规则
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          {
            min: 3,
            max: 10,
            message: "请输入3 ~ 10 个字母或数字 ",
            trigger: "blur",
          },
        ],
        contacts: [
          { required: true, message: "请输入联系方式", trigger: "blur" },
          {
            min: 0,
            max: 20,
            message: "请输入1 ~ 20 个字母或数字",
            trigger: "blur",
          },
        ],
      },
      updateForm:{  //更新用户表单绑定的数据
        
      },
      updateFormRlues:{  //
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          {
            min: 3,
            max: 10,
            message: "请输入3 ~ 10 个字母或数字 ",
            trigger: "blur",
          },
        ],
         contacts: [
          { required: true, message: "请输入联系方式", trigger: "blur" },
          {
            min: 0,
            max: 20,
            message: "请输入1 ~ 20 个字母或数字 ",
            trigger: "blur",
          },
        ],
      },
      detailFrom:{

      },
      detailDialogVisible:false,
   }; 
  },
  //初始化周期函数
  created() {
    this.getUserList();
  },
  methods: {
    headerCell({rowIndex,columnIndex,row,column}){
      // console.log(rowIndex,columnIndex,row,column)
      return "background:#272B34;color:#DEB185;text-align:center;font-size:15px"
    },
    //表格组成
    bodyCell(e){
      // console.log(e)
      if(e.columnIndex == 6)
      {
      return "background:#409EFF;color:#fff;text-align:center";
      }
      else{
        return "background:#409EFF;color:#fff;border-right:1px solid #fff;text-align:center";
      }
    },
    //更新用户列表
    async getUserList() {
      const { data: res } = await this.$http.get("allUser", {
        params: this.queryInfo,
      });
      this.userlist = res.userAll;
      this.total = res.numbers;
    },
    // 页数,最大数
    handleSizeChange(newSize) {
      this.queryInfo.pageSize = newSize;
      this.getUserList();
    },
    //页数改变
    handleCurrentChange(newSize) {
      this.queryInfo.pageNum = newSize;
      this.getUserList();
    },
    //改变用户状态
    async userStateChanged(userInfo) {
      //const {data:res} = await this.$http.put('updateState?id='+userInfo.id+'&state='+userInfo.state);
      const { data: res } = await this.$http.put(
        `updateState?id=${userInfo.id}&state=${userInfo.state}`
      );
      if (res != "success") {
        userInfo.id = !userInfo;
        return this.$message.error("更改状态失败");
      }
      this.$message.success("更改状态成功");
    },
    // 关闭添加用户对话框
    addDialogColsed() {
      this.$refs.addFormRef.resetFields(); //重置表单所填写的数据
    },
    //用户详情
    async detailUser(rowId){
      // console.log("row",rowId)
      this.detailDialogVisible = true; //显示对话框
      const {data:res} = await this.$http.get("getUpdate?id="+rowId);
      // console.log(res)
      this.detailFrom =res;
    },
    // 添加用户函数
    addUser() {
      this.$refs.addFormRef.validate(async (valid) => {
        if (!valid) return;
        const {data:res} = await this.$http.post("addUser", this.addFrom);
        //  console.log("表单");
        // console.log(res);
        
          if (res !="success") {  //不能使用res="success"，作为判断语句，res
            this.$message.error("添加用户失败");
          } else this.$message.success("添加用户成功");
           this.addDialogColsed();  //清除表单数据
           this.addDialogVisible = false; // 关闭dialog弹窗
           this.getUserList(); //再次更新用户列表
      });
    },
    //添加用户按钮，点击弹出dialog对话框
    addUserButton() {
      this.addDialogVisible = true;
    },
    // 是否删除用户
    async deleteUser(id){
      // 自定义提示框 
    const confirmResult = await this.$confirm('此操作将永久删除用户，是否继续？','提示',{
        confirmButtonText : '确定', 
        cancelButtonText:'取消',
        type:'warning'
      }).catch(err=>err);
      if(confirmResult!='confirm'){
        return this.$message.info("已取消删除");
      }
      const {data:res} =await this.$http.delete("deleteUser?id="+id);
      // console.log(res);
      if(res != "success")
      {
        return this.$message.error("删除失败");
      }
       this.$message.success("删除成功");
       this.getUserList();
    },
    // 关闭更新用户对话框触发
    updateDialogColsed(){
      this.$refs.updateRef.resetFields();//重置update表单的数据
    },
    async updateDialogButton(id){
      this.updateDialogVisible = true; //显示对话框
      const {data:res} = await this.$http.get("getUpdate?id="+id);
      this.updateForm = res;
      console.log(this.updateForm);
    },
    updateUser()
     {
       this.$refs.updateRef.validate(async (valid)=>{
          if(!valid) return;
          const {data:res} = await this.$http.post("editUser",this.updateForm);
            // console.log(res);
           if(res!="success"){
             this.$message.error("编辑用户失败！！");
           }else this.$message.success("编辑用户成功！！");
            this.updateDialogColsed();
            this.updateDialogVisible=false;
            this.getUserList();
       });
      
     },
 },
};
</script>
<style lang="less">
.home /deep/ .el-breadcrumb__inner.is-link{
  color:#DEB185;
}
.home /deep/ .el-breadcrumb__inner.is-link:hover{
  color: blue;
}
.el-breadcrumb {
  //面包屑的样式
  margin-bottom: 15px;
  font-size: 15px;
}

// 以下是分页样式
.el-pagination__total{
  color:#DEB185 !important;
}
.el-input--mini .el-input__inner
{
  color:#DEB185 !important;
  background: #272B34;
}

.el-pagination__jump{
  color:#DEB185 !important;
    .el-input__inner{
    background: #272B34;
    color:#DEB185;
  }
}
.el-pager li{
  color:#DEB185 !important;
  background: #272B34 !important;
}
.el-pager li.active{
  color: #fff !important;
  background:#409EFF !important;
}
 .el-pagination .btn-next{
  content:'下一页';
  background: #272B34 !important;
  color: #fff !important;
   border:1px solid rgb(163, 162, 162) !important;
}
 .el-pagination .btn-prev{
  content:'下一页';
  background: #272B34 !important;
  color: #fff !important;
   border:1px solid rgb(163, 162, 162) !important;
}
.block {
  //页码样式
  margin-top:50px;
}
</style>