import { createRouter, createWebHashHistory } from 'vue-router'
import HelloWorld from '@/components/HelloWorld.vue'
import LoginPage from '@/views/front/LoginPage'


const routes = [
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
    }
]

const router = createRouter({
    history: createWebHashHistory(),
    routes
})

export default router
