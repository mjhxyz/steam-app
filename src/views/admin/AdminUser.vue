<template>
    <div class="container">
        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="id" label="ID" width="100" />
            <el-table-column prop="login_name" label="登录名" width="200" />
            <el-table-column prop="nick_name" label="用户昵称" width="" />
            <el-table-column prop="add_time" label="注册时间" width="200" />
            <el-table-column prop="update_time" label="修改时间" width="200" />
            <!-- 操作按钮 -->
            <el-table-column prop="opt" label="操作" width="200">
                <template #default="{ row }">
                    <el-button type="danger" size="mini" @click="handleDelete(row.id)">
                        删除
                    </el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>

import { getUserList, deleteUser } from '@/api/admin/user'

export default {
    name: "AdminUser",
    data() {
        return {
            tableData: []
        };
    },
    methods: {
        handleDelete(id) {
            deleteUser({ id }).then(res => {
                this.$message({
                    message: '删除成功',
                    type: 'success'
                })
                this.loadUserList()
                console.log(res)
            }).catch(err => {
                console.log(err)
            })
        },
        loadUserList() {
            // 加载用户列表
            getUserList().then(res => {
                this.tableData = res.data
                console.log(res)
            }).catch(err => {
                console.log(err)
            })
        }
    },
    created() {
        this.loadUserList()
    }
};

</script>

<style lang="less" scoped>

.container {
    padding: 20px;
}

</style>