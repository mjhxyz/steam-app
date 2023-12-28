<template>
    <div class="shopping-cart">
        <!-- 订单生成 model -->
        <!-- 风格保持一样 -->
        <el-dialog title="订单生成" v-model="dialogVisible" width="30%" :before-close="handleClose"
            :close-on-click-modal="false" style="overflow: hidden; border-radius: 5px;">
            <el-form :model="orderForm" :rules="orderRule" ref="order" label-width="100px" class="demo-ruleForm">
                <!-- 支付方式 -->
                <el-form-item label="支付方式" prop="payment_type">
                    <el-radio-group v-model="orderForm.payment_type">
                        <el-radio label="1">微信支付</el-radio>
                        <el-radio label="2">支付宝支付</el-radio>
                        <el-radio label="3">赊账</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="备注" prop="remark">
                    <el-input v-model="orderForm.remark"></el-input>
                </el-form-item>
            </el-form>
            <!-- 展示包含的游戏 还要包含总价 -->
            <div class="cart-game-list">
                <div class="cart-game-item" v-for="game in gameList" :key="game.id">
                    <div class="cart-game-logo">
                        <img :src="game.game.logo" alt="">
                    </div>
                    <div class="cart-game-info">
                        <div class="cart-game-title">{{ game.game.name }}</div>
                        <div class="cart-game-time">{{ game.game.create_time }}</div>
                    </div>
                    <div class="cart-game-price">
                        <div class="cart-game-price-original">￥{{ game.game.origin_price }}</div>
                        <div class="cart-game-price-final">￥{{ game.game.final_price }}</div>
                    </div>
                </div>
                <div class="cart-game-item">
                    <div class="cart-game-info">
                        <div class="cart-game-title">总价</div>
                    </div>
                    <div class="cart-game-price">
                        <div class="cart-game-price-final">￥{{ totalPrice }}</div>
                    </div>
                </div>
            </div>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="dialogVisible = false">取 消</el-button>
                    <el-button type="primary" @click="orderSubmit">
                        提交
                    </el-button>
                </span>
            </template>
        </el-dialog>

        <div class="shopping-title">
            您的购物车 ({{ gameList.length }})
        </div>
        <div class="cart-game-list">
            <div class="cart-game-item" v-for="game in gameList" :key="game.id">
                <div class="cart-game-logo">
                    <img :src="game.game.logo" alt="">
                </div>
                <div class="cart-game-info">
                    <div class="cart-game-title">{{ game.game.name }}</div>
                    <div class="cart-game-time">{{ game.game.create_time }}</div>
                </div>
                <div class="cart-game-price">
                    <div class="cart-game-price-original">￥{{ game.game.origin_price }}</div>
                    <div class="cart-game-price-final">￥{{ game.game.final_price }}</div>
                </div>
                <div class="cart-game-opts">
                    <el-button style="font-size: 12px;" type="text" size="small" @click="onRemoveClick(game.id)">
                        移除
                    </el-button>
                </div>
            </div>
            <div class="cart-game-item">
                <div class="cart-game-info">
                    <el-button class="buy-button" type="primary" size="medium" @click="onBuyClick">
                        <i class="el-icon-shopping-cart-2"></i>购买
                    </el-button>
                </div>
                <div class="cart-game-price">
                    <div class="cart-game-price-final">￥{{ totalPrice }}</div>
                </div>
                <div class="cart-game-opts">
                </div>
            </div>

        </div>
    </div>
</template>

<script>
import { getCartList, deleteCart } from '@/api/front/cart'
// import { getCartList, deleteCart, buyCart } from '@/api/front/cart'
import { getUser } from '@/utils/auth'
import { addOrder } from '@/api/front/order'

export default {
    name: 'ShoppingCart',
    data() {
        return {
            orderRule: {
                payment_type: [
                    { required: true, message: '请选择支付方式', trigger: 'blur' },
                ],
            },
            dialogVisible: false,
            gameList: [],
            orderForm: {
                payment_type: '1',
                remark: ''
            }
        }
    },
    methods: {
        validLogin() {
            if (!getUser()) {
                this.$message({
                    message: '请先登录',
                    type: 'warning'
                })
                this.$router.push({
                    path: '/login'
                })
                return false
            }
            return getUser()
        },
        orderSubmit() {
            this.$refs['order'].validate((valid) => {
                // user_id, payment_type, remark
                if (valid) {
                    // 提交订单
                    addOrder({
                        user_id: getUser().id,
                        payment_type: this.orderForm.payment_type,
                        remark: this.orderForm.remark,
                    }).then(res => {
                        this.$message({
                            message: '购买成功',
                            type: 'success'
                        })
                        this.dialogVisible = false
                        this.load()
                        // 跳转到我的游戏
                        this.$router.push({
                            path: '/mygame'
                        })
                        console.log(res)
                    }).catch(err => {
                        console.log(err)
                    })
                    return true
                }
                return false
            });
        },
        load() {
            // 判断是否登录
            const user = this.validLogin()
            if (!user) {
                return
            }
            getCartList(user.id).then(res => {
                this.gameList = res.data
                console.log(res)
            }).catch(err => {
                console.log(err)
            })
        },
        onBuyClick() {
            if (this.gameList.length === 0) {
                this.$message({
                    message: '购物车为空',
                    type: 'warning'
                })
                return
            }
            this.dialogVisible = true
            // 判断是否登录
            // const user = this.validLogin()
            // if (!user) {
            //     return
            // }
            // buyCart(user.id).then(res => {
            //     this.$message({
            //         message: '购买成功',
            //         type: 'success'
            //     })
            //     this.load()
            //     // 跳转到我的游戏
            //     this.$router.push({
            //         path: '/mygame'
            //     })
            //     console.log(res)
            // }).catch(err => {
            //     console.log(err)
            // })
        },
        onRemoveClick(id) {
            // this.gameList.splice(this.gameList.indexOf(game), 1)
            deleteCart(id).then(res => {
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
        generateGameList() {
            for (let i = 0; i < 5; i++) {
                this.gameList.push({
                    id: i,
                    logo: 'https://cdn.akamai.steamstatic.com/steam/apps/730/capsule_sm_120_schinese.jpg?t=1698860631',
                    name: `Counter-Strike ${i}`,
                    create_time: '2023/12/25',
                    origin_price: 59.99,
                    final_price: 53.99
                })
            }
        }
    },
    computed: {
        totalPrice() {
            let total = 0
            for (let i = 0; i < this.gameList.length; i++) {
                total += this.gameList[i].game.final_price
            }
            return total
        }
    },

    mounted() {
        // this.generateGameList()
        this.load()
    }
}
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