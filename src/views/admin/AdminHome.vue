<template>
    <el-container class="layout-container-demo" style="height: 100%">
        <el-aside width="200px">
            <el-scrollbar>
                <div style="height: 60px;"></div>
                <el-menu :default-active="this.$router.path" router>
                    <el-sub-menu index="1">
                        <template #title>
                            <el-icon>
                                <message />
                            </el-icon> 游戏管理
                        </template>
                        <el-menu-item-group>
                            <el-menu-item index="/admin/game">游戏列表</el-menu-item>
                            <el-menu-item index="1-2">游戏评论</el-menu-item>
                        </el-menu-item-group>
                    </el-sub-menu>
                    <el-sub-menu index="2">
                        <template #title>
                            <el-icon><icon-menu /></el-icon>用户管理
                        </template>
                        <el-menu-item-group>
                            <el-menu-item index="/admin/user">用户列表</el-menu-item>
                        </el-menu-item-group>
                    </el-sub-menu>
                </el-menu>
            </el-scrollbar>
        </el-aside>

        <el-container>
            <el-header style="text-align: right; font-size: 12px">
                <div class="toolbar">
                    <el-dropdown>
                        <span>{{ user.login_name }}</span>
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
                <el-scrollbar>
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
import { Menu as IconMenu, Message } from '@element-plus/icons-vue'
import { getAdminUser, removeAdminUser } from '@/utils/auth';

export default {
    name: 'AdminHome',
    components: {
        IconMenu,
        Message,
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
    background-color: var(--el-color-primary-light-7);
    color: var(--el-text-color-primary);
}

.layout-container-demo .el-aside {
    color: var(--el-text-color-primary);
    background: var(--el-color-primary-light-8);
}

.layout-container-demo .el-menu {
    border-right: none;
}

.layout-container-demo .el-main {
    padding: 0;
}

.layout-container-demo .toolbar {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    height: 100%;
    right: 20px;
}
</style>
  