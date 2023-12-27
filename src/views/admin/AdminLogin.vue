<template>
    <div class="login_container">
        <div class="login_box">
            <div class="avatar_box">
                <img src="@/assets/logo.png" alt="" />
            </div>
            <el-form ref="login" class="login_form" :model="loginForm" :rules="rule">
                <h3 class="login-title">Steam 管家</h3>
                <el-form-item prop="login_name">
                    <el-input v-model="loginForm.login_name" placeholder="请输入用户名"></el-input>
                </el-form-item>
                <el-form-item prop="login_pwd">
                    <el-input v-model="loginForm.login_pwd" placeholder="请输入密码" type="password"></el-input>
                </el-form-item>
                <el-row justify="end">
                    <el-form-item class="login_btn">
                        <el-button type="primary" @click="loginSubmit">
                            登录
                        </el-button>
                    </el-form-item>
                </el-row>
            </el-form>
        </div>
    </div>
</template>
   
<script>
import { login } from "@/api/admin/user.js";
import { setAdminUser } from "@/utils/auth.js";

export default {
    name: "AdminLogin",
    data() {
        return {
            rule: {
                login_name: [
                    { required: true, message: "请输入用户名", trigger: "blur" },
                    { min: 3, max: 20, message: "用户名长度为3-20", trigger: "blur" },
                ],
                login_pwd: [
                    { required: true, message: "请输入密码", trigger: "blur" },
                    { min: 6, max: 32, message: "用户名长度为6-32", trigger: "blur" },
                ],
            },
            loginForm: {
                login_name: "",
                login_pwd: ""
            },
        };
    },
    methods: {
        loginSubmit() {
            this.$refs['login'].validate((valid) => {
                if (valid) {
                    login(this.loginForm).then(res => {
                        this.$message({
                            message: '登录成功',
                            type: 'success'
                        })
                        setAdminUser(res.data)
                        this.$router.push('/admin/home')
                    }).catch(err => {
                        console.log(err)
                    })
                } else {
                    return false;
                }
            });
        },
    },
};
</script>
   
<style lang="less" scoped>
.login-title {
    text-align: center;
    font-size: 20px;
    margin-bottom: 20px;
}

.login_container {
    background-color: #2b4b6b;
    height: 100vh;
}

.login_box {
    width: 450px;
    height: 300px;
    background-color: #fff;
    border-radius: 3px;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);

    .avatar_box {
        height: 130px;
        width: 130px;
        border: 1px solid #eee;
        border-radius: 50%;
        padding: 10px;
        box-shadow: 0 0 10px #ddd;
        position: absolute;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #fff;

        img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            background-color: #eee;
        }
    }
}

.login_form {
    position: absolute;
    bottom: 0;
    width: 100%;
    padding: 0 20px;
    box-sizing: border-box;
}

.login_btn {
    display: flex;
    // 横轴上尾部对齐
    justify-content: flex-end;
}
</style>