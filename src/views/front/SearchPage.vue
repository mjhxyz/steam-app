<template>
    <div class="search-container">
        <div class="search-key">所有产品</div>
        <div class="search-desc part">{{ gameList.length }} 个匹配的搜索结果。 </div>
        <div class="search-result">
            <div class="search-result-row part" v-for="game in gameList" :key="game.id" @click="onGameClick(game)">
                <div class="search-result-image">
                    <img :src="game.logo" width="120" height="45" />
                </div>
                <div class="search-result-title mid">{{ game.name }}</div>
                <div class="search-result-time mid"> {{ game.add_time }}</div>
                <div class="search-result-price-pct mid">
                    <div class="search-result-price-pct-box">
                        <!-- 不保留小数 -->
                        -{{ Math.round((game.origin_price - game.final_price) / game.origin_price * 100) }}%
                    </div>
                </div>
                <div class="search-result-price mid">
                    <div class="search-result-price-original">￥{{ game.origin_price }}</div>
                    <div class="search-result-price-final">￥{{ game.final_price }}</div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import { searchGame } from '@/api/front/game'

export default {
    name: 'SearchPage',
    components: {
    },
    data() {
        return {
            gameList: [],
            searchVal: this.$route.query.key,
        }
    },
    watch: {
        searchVal: {
            immediate: true,
            deep: true,
            handler() {
                this.search(this.searchVal)
            },
        },
        '$route.query': {
            immediate: true, // 保证组件初始化时也会执行
            deep: true, // 监听嵌套属性的变化
            handler(newQuery) {
                this.search(newQuery.key);
            },
        },
    },
    created() {
        // 获取搜索关键字
        this.search(this.$route.query);
    },
    methods: {
        search(key) {
            searchGame(key).then(res => {
                this.gameList = res.data
                console.log(res)
            }).catch(err => {
                console.log(err)
            })
        },
        onGameClick(game) {
            this.$router.push({
                path: '/detail',
                query: {
                    id: game.id
                }
            })
        },
    },
    mounted() {
    }
}
</script>

<style lang="less" scoped>
.mid {
    display: flex;
    align-items: center;
}

.part {
    font-family: Arial, Helvetica, sans-serif;
    color: #c6d4df;
    font-size: 12px;
    margin-bottom: 5px;
    display: block;
    text-decoration: none;
    color: #c6d4df;
    font-family: "Motiva Sans", Sans-serif;
    font-weight: 300;
}

.search-container {
    width: 100%;
    background: #1b2838;

    .search-result {
        width: 940px;
        margin: 0 auto;
        min-height: 400px;
        display: flex;
        flex-direction: column;

        .search-result-row {
            width: 100%;
            height: 45px;
            border: 1px solid rgba(139, 185, 224, 0);
            overflow: hidden;
            transition: height 0.25s, margin 0.25s;
            margin-bottom: 5px;
            cursor: pointer;
            background: rgba(0, 0, 0, 0.2);

            display: flex;

            .search-result-image {
                width: 120px;
                height: 45px;
            }

            .search-result-title {
                margin-left: 5px;
                width: 275px;
                height: 45px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

            .search-result-time {
                width: 120px;
                height: 45px;
            }

            .search-result-price-pct {
                width: 120px;
                height: 45px;
                display: flex;
                justify-content: flex-end;
                align-items: center;

                .search-result-price-pct-box {
                    font-family: "Motiva Sans", Sans-serif;
                    font-weight: normal;
                    font-weight: 500;
                    color: #BEEE11;
                    background: #4c6b22;
                    display: inline-block;
                    padding: 5px;
                }
            }

            .search-result-price {
                flex: 1;
                width: 120px;
                height: 45px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: flex-end;
                padding-right: 10px;

                .search-result-price-original {
                    color: #888888;
                    text-decoration: line-through;
                }

                .search-result-price-final {
                    font-size: 13px;
                    color: #BEEE11;
                }
            }
        }

        .search-result-row:hover {
            margin-bottom: 5px;
            text-decoration: none;
            color: #c6d4df;
            font-family: "Motiva Sans", Sans-serif;
            font-weight: 300;
            border: 1px solid rgba(139, 185, 224, 0.2);
            background: rgba(0, 0, 0, 0.4);
        }
    }

    .search-desc {
        padding-left: 10px;
        background: #000000;
        background: rgba(0, 0, 0, 0.2);
        height: 36px;
        display: flex;
        align-items: center;
    }

    .search-key {
        width: 940px;
        margin: 0 auto;
        height: 60px;
        font-size: 18px;
        color: #9099a1;
        font-family: "Motiva Sans", Sans-serif;
        font-weight: 300;
        display: flex;
        align-items: center;
    }
}
</style>
