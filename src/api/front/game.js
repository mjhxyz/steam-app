import request from '@/utils/request'

export function searchGame(key) {
    return request({
        url: '/game/search',
        method: 'post',
        data: { name: key }
    })
}

export function getGameDetail(id) {
    return request({
        url: '/game/detail',
        method: 'post',
        data: { id }
    })
}