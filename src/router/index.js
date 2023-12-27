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

import AdminLogin from '@/views/admin/AdminLogin'
import AdminHome from '@/views/admin/AdminHome'
import AdminUser from '@/views/admin/AdminUser'
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
            }
        ]
    },

    // 后端路由
    {
        path: '/admin/login',
        name: 'adminlogin',
        component: AdminLogin
    },
    {
        path: '/admin',
        name: 'adminlogin',
        redirect: '/admin/user',
        component: AdminHome,
        children: [
            {
                path: '/admin/user',
                name: 'adminuser',
                component: AdminUser
            }
        ]
    }
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router
