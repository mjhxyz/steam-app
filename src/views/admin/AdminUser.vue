<template>
    <div>
        <el-table :data="tableData">
            <el-table-column prop="date" label="Date" width="140" />
            <el-table-column prop="name" label="Name" width="120" />
            <el-table-column prop="address" label="Address" />
        </el-table>
    </div>
</template>

<script>

const item = {
    date: '2016-05-02',
    name: 'Tom',
    address: 'No. 189, Grove St, Los Angeles',
}
const tableData = Array.from({ length: 20 }).fill(item)

export default {
    name: "AdminUser",
    data() {
        return {
            tableData
        };
    },
    methods: {
    },
};

</script>

<style lang="less" scoped></style>