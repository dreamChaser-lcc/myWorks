<template>
  <div class="box">
    <el-breadcrumb style="" class="home" separator-class="el-icon-arrow-right">
      <el-breadcrumb-item :to="{ path: '/welcome' }">首页</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/feedback' }">反馈管理</el-breadcrumb-item>
      <el-breadcrumb-item :to="{ path: '/feedback' }">用户反馈</el-breadcrumb-item>
    </el-breadcrumb>

    <el-card class="main" style="border:1px solid #000;box-shadow:10px 10px 5px #000;">
      <h3 style="height:20px;margin-top:0px"> 用户反馈</h3>
      <el-table :data="feedBack" stripe style="border:1px solid #fafafa"  :header-cell-style="headerCell" :cell-style="bodyCell">
        <el-table-column prop="time" label="日期" style="border:1px solid #fafafa"></el-table-column>
        <el-table-column prop="content" label="反馈内容"></el-table-column>
        <el-table-column prop="state" label="状态">
          <template slot-scope="scope">
              <span v-if="scope.row.state===false">未读</span>  
          </template>
        </el-table-column>
        <el-table-column label="操作" width="280">
          <el-button type="primary"  icon="el-icon-edit" style="line-height:1px"></el-button>
          <el-button type="danger" icon="el-icon-delete"></el-button>
        </el-table-column>
      </el-table>
      <!-- 翻页 -->
       <div >
         <el-pagination
        :current-page="queryInfo.pageNum"
        :page-sizes="[2]"
        :page-size="queryInfo.pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
      ></el-pagination>
        </div>
    </el-card >
    <el-card shadaw="hover" style="border:1px solid #000;box-shadow:10px 10px 5px #000;">
      <h3 style="height:20px;margin-top:0px" >历史用户反馈</h3>
      <el-table :data="feedBackBefore" stripe :header-cell-style="headerCell" :cell-style="bodyCell" style="border:1px solid #fff">
        <el-table-column prop="time" label="日期"></el-table-column>
        <el-table-column prop="content" label="反馈内容"></el-table-column>
        <el-table-column prop="state" label="状态">
            <template slot-scope="scope">
              <span v-if="scope.row.state===true">已处理</span> 
               <span v-else>异常</span>    
          </template>
        </el-table-column>
        <el-table-column prop="username" label="操作管理员"></el-table-column>
      </el-table>
        <div class="page">
        <el-pagination
        :current-page="queryBefore.pageNum"
        :page-sizes="[2]"
        :page-size="queryBefore.pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="totalBefoer">
        </el-pagination>
        </div>
    </el-card>
  </div>

</template>
<script>
export default {
  data() {
    return {
      // 反馈信息访问后端的查询条件信息
      queryInfo: {  
        query: "", //查询的用户信息
        pageNum: 1, //当前页数
        pageSize: 2, //每页展示
      },
      // 历史反馈信息访问后端的查询条件信息
      queryBefore: {
        query: "", //查询的用户信息
        pageNum: 1, //当前页数
        pageSize: 2, //每页展示
      },
      tableData: [
        {
          date: "2016-05-02",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1518 弄",
          statu: "已读",
        },
        {
          date: "2016-05-04",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1517 弄",
          statu: "已读",
        },
       
      ],
      feedBack:[],      //反馈信息的数组
      feedBackBefore:[], //历史反馈信息的来源
      total:0,    //反馈信息翻页区总条数
      totalBefoer:0, //历史反馈信息翻页区总条数
    };
  },
  created(){
    this.getFblist();
    this.getBeforelist();
  },
  methods:{
      headerCell({rowIndex,columnIndex,row,column}){
        // console.log(rowIndex,columnIndex,row,column)
        return "background:#272B34;color:#DEB185;text-align:center;font-size:15px"
      },
      bodyCell(e){
        // console.log(e)
        if(e.columnIndex == 3)
        {
        return "background:#409EFF;color:#fff;font-size:25px;font-family:sans-serif;color:#F56C6C;text-align:center";
        }
        else{
          return "background:#409EFF;color:#fff;border-right:1px solid #272B34;text-align:center";
        }
      },
     async getFblist(){
       
       const {data:res} =  await this.$http.get("getFB",{params:this.queryInfo});
        this.feedBack =res.allFB;
        this.total = res.numbers;
      //  console.log(this.total)
     }, 
      async getBeforelist(){
      //  console.log("历史反馈信息")
       const {data:res} =  await this.$http.get("getBeforeFB",{params:this.queryBefore});
       this.feedBackBefore =res.allFB;
       this.totalBefoer = res.numbers;
       console.log(this.feedBackBefore)
     } 
  }


};
</script>
<style lang="less">
.box{
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
    .main {
         height: 280px;
         margin-bottom: 10px;
         color:#DEB185;
    }
    .el-card{
        background-color: rgba(0,0,0,0.1);
        color:#DEB185;   
    }
    .page{
      margin-top:5px;
    }
    .el-button--primary{
      background: #4bd08b;
      border-radius: 20%;
    }

}

</style>