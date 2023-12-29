<template>
    <el-container class="layout-container-demo" style="height: 100%">
        <el-aside width="200px">
            <el-scrollbar>
                <div style="height: 50px; padding: 10px;">
                    <img src="https://steamstore-a.akamaihd.net/public/shared/images/header/globalheader_logo.png?t=962016"
                        alt="" style="width: 100%; height: 100%; object-fit: contain;" />
                </div>
                <el-menu :default-active="this.$router.path" router background-color="#304156" text-color="#fff"
                    :collapse="false" active-text-color="#409BFF">
                    <!-- 不用子菜单 -->
                    <el-menu-item style="background-color: #304156 !important;" index="/admin/main">
                        <el-icon><HomeFilled/></el-icon>首页
                    </el-menu-item>

                    <el-sub-menu index="2">
                        <template #title>
                            <el-icon>
                                <message />
                            </el-icon> 游戏管理
                        </template>
                        <el-menu-item index="/admin/game">游戏列表</el-menu-item>
                        <el-menu-item index="/admin/comment">游戏评论</el-menu-item>
                    </el-sub-menu>
                    <el-sub-menu index="3">
                        <template #title>
                            <el-icon><icon-menu /></el-icon>用户管理
                        </template>
                        <el-menu-item index="/admin/user">用户列表</el-menu-item>
                    </el-sub-menu>
                </el-menu>
            </el-scrollbar>
        </el-aside>

        <el-container>
            <el-header
                style="text-align: right; font-size: 12px; background-color: #fff;box-shadow: 0 1px 4px rgba(0,21,41,.08);">
                <div class="toolbar">
                    <div style="color: #000; justify-self: flex-start; font-size: 20px;">{{ $route.meta.title }}</div>
                    <el-dropdown class="toolbar-item">
                        <span class="toolbar-item-inner">{{ user.login_name }}</span>
                        <template #dropdown>
                            <el-dropdown-menu>
                                <el-dropdown-item @click="logout">
                                    退出登录
                                </el-dropdown-item>
                            </el-dropdown-menu>
                        </template>
                    </el-dropdown>
                </div>
            </el-header>

            <el-main>
                <el-scrollbar padding="20px">
                    <router-view />
                    <!-- <el-table :data="tableData">
                        <el-table-column prop="date" label="Date" width="140" />
                        <el-table-column prop="name" label="Name" width="120" />
                        <el-table-column prop="address" label="Address" />
                    </el-table> -->
                </el-scrollbar>
            </el-main>
        </el-container>
    </el-container>
</template>
  
<script>
import { Menu as IconMenu, Message, HomeFilled } from '@element-plus/icons-vue'
import { getAdminUser, removeAdminUser } from '@/utils/auth';

export default {
    name: 'AdminHome',
    components: {
        IconMenu,
        Message,
        HomeFilled
    },
    data() {
        return {
            user: {}
        }
    },
    methods: {
        logout() {
            removeAdminUser()
            this.$router.push('/admin/login')
        }
    },
    // 每次都要检查是否登录
    created() {
        this.user = getAdminUser()
    },
}



</script>
  
<style scoped>
.layout-container-demo .el-header {
    position: relative;
    background-color: #304156;
    color: #fff;
}

.layout-container-demo .el-aside {
    color: var(--el-text-color-primary);
    background: #304156;
}

.layout-container-demo .el-menu {
    border-right: none;
}

.layout-container-demo .el-main {
    padding: 0;
}

.layout-container-demo .toolbar {
    display: inline-flex;
    height: 100%;
    align-items: center;
    justify-content: space-between;
    right: 20px;
    width: 100%;
}

.toolbar-item-inner {
    color: #1f2d3d;
    padding: 20px;
    cursor: pointer;
}

.el-menu-item {
    background-color: #1f2d3d !important;

}

.toggle-button {
    background-color: #4A5064;
    font-size: 10px;
    line-height: 24px;
    color: #fff;
    text-align: center;
    letter-spacing: 0.2em;
    cursor: pointer;
}
</style>
  