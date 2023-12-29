<template>
    <div style="padding: 20px;">
        <!-- 添加游戏的对话框 -->
        <el-dialog :title="formTitle" v-model="showAddGameDialog" width="900px">
            <el-form :model="form" :rules="formRules" ref="addGame" label-width="100px">
                <el-form-item label="游戏名称" prop="name">
                    <el-input v-model="form.name" placeholder="请输入游戏名称" :disabled="action === 'detail'">
                    </el-input>
                </el-form-item>
                <el-form-item label="游戏logo" prop="logo">
                    <el-input v-model="form.logo" placeholder="请输入游戏logo" :disabled="action === 'detail'">
                    </el-input>
                </el-form-item>
                <el-form-item label="游戏海报" prop="poster">
                    <el-input v-model="form.poster" placeholder="请输入游戏海报" :disabled="action === 'detail'">
                    </el-input>
                </el-form-item>
                <el-form-item label="原始价格" prop="origin_price">
                    <el-input v-model="form.origin_price" placeholder="请输入原始价格" :disabled="action === 'detail'">
                    </el-input>
                </el-form-item>
                <el-form-item label="当前价格" prop="final_price">
                    <el-input v-model="form.final_price" placeholder="请输入当前价格" :disabled="action === 'detail'">
                    </el-input>
                </el-form-item>
                <el-form-item label="游戏截图" prop="images">
                    <el-input type="textarea" :rows="5" v-model="form.images" placeholder="请输入游戏截图地址逗号分割"
                        :disabled="action === 'detail'">
                    </el-input>
                </el-form-item>
                <el-form-item label="游戏描述" prop="short_desc">
                    <el-input v-model="form.short_desc" placeholder="请输入游戏描述" :disabled="action === 'detail'">
                    </el-input>
                </el-form-item>
                <el-form-item label="游戏长描述" prop="long_desc">
                    <el-input v-model="form.long_desc" type="textarea" :rows="5" placeholder="请输入游戏长描述"
                        :disabled="action === 'detail'">
                    </el-input>
                </el-form-item>
            </el-form>
            <template #footer>
                <el-button @click="showAddGameDialog = false">取 消</el-button>
                <el-button type="primary" @click="doAction" v-show="action !== 'detail'">确 定</el-button>
            </template>
        </el-dialog>
        <!-- 操作按钮 -->
        <div style="margin-bottom: 10px;">
            <el-button type="primary" @click="add">
                添加游戏
            </el-button>
        </div>
        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="id" label="ID" width="100" align="center" />
            <el-table-column prop="name" label="游戏名称" width="200" />
            <el-table-column prop="logo" label="游戏logo" width="200">
                <template #default="{ row }">
                    <img :src="row.logo" alt="" style="width: 120px; height: 45px;">
                </template>
            </el-table-column>
            <el-table-column prop="poster" label="游戏海报" width="100">
                <template #default="{ row }">
                    <!-- 点击后再新窗口打开查看 -->
                    <a :href="row.poster" target="_blank" style="display: flex; justify-content: center;" v-if="row.poster">
                        <img :src="row.poster" alt="" style="width: 45px; height: 45px;">
                    </a>
                </template>
            </el-table-column>
            <el-table-column prop="origin_price" label="原始价格" width="200" />
            <el-table-column prop="final_price" label="当前价格" width="200" />
            <!-- 游戏描述 超过 20 个字显示省略号 -->
            <el-table-column prop="short_desc" label="游戏描述" width="">
                <template #default="{ row }">
                    <span>{{ row.short_desc.length > 20 ? row.short_desc.substring(0, 20) + '...' : row.short_desc }}</span>
                </template>
            </el-table-column>
            <el-table-column prop="add_time" label="添加时间" width="200" />
            <!-- 操作按钮 -->
            <el-table-column prop="opt" label="操作" width="260">
                <template #default="{ row }">
                    <el-button type="primary" size="mini" @click="handleDetail(row)">
                        查看
                    </el-button>
                    <el-button type="warning" size="mini" @click="handleUpdate(row)">
                        修改
                    </el-button>
                    <el-button type="danger" size="mini" @click="handleDelete(row.id)">
                        删除
                    </el-button>
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>

import { getGameList, deleteGame, addGame, updateGame } from '@/api/admin/game'

export default {
    name: "AdminGame",
    data() {
        return {
            formTitle: '添加游戏',
            action: 'add',
            tableData: [],
            showAddGameDialog: false,
            form: {
                name: '',
                logo: '',
                origin_price: '',
                final_price: '',
                short_desc: '',
                poster: '',
            },
            formRules: {
                name: [
                    { required: true, message: '请输入游戏名称', trigger: 'blur' },
                ],
                logo: [
                    { required: true, message: '请输入游戏logo', trigger: 'blur' },
                ],
                origin_price: [
                    { required: true, message: '请输入原始价格', trigger: 'blur' },
                ],
                final_price: [
                    { required: true, message: '请输入当前价格', trigger: 'blur' },
                ],
                short_desc: [
                    { required: true, message: '请输入游戏描述', trigger: 'blur' },
                ],
                poster: [
                    { required: true, message: '请输入游戏海报', trigger: 'blur' },
                ],
            }
        };
    },
    methods: {
        handleDetail(row) {
            this.action = 'detail'
            this.form = row
            this.formTitle = '游戏详情'
            this.showAddGameDialog = true
        },
        handleUpdate(row) {
            this.formTitle = '修改游戏'
            this.showAddGameDialog = true
            // 复制一份
            this.$nextTick(() => {
                this.form = Object.assign({}, row)
            })
            this.action = 'update'
        },
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
        doUpdate() {
            updateGame(this.form).then(res => {
                this.$message({
                    message: '修改成功',
                    type: 'success'
                })
                this.showAddGameDialog = false
                this.load()
                console.log(res)
            }).catch(err => {
                console.log(err)
            })
        },
        doAction() {
            // 表单验证
            this.$refs['addGame'].validate((valid) => {
                if (!valid) {
                    return
                }
                if (this.action === 'add') {
                    this.doAdd()
                } else {
                    this.doUpdate()
                }
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
            this.action = 'add'
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