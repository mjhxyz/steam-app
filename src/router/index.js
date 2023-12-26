import { createRouter, createWebHashHistory } from 'vue-router'
import HelloWorld from '@/components/HelloWorld.vue'
import LoginPage from '@/views/front/LoginPage'
import RegisterPage from '@/views/front/RegisterPage'
import HomePage from '@/views/front/HomePage'
import SearchPage from '@/views/front/SearchPage'
import GameDetail from '@/views/front/GameDetail'
import LayOut from '@/components/front/LayOut'


const routes = [
    // 前端路由
    {
        path: '/',
        redirect: '/hello'
    },
    {
        path: '/hello',
        name: 'hello',
        component: HelloWorld
    },
    {
        path: '/hello',
        name: 'hello',
        component: HelloWorld
    },
    {
        path: '/login',
        name: 'hello',
        component: LoginPage
    },
    {
        path: '/register',
        name: 'register',
        component: RegisterPage
    },
    {
        path: '/home',
        name: 'home',
        component: HomePage
    },
    {
        path: '/bar',
        component: LayOut,
        children: [
            {
                path: '/search',
                name: 'search',
                component: SearchPage
            },
            {
                path: '/detail',
                name: 'detail',
                component: GameDetail
            },
        ]
    },

    // 后端路由
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router
