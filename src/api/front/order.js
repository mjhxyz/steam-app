import request from '@/utils/request'

export function addOrder(data) {
    return request({
        url: '/order/add',
        method: 'post',
        data
    })
}

export function getOrderList(user_id) {
    return request({
        url: '/order/list',
        method: 'post',
        data: { user_id }
    })
}

export function deleteOrder(id) {
    return request({
        url: '/order/delete',
        method: 'post',
        data: { id }
    })
}

export function finishOrder(id) {
    return request({
        url: '/order/finish',
        method: 'post',
        data: { id }
    })
}