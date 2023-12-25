<template>
    <div class="container-footer">
        <div class="footer-content">
            <div class="rule"></div>
            <div class="footer-content-center">
                <p class='footer-text'>©2023 Valve Corporation。保留所有权利。所有商标均为其在青青草原及其它国家/地区的各自持有者所有。</p>
                <p class='footer-text'>所有的价格均已包含增值税（如适用）。 隐私政策 | 法律信息 | Steam 订户协议 | 退款 | Cookie </p>
            </div>
            <div class="rule"></div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'PageFooter',
    data() {
        return {
        }
    },
    methods: {
    }
}

</script>

<style lang="less" scoped>
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

        .footer-content-center {
            display: flex;
            flex-direction: column;

            .footer-text {
                float: left;
                margin-left: 12px;
                color: #8F98A0;
                font-size: 12px;
                line-height: 16px;
            }
        }
    }
}
</style>