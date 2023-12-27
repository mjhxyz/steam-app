<template>
  <div class="login-container">
    <LoginNav />
    <div class="login-body">
      <div class="login-box">
        <div class="login-title">登录</div>
        <div class="login-form">
          <el-form ref="login" :model="login" status-icon :rules="loginRule" label-width="0px"
            class="demo-ruleForm login-el-form">
            <el-form-item prop="login_name" style="margin-bottom: 10px;">
              <span class="login-name-label">用账号名称登录</span>
              <el-input class="login-input" v-model="login.login_name" />
            </el-form-item>
            <el-form-item prop="login_pwd">
              <span class="login-name-label" style="color: #afafaf">密码</span>
              <el-input class="login-input" v-model="login.login_pwd" type="password" autocomplete="off" />
            </el-form-item>
            <el-form-item>
              <el-button @click="loginSubmit" class="login-btn">登录</el-button>
            </el-form-item>
          </el-form>
        </div>
      </div>
    </div>
    <div class="login-footer">
      <div class="login-footer-left">
        <div>首次使用 Steam？</div>
        <router-link class="login-link" to="/register">创建账户</router-link>
      </div>
      <div>创建帐户既免费又简单。探索成千上万款游戏，与数百万新朋友一起畅玩吧！ 了解更多关于 Steam 的信息</div>
    </div>
  </div>
</template>
 
<script>
import { ElNotification } from 'element-plus'
import LoginNav from '@/components/LoginNav.vue'
import { setUser } from '@/utils/auth';
import { login } from '@/api/front/user';

export default {
  name: "LoginPage",
  components: {
    LoginNav
  },
  data() {
    return {
      login: {
        login_name: "",
        login_pwd: ""
      },
      loginRule: {
        login_name: [
          { required: true, message: '请输入账号', trigger: 'blur' },
          { min: 3, max: 20, message: '用户名长度为3-20', trigger: 'blur' },
        ],
        login_pwd: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 6, max: 32, message: '用户名长度为6-32', trigger: 'blur' },
        ],
      }
    };
  },
  methods: {
    loginSubmit() {
      console.log(this.login)
      this.$refs['login'].validate((valid) => {
        if (valid) {
          login(this.login).then(res => {
            console.log(res)
            setUser(res.data)
            ElNotification({
              title: '提示',
              message: '登录成功',
              type: 'success',
            })
            this.$router.push('/')
          }).catch(err => {
            console.log(err)
          })
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    }
  },
};
</script>
 
<style lang="less" scoped>
.login-container {
  width: 100%;
  height: 100%;
  background: #171d25;
  position: relative;

  .login-footer {
    width: 100%;
    height: 150px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: #dcdedf;
    font-size: 12px;

    .login-footer-left {
      display: flex;
      align-items: center;
      margin-bottom: 20px;

      .login-link:last-child {
        margin-right: 20px;
        font-size: 15px;
        line-height: 30px;
        cursor: pointer;
        color: #1a9fff;
        border-radius: 2px;
        border: none;
        padding: 5px 20px;
        text-decoration: none !important;
        color: #c3e1f8;
        background: transparent;
        text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.3);
        margin: 10px 0 10px 0;
        display: block;
        text-align: center;
        border-radius: 2px;
        background: linear-gradient(to right, #47bfff 5%, #1a44c2 60%);
        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
        background-position: 25%;
        background-size: 330% 100%;
      }

      .login-link:last-child:hover {
        background-position: 100%;
        transition: all 0.5s;
      }

      div:first-child {
        margin-right: 20px;
      }
    }
  }

  .login-body {
    background: radial-gradient(rgba(24, 26, 33, 0) 0%, #181A21 100%) fixed no-repeat, url(https://store.akamai.steamstatic.com/public/shared/images/joinsteam/new_login_bg_strong_mask.jpg) center top no-repeat, #181A21;
    padding-top: 80px;
    height: 654px;
    padding-bottom: 150px;
    display: flex;
    flex-direction: column;
    align-items: center;

    .login-box {
      width: 700px;
      height: 335px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;

      .login-title {
        color: #fff;
        font-size: 28px;
        font-weight: 800;
        display: flex;
        justify-content: start;
        margin-bottom: 32px;
      }

      .login-form {
        background-color: #181a21;
        border-radius: 4px;
        padding: 24px 32px;
        flex: 1;
        min-width: 636px;
        padding: 24px 32px;

        .login-btn {
          transition: all 0.5s;
          width: 270px;
          height: 47px;
          position: relative;
          background: linear-gradient(90deg, #06BFFF 0%, #2D73FF 100%);
          border-radius: 2px;
          border: none;
          outline: none;
          padding: 12px;
          color: #fff;
          font-size: 16px;
          font-weight: 400;
          font-family: inherit;
          text-align: center;
          cursor: pointer;
        }

        .login-btn:hover {
          background: linear-gradient(90deg, #2D73FF 0%, #06BFFF 100%);
        }

        .login-el-form {
          .login-input {
            border: none;
            height: 39px;
            background-color: #393c44;
          }

          .login-name-label {
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: .02em;
            user-select: none;
            display: flex;
            justify-content: start;
            color: #1999ff;
            font-weight: 500;
          }
        }
      }
    }
  }

}

/deep/ .el-input__wrapper {
  background-color: #32353c;
  box-shadow: none;
}

/deep/ .el-input__inner {
  background-color: #32353c;
  color: #fff;
}
</style>