import request from '@/utils/request'

export function addCart(user_id, game_id) {
    return request({
        url: '/cart/add',
        method: 'post',
        data: { user_id, game_id }
    })
}

export function deleteCart(id) {
    return request({
        url: '/cart/delete',
        method: 'post',
        data: { id }
    })
}

export function getCartList(user_id) {
    return request({
        url: '/cart/list',
        method: 'post',
        data: { user_id }
    })
}

export function buyCart(user_id) {
    return request({
        url: '/cart/buy',
        method: 'post',
        data: { user_id }
    })
}
