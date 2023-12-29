
<template>
    <div style="padding: 20px;">
        <!-- 操作按钮 -->
        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="id" label="ID" width="100" />
            <el-table-column prop="game_id" label="游戏" width="200">
                <template #default="{ row }">
                    {{  row.game.name }}
                </template>
            </el-table-column>
            <el-table-column prop="user_id" label="用户ID" width="100" />
            <el-table-column prop="content" label="评论内容" width="" />
            <el-table-column prop="add_time" label="评论时间" width="200" />
            <el-table-column prop="update_time" label="更新时间" width="200" />
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

import { getCommentList, deleteComment } from '@/api/admin/comment'

export default {
    name: "AdminComment",
    data() {
        return {
            formTitle: '添加游戏',
            tableData: [],
        };
    },
    methods: {
        handleDelete(id) {
            deleteComment({ id }).then(res => {
                this.$message({
                    message: '删除成功',
                    type: 'success'
                })
                this.load()
                console.log(res)
            }).catch(err => {
                console.log(err)
            })
        },
        load() {
            getCommentList().then(res => {
                this.tableData = res.data
                console.log(res)
            }).catch(err => {
                console.log(err)
            })
        }
    },
    created() {
        this.load()
    }
};

</script>

<style lang="less" scoped></style>