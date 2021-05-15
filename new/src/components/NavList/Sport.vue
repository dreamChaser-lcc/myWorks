<template>
<div class="container">
     <el-breadcrumb style="" class="home" separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/feedback' }">反馈管理</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/feedback' }">用户反馈</el-breadcrumb-item>
    </el-breadcrumb>
    <el-card shadaw="hover" style="border:1px solid #000;box-shadow:10px 10px 5px #000;">
      <h3 style="height:20px;margin-top:0px">用户反馈</h3>
      <div class="select">
            <el-select v-model="value[0]"  placeholder="选择处理状态">
                <el-option
                v-for="item in options"
                :key="item.value"
                :label="item.label"
                :value="item.label">
                </el-option>
            </el-select>
             <el-select v-model="value[1]" placeholder="选择反馈类型">
                <el-option
                v-for="item in options2"
                :key="item.value"
                :label="item.label"
                :value="item.label">
                </el-option>
            </el-select>
             <el-select  v-model="value[2]" placeholder="选择反馈时间">
                <el-option
                v-for="item in options3"
                :key="item.value"
                :label="item.label"
                :value="item.label">
                </el-option>
            </el-select>
            <el-button icon="el-icon-search" circle @click="searchResult"></el-button>
      </div>  
      <div class="labelStyle">
        <strong>标签：</strong>
        <strong  v-for="(item,index) in value" :key="index">
          <el-tag :type="tag_type[index]" style="margin-right:10px" :disable-transitions="true" closable @close="handleTag(index)" v-show="item">{{item}}</el-tag>
        </strong>
      </div>
      <el-table :data="data_FB" border style="box-shadow:10px 10px 5px #e3e3e3;" ref="filterTable" 
       :cell-style="bodyCell"
       :header-cell-style="headerCell"
       >
        <el-table-column prop="time"  width="140px" label="时间"></el-table-column>
        <el-table-column prop="username" width="100px" label="用户"></el-table-column>
        <el-table-column prop="fbtype"  width="140px" label="反馈类型"></el-table-column>
        <el-table-column prop="content" label="内容"></el-table-column>
        <el-table-column prop="state"  width="100px" label="状态" :filters="[{text:'已处理',value:'已处理'},{text:'待处理',value:'待处理'}]" :filter-method="filter_state">
          <template slot-scope="scope">
            <span v-if="scope.row.state">已处理</span>
            <span v-else>待处理</span>
          </template>
        </el-table-column>
        <el-table-column prop="admin"  width="100px" label="操作管理员"></el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
              <el-button @click="editFB(scope.row)">查看</el-button>
              <el-button @click="deleteFB(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

    </el-card>
      <el-dialog title="处理反馈" :visible.sync="handleDialogVisible" width="30%" >
          <el-form :model="currentFB">
              <el-form-item label="反馈内容:">
                  <el-input v-model="currentFB.content"></el-input>
              </el-form-item>
              <el-form-item label="给予反馈:" >
                  <el-input v-model="currentFB.fbcontent"></el-input>
              </el-form-item>
              <el-form-item label="处理管理员:">
                  <el-input v-model="currentFB.admin"></el-input>
              </el-form-item>
          </el-form>
          <span slot="footer">
              <el-button @click="handleDialogVisible=false">取消</el-button>
              <el-button @click="updateFB()">确定</el-button>
          </span>
    </el-dialog>
     <!-- 页码部分 -->
    <div class="block" >
      <span class="demonstration"></span>
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="queryInfo.pageNum"
        :page-sizes="[2,3,5]"
        :page-size="3"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
    </div>
</div>
</template>
<script>
export default {
 data () {
   return {
   options: [{
          value: '1',
          label: '查询所有'
        }, {
          value: '2',
          label: '已处理'
        }, {
          value: '3',
          label: '待处理'
        }],
   options2: [{
          value: '选项1',
          label: '查询所有'
        }, {
          value: '选项2',
          label: '其他问题'
        }, {
          value: '选项3',
          label: '传感器问题'
        }],
   options3: [{
          value: '选项1',
          label: '查询所有'
        }, {
          value: '选项2',
          label: '近一个月'
        }],
   handleDialogVisible:false,
   //option选项的值
   value:["","",""],
   //标签的选项 
   tag_type:["success","info","warning"],      
   data_FB:[{
     time:'2021',
     username:'xj',
     content:'sf',
     admin:'lcc',
     FBcontent:"....",
     state:'已处理'
   },{
   }
   
   ],
   currentFB:{}, 
   queryInfo: {
        query: "", //查询的用户信息
        pageNum: 1, //当前页数
        pageSize: 3, //每页展示
      },
   total:10,   
   FBlist:[],
   }
 },
created(){
   this.getFBList();
 },
watch:{
   value(val){
    // //  console.log(val)
    //  this.data_FB = this.data_FB.filter(item=>{
    //    console.log(item)
    //    return item.state === true
    //  })
    //标签全部删除就刷新列表
    if(val.join("")==0)
    {
      this.queryInfo.query="";
      this.getFBList();
    }
    else{
      this.searchResult();
    }

   },
  data_FB(){
    // this.value=null;
  }
   
 },
  methods: {
    //表头样式
    headerCell(e){
       return "background:#272B34;color:#DEB185;text-align:center;font-size:15px"
    },
    //表格样式
    bodyCell(e){
      let res = "background:#409EFF;color:#fff;text-align:center;width:20px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap !important;";
      if(e.columnIndex == 6)
      {
      return res;
      }
      else{
        return res+"border-right:1px solid #fff;r";
      }
    },
    //带标签查询所有列表
    async searchResult(){
      //console.log('我点击了')
      this.queryInfo.query = this.value;
      const {data:res} = await this.$http.post(`searchResult`,this.queryInfo)
    //  console.log(res)
       this.data_FB = res.FBAll;
       this.total = res.numbers;
    },
     //不带标签更新列表
     async getFBList(){
        const {data:res}  = await this.$http.get("getFBAll",{
          params: this.queryInfo,
        });
        // console.log(res)
        this.data_FB = res.FBAll;
        this.total = res.numbers;
     },
    //表格中的筛选触发函数
    filter_state(e,row){
      // console.log(e,row);
      if(e==="已处理")
      {return row.state==true;}
      else{
      return row.state==false;
      }
    },
    // 页数,最大数
    handleSizeChange(newSize) {
      this.queryInfo.pageSize = newSize;
      // this.getUserList();
    },
    //切换页面
    handleCurrentChange(newSize) {
      this.$refs.filterTable.clearFilter();
      this.queryInfo.pageNum = newSize;
      if(typeof this.queryInfo.query !="object")
      this.getFBList();
      else{
        this.searchResult()
      }
    },
    //点击查看按钮
    editFB(e){
        this.currentFB=e;
        // console.log(e)
        this.handleDialogVisible=true;
     },
    //点击查看中确定按钮
    async updateFB(){
         const {data:res} = await this.$http.post("editFB",this.currentFB);
         if(res==1) {
           this.$message.success("回复成功!!!");
           this.searchResult();
           this.handleDialogVisible=false;
         }
        //  console.log(res)
     },
    //点击删除按钮
    async deleteFB(row){
      // console.log(row)
      const {data:res} = await this.$http.post("deleteFB",row);
      // console.log(res);
      if(res==1)
      {
        this.$message.success("删除成功!!!");
        this.searchResult();
      }else{
        this.$message.error("删除失败，请检查!!!");
      }

    },
    //标签右上角×触发函数
    handleTag(e){
      this.value.splice(e,1,"");
    }
  }
}   
</script>
<style lang="less" scoped>
/deep/ .el-table .cell{
  white-space: nowrap !important;
}
.container{
   color:#DEB185 !important;
  .select{
    .el-select{
      margin-right:20px;
    }
  }
  .labelStyle{
    display: flex;
    // justify-content: center;
    align-items: center;
    margin-top:20px;
    margin-bottom:20px;
    font-size: 20px;
  }
 }
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
</style>