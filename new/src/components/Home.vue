<template>
 <!-- 背景主题色#272B34;字体色：#DEB185 -->
 
  <!-- <div>
        this 首页
        <el-button type="info" @click="logout"> 注销登录</el-button>
  </div>-->
  <!-- 使用container布局外部不能兼容使用div块 -->
  <!-- container容器 -->
  <el-container class="el-container">
    <!-- 头部 -->
    <el-header>
      <div>
        <img src="../assets/logo.png" alt class="header-img" />
        <span style="color:#DEB185">管理员后台</span>
        <span class="toggle-button" style="width:25px" @click="toggleCollapase">三</span>
      </div>
      <img alt="注销登录" title="注销登录" class="toggle_user" @click="logout" src="../assets/logout.png">
      <!-- <el-button class="toggle_user" type="info" @click="logout">注销登录</el-button> -->
    </el-header>
    <el-container>
      <!-- 侧边栏 -->
      <el-aside :width="isCollapse?'64px':'200px'">
        <!-- 总菜单框架-->
        <!-- @open="handleOpen"
              @close="handleClose"
              unique-opened 只开一个开关
        -->
        <!-- <div class="toggle-button" @click="toggleCollapase">|||</div> -->
        <el-menu
          :default-active="activePath"
          class="el-menu-vertical-demo"
          background-color="#545c64"
          text-color="#DEB185"
          active-text-color="#ffd04b"
          unique-opened
          :collapse="isCollapse"
          :collapse-transition="false"
          :router="true"
        >
          <!-- 一级菜单 -->
          <el-submenu :index="item.id+''" v-for="item in menuList" :key="item.id">
            <template slot="title">
              <i :class="iconObject[item.id]"></i>
              <span>{{item.title}}</span>
            </template>
            <!-- <el-menu-item-group>
                  <template slot="title">分组一</template>
                  <el-menu-item index="1-1">选项1</el-menu-item>
                  <el-menu-item index="1-2">选项2</el-menu-item>
                </el-menu-item-group>
                <el-menu-item-group title="分组2">
                  <el-menu-item index="1-3">选项3</el-menu-item>
            </el-menu-item-group>-->

            <!-- 二级菜单 -->
            <el-menu-item :index="it.path" v-for="it in item.sList" :key="it.id" @click="saveNavState(it.path)">
              <template slot="title">
                <i :class="iconObject[it.id]"></i>
                <span>{{it.title}}</span>
              </template>
            </el-menu-item>
          </el-submenu>
          <!-- <el-menu-item index="2">
                <i class="el-icon-menu"></i>
                <span slot="title">导航二</span>
              </el-menu-item>
              <el-menu-item index="3">
                <i class="el-icon-setting"></i>
                <span slot="title">导航三</span>
          </el-menu-item>-->
        </el-menu>
      </el-aside>
      <el-container>
        <!-- 主体 -->
        <el-main>
            <!-- MAIn -->
            <router-view></router-view>
        </el-main>
      </el-container>
    </el-container>
  </el-container>
</template>
<script>
export default {
  data() {
    return {
      //储存菜单列表
      menuList: [],
      isCollapse: false, //侧边栏折叠
      iconObject: {  //键值对，对象，前一个是key后一个是value
        '100': "el-icon-user-solid",
        '200': "el-icon-s-tools",
        '300': "el-icon-s-promotion",

        '101': "el-icon-s-order",
        '102': "iconfont icon-mima",
        '103': "iconfont icon-wode1",
        '104': "iconfont icon-mima",
        '201': "el-icon-plus",
        '202': "el-icon-cpu",
        '203': "iconfont icon-wode1",
        '204': "iconfont icon-mima",
       
        '301': "el-icon-s-comment",
      },
      activePath:"/welcome",

    };
  },
  //页面初始化调用的函数方法
  created() {
    //alert("初始化成功")
    const activePath = window.sessionStorage.getItem("activePath");
    this.activePath = activePath;
    this.getMenuList();
  },
  methods: {
    logout() {
      window.sessionStorage.clear(); //清除session
      this.$router.push("/login"); //路由添加login跳转到login页面
    },
    // 获取导航菜单列表
    async getMenuList() {
      const { data: res } = await this.$http.get("menus");
      console.log("home.vue菜单列表-->");
      console.log(res);
      if (res.flag != 200) return this.$message.error("获取菜单失败!!");
      this.menuList = res.menus; //访问成功后数据填入data中的menuList数组里；
    },
    toggleCollapase() {
      this.isCollapse = !this.isCollapse;
    },
    saveNavState(activePath){
      window.sessionStorage.setItem("activePath",activePath);
      this.activePath = activePath;
    },
  },
};
</script>
<style lang="less" scoped>
body{
  background:#272B34;
 
}
.el-container {
  height: 100%;
  color: #000;
}
.el-header {
  background-color: #333744;
  display: flex;
  justify-content: space-between; //flex盒子布局对齐两端
  align-items: center;
  color: #fff;
  padding-left: 0px; //左部图标贴边
  div {
    //给div设置弹性居中的盒子
    display: flex;
    align-items: center;
    font-size: 20px;
      margin-left: 15px;
  }
}
.el-aside {
  background-color: #373d41;
  .el-menu {
    border-right: none; //解决选项展开时，菜单选项右边框溢出侧边栏的问题
  }
}
.el-main {
  background-color: #272B34;
}
.header-img {
  height: 30px;
  width: 30px;
  border-radius:50%;
  background: #fff;
  margin-right:5px
}
.el-col-12 {
  width: 100%;
}
.toggle-button {
  background-color: #4a5064;
  font-size: 10px;
  line-height: 24px; //行高
  color: #fff;
  text-align: center;
  letter-spacing: 0.2em; //字体间距
  cursor: pointer; //鼠标经过显示小手指
}
.toggle_user{
   border-radius:50%;
   border:none;
   height:20px;
}
</style>