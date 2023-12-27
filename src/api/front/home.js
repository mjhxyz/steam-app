import request from '@/utils/request'

export function getPosterGameList() {
    return request({
        url: '/game/poster_list',
    })
}
