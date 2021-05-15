<template>
    <div class="login_container" > 
        <div class="header">基于AliOSThings的智能家居系统</div>
         <div style="text-align:center;font-size:35px;color:#76171A">管理员后台</div>
        <!-- 登录容器 -->
        <div class="login_box">
            <!-- 图片区域 -->
            <div class= "avatar_box">
                <img src="../assets/logo.png" alt="logo">
            </div>
             <!-- ：是v-bind的简写；@是v-on的简写 :属性username和password将default数据在默认值出口绑定进行更改 -->
            <el-form ref="loginFromRef" :rules="rules" :model="loginForm" class="login_form" label-width="0"> 
                  <!-- 用户名  prop代表验证的需要的字段  -->
                  <el-form-item></el-form-item>
                  <el-form-item prop="username">
                   <el-input v-model="loginForm.username" placeholder="请输入用户名" prefix-icon="iconfont icon-wode1"></el-input>  
                 </el-form-item>
                 
                 <!-- 密码 prop代表验证的需要的字段 -->
                  <el-form-item  prop="password"> 
                    <el-input v-model="loginForm.password" placeholder="请输入密码" prefix-icon="iconfont icon-mima" type="password"></el-input>  
                 </el-form-item>
                <!-- 按钮 -->
                   <el-form-item class="btns">
                            <el-button type="success" :loading="isloading"  @click="login_wait()">
                            <span v-if="isloading">loading...</span>    
                            <span v-else> 登录</span>
                                
                            </el-button>
                            <el-button type="info" @click="resetLoginForm()">重置</el-button>
                    </el-form-item> 
            </el-form>
        </div>
    </div>
</template>

<script>
export default {     //默认出口 值
    data(){
        return{
                loginForm:{         //v-model绑定了上面的双向数据，loginFrom对象数组
                    username:"",
                    password:""
                },
                rules: {
                     username: [
                      { required: true, message: '请输入用户名', trigger: 'blur' },
                     { min: 3, max: 10, message: '请输入3 ~ 10 个字母或数字 ', trigger: 'blur' }
                     ],
                     password:
                      [
                      { required: true, message: '请输入密码', trigger: 'blur' },
                     { min: 6, max: 10, message: '密码长度为 6 ~ 10 个字符、 字母或数字', trigger: 'blur' }
                     ]
                },
                isloading: false,
             
        };
    },
    methods:{
         //点击登录按钮等待函数
        login_wait(){  
            this.isloading=true;
            setTimeout(() =>{  //设置延迟函数，1000ms后进行箭头函数里的内容
              this.isloading=false;  
              this.login();
            },1000);    
        },
        login(){
            //validate验证方法箭头函数，箭头函数valid是参数{表示方法}
            this.$refs.loginFromRef.validate(async valid=>{
                    if(!valid) return;
                    //  console.log(data)
                    // data:res中data表示请求返回对象数组的data属性变量名，然后将data中的值赋值给res
                    
                    const {data:res} = await this.$http.post("login",this.loginForm); 
                    // console.log("login.vue:"+this.loginForm);
                    if(res.flag == 'ok'){
                        this.$message.success("登录成功！！！");
                        // 使用JSON把数据封装成字符串
                        window.sessionStorage.setItem("user",JSON.stringify(res.user));
                        //  console.log( window.sessionStorage.getItem("user"));
                        this.$router.push({path:"/home"}); //给router添加上path跳转到/home，先经过路由守卫
                    }
                    else{
                        this.$message.error("用户不存在或没有权限！");
                    }
                })
        },
        //重置原始值
        resetLoginForm(){
            //console.log('klksdlsd')
            //调用上面$res+名称点出resetFields重置方法
            this.$refs.loginFromRef.resetFields();
        },
       
    }
}   
</script>

<style lang="less" scoped>

.login_container{
    background: url('../assets/login.jpg');
    // background-position: center;
    background-repeat:no-repeat;
    height: 100%;
    width: 100%;
     background-size:100%;
    .header{ //标题
        display: flex;
        margin: auto;
        justify-content: center; 
        padding-top:40px ;
        font-size:40px;
        color: #76171A;
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
     }
}
.login_box{
    width:300px;
    height:300px;
    background-color:rgba(255, 255, 255, 0.1);
    border-radius:3px;
    position:absolute;
    left: 80%;
    top: 50%;
    transform: translate(-50%,-50%);
    .avatar_box{
        width: 80px;
        height: 80px;
        border: 1px solid #eee;
        border-radius: 50%;  //边框圆角
        box-shadow: 0 0 10px #ddd; //盒子的阴影
        position: absolute;
        left: 50%;
        transform:translate(-50%,-50%) ; //让坐标点恢复到原始坐标（0，0）
        background-color: rgba(255, 255, 255, 0.2);
        img{
            width: 100%;
            height: 100%;
            border-radius: 50%;
            // background-color:;
        }
    }
}
.login_form{
     position: absolute;
     bottom: 0;
     width: 100%;
     padding: 0 5px 10px 10px; //左右间距为零，上下边距为10px
     box-sizing: border-box; //给盒子设定宽度和高度，border是显示设定的宽度和高度减去内边距得到的边框
}
.btns{
     display: flex;             //弹性盒子

     justify-content: center; //弹性伸缩盒子
}

</style>