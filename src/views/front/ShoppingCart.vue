<template>
    <div class="shopping-cart">
        <div class="shopping-title">
            您的购物车 ({{ gameList.length }})
        </div>
        <div class="cart-game-list">
            <div class="cart-game-item" v-for="game in gameList" :key="game.id">
                <div class="cart-game-logo">
                    <img :src="game.logo" alt="">
                </div>
                <div class="cart-game-info">
                    <div class="cart-game-title">{{ game.name }}</div>
                    <div class="cart-game-time">{{ game.create_time }}</div>
                </div>
                <div class="cart-game-price">
                    <div class="cart-game-price-original">￥{{ game.origin_price }}</div>
                    <div class="cart-game-price-final">￥{{ game.final_price }}</div>
                </div>
                <div class="cart-game-opts">
                    <el-button style="font-size: 12px;" type="text" size="small">移除</el-button>
                </div>
            </div>
            <div class="cart-game-item">
                <div class="cart-game-info">
                    <el-button class="buy-button" type="primary" size="medium">购买</el-button>
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

export default {
    name: 'ShoppingCart',
    data() {
        return {
            gameList: [],
        }
    },
    methods: {
        generateGameList() {
            for (let i = 0; i < 20; i++) {
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
                total += this.gameList[i].final_price
            }
            return total
        }
    },

    mounted() {
        this.generateGameList()
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