import request from '@/utils/request'

export function getMyGameList(user_id) {
    return request({
        url: '/my_game/list',
        method: 'post',
        data: { user_id }
    })
}