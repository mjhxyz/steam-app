<template>
    <div id="container">
        <div class="nav-wrapper">
            <LoginNav />
        </div>
        <div style="margin-top: 10px;">
            <ToolBar />
        </div>
        <div class="container-center">
            <router-view />
        </div>
        <PageFooter />
    </div>
</template>

<script>
import LoginNav from '@/components/LoginNav.vue'
import ToolBar from '@/components/ToolBar.vue'
import PageFooter from './PageFooter.vue'

export default {
    name: 'LayOut',
    components: {
        LoginNav,
        ToolBar,
        PageFooter
    },
    data() {
        return {
        }
    },
    methods: {
    }
}
</script>

<style lang="less" scoped>
#container {
    width: 100%;
    min-height: 100%;
    background: #1b2838;

    .container-center {
        width: 940px;
        margin: 0 auto;
        min-height: 300px;
    }

    .nav-wrapper {
        width: 100%;
        height: 104px;
        background: #171d25;
    }
}
</style>
