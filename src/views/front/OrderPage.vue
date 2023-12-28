<template>
    <!-- 每个订单的信息 有 多个订单详情 orderItems, 每个订单详情里面有游戏信息 game 
        我希望能将 每个订单的所有订单详情里的内容展示出来，并且能够点击完成订单 -->
    <div class="order-page">

        <div class="shopping-cart">
            <div class="shopping-title">我的订单</div>
            <div class="cart-game-list">
                <div class="cart-game-item" v-for="order in orderList" :key="order.id">
                    <div class="cart-game-logo">
                        <img :src="order.orderItems[0].game.logo" alt="">
                    </div>
                    <div class="cart-game-info">
                        <div class="cart-game-title">{{ order.orderItems[0].game.name }} 等 {{ order.orderItems.length }} 件商品
                        </div>
                        <div class="cart-game-time">购买时间：{{ order.add_time }}</div>
                    </div>
                    <div class="cart-game-price">
                        <div class="cart-game-price-final">总价：{{ order.total }}</div>
                    </div>
                    <div class="cart-game-opts">
                        <el-button type="primary" size="mini" @click="handleFinish(order.id)" v-if="order.status !== '已完成'">
                            完成订单
                        </el-button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { getOrderList } from '@/api/front/order';
import { getUser } from '@/utils/auth';
import { finishOrder } from '@/api/front/order';

export default {
    name: "OrderPage",
    data() {
        return {
            orderList: [],
        };
    },
    methods: {
        handleFinish(id) {
            this.$confirm('确认完成订单吗？', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                finishOrder(id).then(() => {
                    this.$message({
                        message: '订单完成',
                        type: 'success'
                    });
                    this.getOrderList();
                }).catch(err => {
                    console.log(err);
                });
            }).catch(() => {
            });
        },
        getOrderList() {
            // 检查是否登录
            if (!getUser()) {
                this.$router.push('/login');
                return;
            }
            getOrderList(getUser().id).then(res => {
                console.log(res);
                this.orderList = res.data;
            }).catch(err => {
                console.log(err);
            });
        }
    },
    created() {
        this.getOrderList();
    }
};

</script>

<style lang="less" scoped>
.buy-button {
    border-radius: 2px;
    border: none;
    padding: 1px;
    display: inline-block;
    cursor: pointer;
    text-decoration: none !important;
    color: #D2E885 !important;
    background: rgba(121, 153, 5, 1);
    background: -webkit-linear-gradient(top, rgba(121, 153, 5, 1) 5%, rgba(83, 105, 4, 1) 95%);
    background: linear-gradient(to bottom, rgba(121, 153, 5, 1) 5%, rgba(83, 105, 4, 1) 95%);
    padding: 0px 20px;
}

.buy-button:hover {
    background: rgba(121, 153, 5, 1);
    background: -webkit-linear-gradient(bottom, rgba(121, 153, 5, 1) 5%, rgba(83, 105, 4, 1) 95%);
    background: linear-gradient(to top, rgba(121, 153, 5, 1) 5%, rgba(83, 105, 4, 1) 95%);
    transition: all 0.5s;
}

.shopping-cart {
    width: 940px;
    margin: 0 auto;
    margin-top: 50px;
    margin-bottom: 50px;
    display: flex;
    flex-direction: column;
    justify-content: center;

    .shopping-title {
        font-size: 24px;
        color: #fff;
        margin-bottom: 20px;
    }

    .cart-game-list {
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .cart-game-item {
        color: #c7d5e0;
        width: 100%;
        height: 77px;
        margin-bottom: 3px;
        display: flex;
        align-items: center;
        padding: 0px 15px;
        background-color: #16202d;

        .cart-game-logo {
            width: 120px;
            height: 45px;
            display: flex;
            justify-content: center;

            img {
                width: 100%;
                height: 100%;
            }
        }

        .cart-game-info {
            width: 500px;
            height: 100%;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            margin-left: 20px;

            .cart-game-title {
                font-size: 16px;
                margin-bottom: 5px;
            }

            .cart-game-time {
                font-size: 12px;
                color: #8F98A0;
                margin-bottom: 10px;
            }
        }

        .cart-game-price {
            width: 120px;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-end;

            .cart-game-price-original {
                font-size: 12px;
                color: #8F98A0;
                text-decoration: line-through;
            }

            .cart-game-price-final {
                font-size: 16px;
                color: #BEEE11;
            }
        }

        .cart-game-opts {
            width: 100px;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    }
}
</style>

