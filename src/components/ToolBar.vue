<template>
    <div class="body-nav">
        <div class="body-nav-cart" @click="$router.push('/cart')">
            购物车
        </div>
        <div class="body-nav-bar">
            <div class="body-nav-avatar"></div>
            <div class="body-nav-opts">
                <div class="body-nav-opt" @click="$router.push('/home')">
                    商店
                </div>
                <div class="body-nav-opt" @click="$router.push('/mygame')">
                    我的游戏
                </div>
                <div class="body-nav-opt" @click="$router.push('/order')">
                    我的订单
                </div>
            </div>
            <div class="body-nav-search">
                <el-input style="height: 25px; border: none;" v-model="searchKey" placeholder="搜索" class="search-input">
                    <template #append>
                        <el-button @click="onSearch" :icon="Search" />
                    </template>
                </el-input>
            </div>
        </div>
    </div>
</template>

<script>
import { Search } from '@element-plus/icons-vue'

export default {
    name: 'ToolBar',
    // 让 router.push 的时候，即使已经是在 /search 页面，也能触发路由的变化
    data() {
        return {
            Search,
            searchKey: '',
            searchVal: this.$route.query.key,
        }
    },
    methods: {
        onSearch() {
            this.$router.push({
                path: '/search',
                query: {
                    key: this.searchKey
                }
            })
        }
    },
}
</script>

<style lang="less" scoped>
.body-nav {
    display: flex;
    width: 940px;
    margin: 0 auto;
    flex-direction: column;
    justify-content: space-around;
    align-items: end;
    height: 66px;

    .body-nav-cart {
        width: 102px;
        height: 20px;
        color: #fff;
        border-radius: 2px;
        font-size: 12px;
        box-shadow: 0 0 3px #000;
        text-align: center;
        cursor: pointer;
        transition: all 0.5s;
        background-image: url('https://store.akamai.steamstatic.com/public/images/v6/storemenu/background_wishlist.jpg');
    }

    .body-nav-cart:hover {
        background: linear-gradient(135deg, #ffffff 0%, #919aa3 100%);
        color: #111;
    }

    .body-nav-bar {
        display: flex;
        width: 100%;
        height: 35px;
        background: linear-gradient(90deg, rgba(62, 103, 150, 0.919) 11.38%, rgba(58, 120, 177, 0.8) 25.23%, rgb(15, 33, 110) 100%);
        box-shadow: 0 0 3px rgba(0, 0, 0, 0.4);

        .body-nav-search {
            height: 100%;
            display: flex;
            align-items: center;
            margin-right: 5px;
        }


        .body-nav-avatar {
            align-self: center;
            width: 25px;
            height: 25px;
            border-radius: 50%;
            background-color: #fff;
            margin: 0 10px;
        }

        .body-nav-opts {
            display: flex;
            flex: 1;
            align-items: center;
            color: #fff;
            font-size: 13px;
            line-height: 34px;
            font-weight: 700;
            text-shadow: 0 0 1px rgba(0, 0, 0, 0.4);

            .body-nav-opt {
                cursor: pointer;
                padding: 0px 20px;
                border-radius: 2px;
                transition: all 0.5s;
            }

            .body-nav-opt:hover {
                background-color: rgba(255, 255, 255, 0.2);
            }
        }
    }
}
</style>