import axios from 'axios'
import { ElMessage } from 'element-plus'
// import store from '@/store'
// import { getToken } from '@/utils/auth'

// 创建axios实例
const service = axios.create({
    baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
    // withCredentials: true, // 跨域请求时发送cookies
    timeout: 5000 // 超时时间
})

// 请求拦截器
service.interceptors.request.use(
    config => {
        // 发送之前
        // if (store.getters.token) {
        //     config.headers['S-Token'] = getToken()
        // }
        return config
    },
    error => {
        console.log(error) // 调试用
        return Promise.reject(error)
    }
)

// 响应拦截器
service.interceptors.response.use(
    response => {
        const res = response.data
        if (res.code !== 2000) {
            ElMessage({
                message: res.msg || '出错了',
                type: 'error',
                duration: 5 * 1000
            })

            // 50008: Illegal token; 50012: Other clients logged in; 50014: Token expired;
            // if (res.code === 50008 || res.code === 50012 || res.code === 50014) {
            //     // to re-login
            //     MessageBox.confirm('You have been logged out, you can cancel to stay on this page, or log in again', 'Confirm logout', {
            //         confirmButtonText: 'Re-Login',
            //         cancelButtonText: 'Cancel',
            //         type: 'warning'
            //     }).then(() => {
            //         store.dispatch('user/resetToken').then(() => {
            //             location.reload()
            //         })
            //     })
            // }
            return Promise.reject(new Error(res.msg || '出错了'))
        } else {
            // ElMessage({
            //     message: res.msg,
            //     type: 'error',
            //     duration: 5 * 1000
            // })
            return res
        }
    },
    error => {
        console.log('err' + error) // for debug
        ElMessage({
            message: '出错了',
            type: 'error',
            duration: 5 * 1000
        })
        return Promise.reject(error)
    }
)

export default service