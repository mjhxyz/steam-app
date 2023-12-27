<template>
    <div class="my-game">
        <el-dialog v-model="commentVisible" title="评论游戏" width="900px">
            <el-form :model="commentForm">
                <el-form-item label="评分">
                    <el-rate v-model="comment.rate" />
                </el-form-item>
                <el-form-item label="评价">
                    <el-input v-model="comment.content" :rows="2" type="textarea" placeholder="请输入评价" />
                </el-form-item>
            </el-form>
            <template #footer>
                <span class="dialog-footer">
                    <el-button @click="commentVisible = false">取消</el-button>
                    <el-button type="primary" @click="commentVisible = false">
                        提交
                    </el-button>
                </span>
            </template>
        </el-dialog>
        <div class="my-game-title">我的游戏</div>
        <div class="search-result-item">
            <div class="search-result-item-logo"></div>
            <div class="search-result-item-info">
                <div class="search-result-title mid">名称</div>
            </div>
            <div class="search-result-item-info">
                <div class="search-result-title mid" style="justify-content: flex-start; margin: 0;">入库日期</div>
            </div>
            <div class="search-result-item-info">
                <div class="search-result-title mid"></div>
            </div>
        </div>
        <div class="search-result-item" v-for="game in gameList" :key="game.id" @click="onGameClick(game.game)">
            <div class="search-result-item-logo">
                <img :src="game.game.logo" alt="">
            </div>
            <div class="search-result-item-info">
                <div class="search-result-title mid">{{ game.game.name }}</div>
            </div>
            <div class="search-result-item-info">
                <div class="search-result-time mid"> {{ game.game.add_time }}</div>
            </div>
            <div class="search-result-item-info" style="flex: 1">
                <div class="search-result-title mid" style="width: 100%;">
                    <!-- 评论按钮 防止点击到游戏详情 -->
                    <!-- <el-button type="text" size="small" @click.stop="onCommentClick(game)">评论</el-button> -->
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import { getMyGameList } from '@/api/front/my_game'
import { getUser } from '@/utils/auth'


export default {
    name: 'MyGame',
    data() {
        return {
            comment: {
                content: '',
                rate: 0,
            },
            commentVisible: false,
            gameList: [],
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
        },
        onGameClick(game) {
            this.$router.push({
                path: '/detail',
                query: {
                    id: game.id
                }
            })
        },
        onCommentClick(game) {
            // 直接弹出 el-dialog
            this.commentVisible = true
            this.$message({
                message: '评论',
                type: 'success'
            })
            console.log(game)
        },
        load() {
            // 判断是否登录
            const user = this.validLogin()
            if (!user) {
                return
            }
            getMyGameList(user.id).then(res => {
                this.gameList = res.data
                console.log(res)
            }).catch(err => {
                console.log(err)
            })
        }
    },
    mounted() {
        // this.generateGameList()
        this.load()
    }
}

</script>

<style lang="less" scoped>
.mid {
    display: flex;
    justify-content: center;
    align-items: center;
}

.my-game {
    width: 940px;
    margin: 0 auto;

    .my-game-title {
        color: #ffffff;
        font-size: 34px;
        font-family: "Motiva Sans", Sans-serif;
        font-weight: 300;
        text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.4);
        margin-bottom: 20px;
    }

    .search-result-item {
        display: flex;
        align-items: center;
        height: 45px;
        margin-bottom: 10px;
        cursor: pointer;
        border: 1px solid transparent;
        transition: all 0.5s;
        background: #000000;
        background: rgba(0, 0, 0, 0.2);

        &:hover {
            text-decoration: none;
            color: #bdc6cd;
            border: 1px solid rgba(139, 185, 224, 0.2);
            background: rgba(0, 0, 0, 0.4);
        }

        .search-result-item-logo {
            width: 120px;
            height: 45px;

            img {
                width: 100%;
                height: 100%;
            }
        }

        .search-result-item-info {
            width: 200px;
            height: 100%;
            display: flex;

            .search-result-title {
                margin-left: 5px;
                color: #c6d4df;
                font-family: "Motiva Sans", Sans-serif;
                font-weight: 300;
                width: 275px;
                height: 45px;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

            .search-result-time {
                font-size: 12px;
                color: #8F98A0;
            }

            .search-result-price-pct {
                width: 100px;
                height: 20px;
                background-color: #000;
                border-radius: 2px;
                font-size: 12px;
                color: #fff;
                display: flex;
                justify-content: center;
                align-items: center;

                .search-result-price-pct-box {
                    width: 100%;
                    height: 100%;
                    background-color: #000;
                    border-radius: 2px;
                    font-size: 12px;
                    color: #fff;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }
            }

            .search-result-price {
                display: flex;
                justify-content: space-between;
                align-items: center;

                .search-result-price-original {
                    font-size: 12px;
                    color: #8F98A0;
                    text-decoration: line-through;
                }

                .search-result-price-final {
                    font-size: 16px;
                    font-weight: bold;
                }
            }
        }
    }
}
</style>