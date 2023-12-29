import { createRouter, createWebHashHistory } from 'vue-router'
import HelloWorld from '@/components/HelloWorld.vue'
import LoginPage from '@/views/front/LoginPage'
import RegisterPage from '@/views/front/RegisterPage'
import HomePage from '@/views/front/HomePage'
import SearchPage from '@/views/front/SearchPage'
import GameDetail from '@/views/front/GameDetail'
import LayOut from '@/components/front/LayOut'
import ShoppingCart from '@/views/front/ShoppingCart'
import MyGame from '@/views/front/MyGame'
import OrderPage from '@/views/front/OrderPage'

import AdminLogin from '@/views/admin/AdminLogin'
import AdminHome from '@/views/admin/AdminHome'
import AdminUser from '@/views/admin/AdminUser'
import AdminGame from '@/views/admin/AdminGame'
import AdminComment from '@/views/admin/AdminComment'
import AdminMain from '@/views/admin/AdminMain'
// import AdminLayOut from '@/views/admin/AdminLayOut'

const routes = [
    // 前端路由
    {
        path: '/',
        redirect: '/home'
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
            {
                path: '/cart',
                name: 'cart',
                component: ShoppingCart
            },
            {
                path: '/mygame',
                name: 'mygame',
                component: MyGame
            },
            {
                path: '/order',
                name: 'order',
                component: OrderPage
            }
        ]
    },

    // 后端路由
    {
        path: '/admin/login',
        name: 'adminLogin',
        component: AdminLogin
    },
    {
        path: '/admin/home',
        name: 'adminHome',
        redirect: '/admin/user',
        component: AdminHome,
        children: [
            {
                path: '/admin/main',
                name: 'adminMain',
                component: AdminMain,
                meta: { title: '首页' }
            },
            {
                path: '/admin/user',
                name: 'adminUser',
                component: AdminUser,
                meta: { title: '用户列表' }
            },
            {
                path: '/admin/game',
                name: 'adminGame',
                component: AdminGame,
                meta: { title: '游戏列表' }
            },
            {
                path: '/admin/comment',
                name: 'adminComment',
                component: AdminComment,
                meta: { title: '评论列表' }
            }
        ]
    }
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router
