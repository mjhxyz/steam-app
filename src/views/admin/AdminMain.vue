<template>
    <div class="container">
        <div class="title">数据统计</div>
        <div class="row">
            <div class="col cur-date">
                当日数据
            </div>
            <div class="col">
                <span class="data"> {{ today.userCount }}&nbsp;</span>
                <span>新增用户</span>
            </div>
            <div class="col">
                <span class="data"> {{ today.orderCount }}&nbsp;</span>
                <span>新增订单</span>
            </div>
            <div class="col">
                <span class="data"> {{ today.myGameCount }}&nbsp;</span>
                <span>游戏销量</span>
            </div>
        </div>
        <div class="row">
            <div class="col total-date">
                总数据
            </div>
            <div class="col">
                <span class="data"> {{ total.userCount }}&nbsp;</span>
                <span>用户</span>
            </div>
            <div class="col">
                <span class="data"> {{ total.orderCount }}&nbsp;</span>
                <span>订单</span>
            </div>
            <div class="col">
                <span class="data"> {{ total.myGameCount }}&nbsp;</span>
                <span>游戏销量</span>
            </div>
        </div>
        <div id="charts" style="width: 100%;height:400px;">
        </div>
    </div>
</template>

<script>

import { getTodayStatList, getTotalStatList, getStatByDay } from '@/api/admin/stat'

export default {
    name: "AdminMain",
    data() {
        return {
            chart: null,
            today: {
                myGameCount: 0,
                orderCount: 0,
                userCount: 0,
            },
            total: {
                myGameCount: 0,
                orderCount: 0,
                userCount: 0,
            }
        };
    },
    methods: {
        initChart() {
            // 基于准备好的dom，初始化echarts实例
            this.chart = this.$echarts.init(document.getElementById('charts'));
            // 绘制图表
            this.chart.setOption({
                title: {
                    text: '趋势图'
                },
                tooltip: {},
                xAxis: {
                    data: []
                },
                yAxis: {},
                series: []
            });
        }
    },
    created() {
        // 加载今日数据
        getTodayStatList().then(res => {
            console.log(res)
            this.today = res.data
        }).catch(err => {
            console.log(err)
        })
        // 加载总数据
        getTotalStatList().then(res => {
            console.log(res)
            this.total = res.data
        }).catch(err => {
            console.log(err)
        })
    },
    mounted() {
        this.initChart()
        // 加载图表数据
        getStatByDay().then(res => {
            console.log(res)
            let markPoint = {
                data: [
                    { type: 'max', name: '最大值' },
                    { type: 'min', name: '最小值' }
                ]

            }
            // 更新图表数据, 图片有三组数据，分别是游戏 用户数，订单数, 都按照日期排序
            let data = res.data
            this.chart.setOption({
                xAxis: {
                    data: data.date
                },
                series: [{
                    name: '游戏',
                    type: 'line',
                    data: data.myGameCount,
                    markPoint
                }, {
                    name: '用户',
                    type: 'line',
                    data: data.userCount,
                    markPoint
                }, {
                    name: '订单',
                    type: 'line',
                    data: data.orderCount,
                    markPoint
                }]
            });
        }).catch(err => {
            console.log(err)
        })
    }
};
</script>

<style lang="less" scoped>
.container {
    padding: 20px;
    width: 940px;
    margin: 0 auto;
}

.title {
    font-size: 20px;
    text-align: center;
    margin-bottom: 40px;
}

.row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 40px;
}

.col {
    background-color: #dedfe0;
    width: 200px;
    height: 100px;
    border-radius: 3px;
    box-shadow: 0 0 10px #ddd;
    display: flex;
    justify-content: center;
    align-items: center;
}

.data {
    font-size: 30px;
    font-weight: bold;
}

.cur-date {
    background-color: #eebe77;
    color: #fff;
    font-size: 20px;
}

.total-date {
    background-color: #95d475;
    color: #fff;
    font-size: 20px;
}
</style>