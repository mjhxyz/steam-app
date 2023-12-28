<template>
    <div class="detail-container">
        <div class="game-title">{{ game.name }}</div>
        <div class="game-detail">
            <div class="game-images">
                <el-carousel :interval="5000" arrow="always" height="400px">
                    <el-carousel-item v-for="image in game.images" :key="image">
                        <img :src="image" width="600" height="400" />
                    </el-carousel-item>
                </el-carousel>
            </div>
            <div class="game-info">
                <div class="game-logo">
                    <img :src="game.logo" width="324" height="151" />
                </div>
                <div class="game-short-desc">
                    {{ game.short_desc }}
                </div>
                <div class="game-label-value">
                    <div class="game-label">发行日期:</div>
                    <div class="game-value">{{ game.add_time }}</div>
                </div>
            </div>
        </div>
        <div class="game-buy">
            <div class="game-area-purchase-game">
                <div class="game-buy-title">购买 {{ game.name }}</div>
                <div class="game-purchase-action">
                    <div class="game-purchase-action-bg">
                        <div class="game-purchase-price">14,29￥</div>
                        <div class="game-add-to-cart" @click="onAddToCartClick">
                            加入购物车
                        </div>
                    </div>
                </div>
            </div>
            <div class="game-area-game-desc">
                <div class="game-about-title">关于这款游戏</div>
                <div class="game-about-long-desc">
                    {{ game.long_desc }}
                </div>
            </div>
            <div class="game-comment">
                <div class="game-comment-title">
                    最有价值的评论
                </div>
                <div class="game-comment-list">
                    <div class="game-comment-item" v-for="comment in commentList" :key="comment.id">
                        <div class="comment-user">
                            <div class="comment-user-avator">
                                <img :src="'https://api.multiavatar.com/' + comment.user_id + '1.png'" width="34"
                                    height="34" />
                            </div>
                            <div class="comment-user-name">
                                {{ comment.user.name || '无名氏' }}
                            </div>
                        </div>
                        <div class="comment-body">
                            <div class="comment-stars">
                                <el-rate style="justify-content: start;" v-model="comment.rate" disabled></el-rate>
                            </div>
                            <div class="comment-time">发布于：{{ comment.add_time }}</div>
                            <div class="comment-conent"> {{ comment.content }} </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { getGameDetail } from '@/api/front/game';
import { addCart } from '@/api/front/cart';
import { getUser } from '@/utils/auth';
import { getCommentListByGameId } from '@/api/front/comment';

export default {
    name: 'GameDetail',
    data() {
        return {
            commentList: [],
            game: {
            }
        }
    },
    methods: {
        onAddToCartClick() {
            // 检查是否登录
            if (!getUser()) {
                this.$message({
                    message: '请先去登录',
                    type: 'warning'
                });
                return
            }
            let user = getUser()
            addCart(user.id, this.game.id).then(res => {
                console.log(res)
                this.$message({
                    message: '加入购物车成功',
                    type: 'success'
                });
                // 跳转到购物车页面
                this.$router.push({
                    path: '/cart'
                })
            }).catch(err => {
                console.log(err)
            })
        },
    },
    created() {
        // 获取 id
        const id = this.$route.query.id
        getGameDetail(id).then(res => {
            let images = res.data.images
            images = images.split(',')
            res.data.images = images
            this.game = res.data
            console.log(this.game)
        }).catch(err => {
            console.log(err)
        })
        // 获取评论
        getCommentListByGameId({ game_id: id }).then(res => {
            this.commentList = res.data
            console.log(res)
        }).catch(err => {
            console.log(err)
        })
    }
}

</script>

<style lang="less" scoped>
/deep/ .el-rate {
    align-items: flex-start;
}

.detail-container {
    width: 100%;
    min-height: 100%;
    background: #1b2838;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-top: 20px;

    .game-title {
        width: 940px;
        height: 40px;
        font-size: 24px;
        color: #fff;
        line-height: 40px;
    }

    .game-buy {
        width: 940px;
        // background: #171d25;
        margin-top: 20px;
        // background: linear-gradient( -60deg, rgba(226,244,255,0.2) 0%,rgba(97,100,101,0.2) 100%);

        .game-comment {
            width: 940px;
            background: #171d25;
            // overflow: scroll;
            margin-top: 20px;
            padding: 16px;
            padding-bottom: 26px;
            border-radius: 4px;
            font-family: "Motiva Sans", Sans-serif;
            font-weight: normal;
            font-size: 13px;
            color: #c6d4df;

            .game-comment-title {
                font-size: 14px;
                text-transform: uppercase;
                color: #fff;
                padding-bottom: 4px;
                font-family: "Motiva Sans", Sans-serif;
                font-weight: normal;
                background-image: url(https://store.akamai.steamstatic.com/public/images/v6/maincol_gradient_rule.png);
                background-repeat: no-repeat;
                background-position: bottom left;
            }

            .game-comment-list {
                color: #c6d4df;
                min-height: 111px;
                font-size: 13px;
                line-height: 1.5em;
                padding-right: 16px;
                display: -webkit-box;
                -webkit-line-clamp: 6;
                -webkit-box-orient: vertical;
            }

            .game-comment-item {
                display: flex;
                margin-top: 20px;
                color: #c6d4df;
                font-size: 13px;
                line-height: 18px;
                padding-right: 16px;

                .comment-user {
                    display: flex;
                    justify-content: space-between;
                    width: 200px;

                    .comment-user-avator {
                        width: 34px;
                        height: 34px;
                        border-radius: 50%;
                        padding: 1px;
                        border-radius: 0;
                        border: none;
                    }

                    .comment-user-name {
                        margin-left: 10px;
                        flex: 1;
                        overflow: hidden;
                        text-overflow: ellipsis;
                        white-space: nowrap;
                    }
                }

                .comment-body {
                    width: 600px;
                    display: flex;
                    flex-direction: column;

                    .comment-stars {
                        width: 100px
                    }

                    .el-rate {
                        color: #f7ba2a;
                    }
                }

                .comment-time {
                    margin: 0px 0px 8px;
                    font-size: 10px;
                    text-transform: uppercase;
                    font-style: normal;
                    color: #8091a2;
                    display: inline-block;
                    opacity: 0.6;
                    width: 200px;
                }

                .comment-conent {
                    width: 300px;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap;
                }

            }
        }

        .game-area-game-desc {
            width: 940px;
            background: #171d25;
            margin-top: 20px;
            padding: 16px;
            padding-bottom: 26px;
            border-radius: 4px;
            font-family: "Motiva Sans", Sans-serif;
            font-weight: normal;
            font-size: 13px;
            color: #c6d4df;

            .game-about-long-desc {
                margin-top: 20px;
                color: #c6d4df;
                max-height: 111px;
                overflow: hidden;
                font-size: 13px;
                line-height: 1.5em;
                padding-right: 16px;
                display: -webkit-box;
                -webkit-line-clamp: 6;
                -webkit-box-orient: vertical;
            }

            .game-about-title {
                font-size: 14px;
                text-transform: uppercase;
                color: #fff;
                padding-bottom: 4px;
                font-family: "Motiva Sans", Sans-serif;
                font-weight: normal;
                background-image: url(https://store.akamai.steamstatic.com/public/images/v6/maincol_gradient_rule.png);
                background-repeat: no-repeat;
                background-position: bottom left;
            }
        }

        .game-area-purchase-game {
            position: relative;
            background: -webkit-linear-gradient(150deg, rgba(226, 244, 255, 0.3) 5%, rgba(84, 107, 115, 0.3) 95%);
            background: linear-gradient(-60deg, rgba(226, 244, 255, 0.3) 5%, rgba(84, 107, 115, 0.3) 95%);
            border-radius: 4px;
            font-family: "Motiva Sans", Sans-serif;
            font-weight: normal;
            font-size: 13px;
            color: #c6d4df;
            padding: 16px;
            padding-bottom: 26px;
            margin-bottom: 28px;

            .game-buy-title {
                font-size: 21px;
                font-family: "Motiva Sans", Sans-serif;
                font-weight: normal;
                color: #ffffff;
                font-weight: normal;
            }

            .game-purchase-action {
                position: absolute;
                bottom: -16px;
                padding: 2px;
                right: 16px;
                display: flex;
                align-items: center;
                justify-content: flex-end;
                flex-direction: column;
                width: 200px;
                height: 100px;

                .game-purchase-action-bg {
                    height: 36px;
                    background-size: 100% 100%;
                    background-color: #000000;
                    padding: 2px 2px 2px 0px;
                    border-radius: 2px;
                    cursor: pointer;
                    transition: all 0.5s;
                    display: flex;
                    justify-content: space-between;

                    .game-purchase-price {
                        padding: 8px 12px 0xp 12px;
                        height: 100%;
                        width: 80px;
                        font-size: 13px;
                        cursor: pointer;
                        display: flex;
                        transition: all 0.5s;
                        justify-content: center;
                        align-items: center;
                    }

                    .game-add-to-cart {
                        padding: 0 15px;
                        font-size: 15px;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        height: 30px;
                        line-height: 30px;
                        cursor: pointer;
                        border-radius: 2px;
                        display: block;
                        color: #d2efa9;
                        background: #6fa720;
                        background: -webkit-linear-gradient(top, #6fa720 5%, #588a1b 95%);
                        background: linear-gradient(to bottom, #6fa720 5%, #588a1b 95%);
                        background: linear-gradient(to right, #75b022 5%, #588a1b 95%);
                    }

                    .game-add-to-cart:hover {
                        background: linear-gradient(to right, #588a1b 5%, #75b022 95%);
                        transition: all 1s;
                    }
                }
            }
        }
    }

    .game-detail {
        width: 940px;
        height: 400px;
        display: flex;
        justify-content: space-between;
        align-items: center;

        .game-images {
            width: 600px;
            height: 400px;

            .el-carousel__item {
                height: 400px;
                text-align: center;
                color: #fff;
                overflow: hidden;
            }
        }

        .game-info {
            width: 324px;
            height: 400px;

            .game-label-value {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
                color: #c6d4df;
                font-size: 13px;
                line-height: 18px;
                padding-right: 16px;

                .game-label {
                    font-size: 10px;
                    color: #556772;
                    width: 80px;
                }

                .game-value {
                    width: 200px;
                    color: #8f98a0;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap;
                }
            }

            .game-logo {
                width: 324px;
                height: 151px;
                background: #171d25;
            }

            .game-short-desc {
                margin-top: 20px;
                color: #c6d4df;
                max-height: 111px;
                overflow: hidden;
                font-size: 13px;
                line-height: 18px;
                padding-right: 16px;
                display: -webkit-box;
                -webkit-line-clamp: 6;
                -webkit-box-orient: vertical;
            }
        }
    }
}
</style>