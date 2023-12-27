import request from '@/utils/request'

export function login(data) {
    return request({
        url: '/admin/login',
        method: 'post',
        data
    })
}

export function deleteUser(data) {
    return request({
        url: '/admin/delete_user',
        method: 'post',
        data
    })
}

export function getUserList() {
    return request({
        url: '/admin/user_list',
    })
}

export function getInfo(token) {
    return request({
        url: '/admin/info',
        method: 'get',
        params: { token }
    })
}

export function logout() {
    return request({
        url: '/admin/logout',
        method: 'post'
    })
}
