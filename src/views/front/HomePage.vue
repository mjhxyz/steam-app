<template>
    <div class="container">
        <LoginNav />
        <div class="container-body">
            <ToolBar />
            <div class="body-recommend">
                <el-carousel indicator-position="outside" arrow="always" trigger="click">
                    <el-carousel-item v-for="cardList, i in gameCartList" :key="i" >
                        <div class="game-card-wrapper" style="width: 1200px;">
                            <div class="game-card" v-for="card, index in cardList" :key="index"
                                :style="{ backgroundImage: 'url(' + card.poster + ')' }" @click="onGameClick(card)">
                            </div>
                        </div>
                    </el-carousel-item>
                </el-carousel>
            </div>
            <div class="body-game-list">
                <div class="body-game-list-item" v-for="game in gameList" :key="game" @click="onGameClick(game)">
                    <div class="body-game-review" :style="{ backgroundImage: 'url(' + game.poster + ')' }"></div>
                    <div class="body-game-label">
                        <!-- 计算，保留整数 -->
                        <div class="discount-pct">-{{ parseInt((game.origin_price - game.final_price) / game.origin_price *
                            100) }}%</div>
                        <div class="discount-price">
                            <div class="discount-original-price">￥ {{ game.origin_price }}</div>
                            <div class="discount-final-price">￥ {{ game.final_price }}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-footer">
            <div class="footer-content">
                <div class="rule"></div>
                <div class="footer-content-center">
                    <p class='footer-text'>©2023 Valve Corporation。保留所有权利。所有商标均为其在美国及其它国家/地区的各自持有者所有。</p>
                    <p class='footer-text'>所有的价格均已包含增值税（如适用）。 隐私政策 | 法律信息 | Steam 订户协议 | 退款 | Cookie </p>
                </div>
                <div class="rule"></div>
            </div>
        </div>
    </div>
</template>

<script>
import LoginNav from '@/components/LoginNav.vue'
import ToolBar from '@/components/ToolBar.vue'
import { Search } from '@element-plus/icons-vue'
import { getPosterGameList } from '@/api/front/home';
export default {
    name: "StoreHome",
    components: {
        LoginNav, ToolBar
    },
    data() {
        return {
            Search,
            searchKey: "",
            gameList: [
                {
                    imageUrl: "https://cdn.akamai.steamstatic.com/steam/apps/1627720/hero_capsule.jpg?t=1701760966",
                    url: "https://store.steampowered.com/app/1627720/Loop_Hero/",
                },
                {
                    imageUrl: "https://cdn.akamai.steamstatic.com/steam/apps/1971870/hero_capsule.jpg?t=1702393935",
                    url: "https://store.steampowered.com/app/1627720/Loop_Hero/",
                },
                {
                    imageUrl: "https://cdn.akamai.steamstatic.com/steam/apps/2519060/hero_capsule_schinese.jpg?t=1702580949",
                    url: "https://store.steampowered.com/app/1627720/Loop_Hero/",
                },
                {
                    imageUrl: "https://cdn.akamai.steamstatic.com/steam/apps/1272080/hero_capsule.jpg?t=1702547327",
                    url: "https://store.steampowered.com/app/1627720/Loop_Hero/",
                },
                {
                    imageUrl: "https://cdn.akamai.steamstatic.com/steam/apps/2399830/hero_capsule.jpg?t=1699643475",
                    url: "https://store.steampowered.com/app/1627720/Loop_Hero/",
                },
                {
                    imageUrl: "https://cdn.akamai.steamstatic.com/steam/apps/1627720/hero_capsule.jpg?t=1701760966",
                    url: "https://store.steampowered.com/app/1627720/Loop_Hero/",
                }

            ],
            gameCartList: [
                [
                    {
                        imageUrl: "https://cdn.akamai.steamstatic.com/steam/apps/1627720/hero_capsule.jpg?t=1701760966",
                        url: "https://store.steampowered.com/app/1627720/Loop_Hero/",
                    },
                    {
                        imageUrl: "https://cdn.akamai.steamstatic.com/steam/apps/1971870/hero_capsule.jpg?t=1702393935",
                        url: "https://store.steampowered.com/app/1627720/Loop_Hero/",
                    },
                    {
                        imageUrl: "https://cdn.akamai.steamstatic.com/steam/apps/2519060/hero_capsule_schinese.jpg?t=1702580949",
                        url: "https://store.steampowered.com/app/1627720/Loop_Hero/",
                    }
                ],
                [
                    {
                        imageUrl: "https://cdn.akamai.steamstatic.com/steam/apps/1272080/hero_capsule.jpg?t=1702547327",
                        url: "https://store.steampowered.com/app/1627720/Loop_Hero/",
                    },
                    {
                        imageUrl: "https://cdn.akamai.steamstatic.com/steam/apps/2399830/hero_capsule.jpg?t=1699643475",
                        url: "https://store.steampowered.com/app/1627720/Loop_Hero/",
                    },
                    {
                        imageUrl: "https://cdn.akamai.steamstatic.com/steam/apps/1627720/hero_capsule.jpg?t=1701760966",
                        url: "https://store.steampowered.com/app/1627720/Loop_Hero/",
                    }
                ]

            ]
        };
    },
    methods: {
        onGameClick(game) {
            this.$router.push({ path: '/detail', query: { id: game.id } })
        },
        load() {
            getPosterGameList().then(res => {
                this.gameList = res.data
                // 三个一组
                this.gameCartList = []
                for (let i = 0; i < this.gameList.length; i += 3) {
                    this.gameCartList.push(this.gameList.slice(i, i + 3))
                }
                console.log(res)
            }).catch(err => {
                console.log(err)
            })
        },
        onSearch() {
            this.$errorMsg("暂未开放");
        }
    },
    mounted() {
        this.load()
    }
};

</script>

<style lang="less" scoped>
.body-nav-search {
    height: 100%;
    display: flex;
    align-items: center;
    margin-right: 5px;
}

.footer-content-center {
    display: flex;
    flex-direction: column;
}

.rule {
    height: 8px;
    width: 100%;
    border-top: 1px solid #363c44;
    margin: 10px 0px;
}

.container {
    width: 100%;
    min-height: 100%;
    background-color: #171d25;
}

.footer-text {
    float: left;
    margin-left: 12px;
    color: #8F98A0;
    font-size: 12px;
    line-height: 16px;
}

.container-footer {
    margin-top: 50px;
    width: 100%;
    height: 180px;
    background-color: #000;


    .footer-content {
        width: 1200px;
        margin: 0 auto;
        height: 100%;
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
    }
}



.container-body {
    width: 100%;
    min-height: 900px;
    background-repeat: no-repeat;
    background-position: center top;
    background-image: url("https://cdn.akamai.steamstatic.com/steam/clusters/sale_winter2023/36a01fe4331ab0ca600ff205/home_header_bg_day_schinese.gif?t=1702509152");

    .body-game-list {
        width: 1200px;
        margin: 0 auto;
        padding: 24px 36px;
        margin-top: 20px;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        align-items: center;

        .body-game-list-item {
            width: 273px;
            height: 183px;
            margin-bottom: 10px;
            transition: all 0.5s;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            cursor: pointer;

            .body-game-review {
                background-repeat: no-repeat;
                background-position: center center;
                width: 100%;
                height: 100%;
                color: #fff;
                font-size: 12px;
                text-align: center;
                line-height: 20px;
                border-radius: 2px;
                box-shadow: 0 0 3px #000;
            }

            .body-game-review:hover {
                transform: scale(1.1);
                transition: all 0.5s;
            }

            .body-game-label {
                background-color: transparent;
                width: 100%;
                height: 30px;
                color: #fff;
                font-size: 12px;
                line-height: 30px;
                display: flex;

                .discount-pct {
                    font-weight: bold;
                    color: #000000;
                    background: #A1CD44;
                    padding: 6px;
                    font-size: 16px;
                    line-height: 16px;
                }

                .discount-price {
                    height: 100%;
                    text-align: center;
                    border-radius: 0 2px 2px 0;
                    font-size: 12px;
                    line-height: 30px;
                    display: flex;
                }

                .discount-original-price {
                    text-decoration: line-through;
                    color: #919aa3;
                    font-size: 14px;
                }

                .discount-final-price {
                    color: #fff;
                    font-size: 14px;
                }


            }
        }
    }

    .body-recommend {
        width: 1400px;
        height: 600px;
        margin: 0 auto;
        margin-top: 535px;

        .el-carousel {
            height: 100%;
        }

        /deep/ .el-carousel__container {
            height: 500px;
        }

        .el-carousel__item {
            height: 100%;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .game-card-wrapper {
            display: flex;
            width: 1200px;
            justify-content: space-around;
            align-items: center;

            .game-card {
                width: 374px;
                height: 450px;
                cursor: pointer;
            }

            .game-card:hover {
                transform: scale(1.1);
                transition: all 0.5s;
            }
        }
    }

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

}
</style>
