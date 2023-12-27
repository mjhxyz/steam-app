<template>
    <div style="padding: 10px;">
        <!-- 添加游戏的对话框 -->
        <el-dialog :title="formTitle" v-model="showAddGameDialog" width="900px">
            <el-form :model="addGameForm" :rules="addGameRule" ref="addGame" label-width="100px">
                <el-form-item label="游戏名称" prop="name">
                    <el-input v-model="form.name" placeholder="请输入游戏名称">
                    </el-input>
                </el-form-item>
                <el-form-item label="游戏logo" prop="logo">
                    <el-input v-model="form.logo" placeholder="请输入游戏logo">
                    </el-input>
                </el-form-item>
                <el-form-item label="原始价格" prop="origin_price">
                    <el-input v-model="form.origin_price" placeholder="请输入原始价格">
                    </el-input>
                </el-form-item>
                <el-form-item label="当前价格" prop="final_price">
                    <el-input v-model="form.final_price" placeholder="请输入当前价格">
                    </el-input>
                </el-form-item>
                <el-form-item label="游戏截图" prop="short_desc">
                    <el-input type="textarea" :rows="5" v-model="form.images" placeholder="请输入游戏截图地址逗号分割">
                    </el-input>
                </el-form-item>
                <el-form-item label="游戏描述" prop="short_desc">
                    <el-input v-model="form.short_desc" placeholder="请输入游戏描述">
                    </el-input>
                </el-form-item>
                <el-form-item label="游戏长描述" prop="short_desc">
                    <el-input v-model="form.long_desc" type="textarea" :rows="5" placeholder="请输入游戏长描述">
                    </el-input>
                </el-form-item>
            </el-form>
            <template #footer>
                <el-button @click="showAddGameDialog = false">取 消</el-button>
                <el-button type="primary" @click="doAdd">确 定</el-button>
            </template>
        </el-dialog>
        <!-- 操作按钮 -->
        <div style="margin-bottom: 10px;">
            <el-button type="primary" @click="add">
                添加游戏
            </el-button>
        </div>
        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="id" label="ID" width="100" />
            <el-table-column prop="name" label="游戏名称" width="200" />
            <el-table-column prop="logo" label="游戏logo" width="200" />
            <el-table-column prop="origin_price" label="原始价格" width="200" />
            <el-table-column prop="final_price" label="当前价格" width="200" />
            <el-table-column prop="short_desc" label="游戏描述" width="200" />
            <el-table-column prop="add_time" label="添加时间" width="200" />
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

import { getGameList, deleteGame, addGame } from '@/api/admin/game'

export default {
    name: "AdminGame",
    data() {
        return {
            formTitle: '添加游戏',
            tableData: [],
            showAddGameDialog: false,
            form: {
                name: '',
                logo: '',
                origin_price: '',
                final_price: '',
                short_desc: '',
            },
        };
    },
    methods: {
        doAdd() {
            addGame(this.form).then(res => {
                this.$message({
                    message: '添加成功',
                    type: 'success'
                })
                this.showAddGameDialog = false
                this.load()
                console.log(res)
            }).catch(err => {
                console.log(err)
            })
        },
        add() {
            this.form = {
                name: '',
                logo: '',
                origin_price: '',
                final_price: '',
                short_desc: '',
            }
            this.formTitle = '添加游戏'
            console.log('打开!')
            this.showAddGameDialog = true
        },
        handleDelete(id) {
            deleteGame({ id }).then(res => {
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
            // 加载用户列表
            getGameList().then(res => {
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