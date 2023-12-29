import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import * as echarts from "echarts";
import App from './App.vue'
import router from './router'
import store from './store'
import less from 'less'

import { ElMessage } from 'element-plus'

const app = createApp(App)
app.use(store).use(router).use(ElementPlus).use(less).mount('#app')

app.config.globalProperties.$echarts = echarts
app.config.globalProperties.$successMsg = function (msg) {
    ElMessage({
        message: msg,
        type: 'success',
        duration: 5 * 1000
    })
}

app.config.globalProperties.$errorMsg = function (msg) {
    ElMessage({
        message: msg,
        type: 'error',
        duration: 5 * 1000
    })
}

