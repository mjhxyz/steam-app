<template>
    <div class="login-header">
        <div class="login-login">
            <img width="176" height="44"
                src="https://store.akamai.steamstatic.com/public/shared/images/header/logo_steam.svg?t=962016" alt="" />
        </div>
        <div class="login-opts">
            <router-link to="/home" class="login-opt">商店</router-link>
            <router-link to="/about" class="login-opt">关于</router-link>
        </div>
    </div>
</template>

<script>
export default {
    name: "LoginNav",
    data() {
    }
}
</script>

<style scoped>
.login-header {
    color: #dcdedf;
    height: 104px;
    width: 940px;
    margin: 0px auto;
    background: #171d25;
    display: flex;
    align-items: center;

    .login-opts {
        flex: 1;
        display: flex;

        .login-opt {
            text-decoration: none;
            color: #dcdedf;
            transition: all 0.5s;
            margin-left: 20px;
            cursor: pointer;
            border-bottom: 2.5px solid transparent;
        }

        .login-opt:hover {
            border-bottom: 2.5px solid #1a9fff;
        }
    }
}
</style>
