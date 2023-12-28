import request from '@/utils/request'
export function deleteGame(data) {
    return request({
        url: '/admin/delete_game',
        method: 'post',
        data
    })
}

export function getGameList() {
    return request({
        url: '/admin/game_list',
    })
}

export function addGame(data) {
    return request({
        url: '/admin/add_game',
        method: 'post',
        data
    })
}

export function updateGame(data) {
    return request({
        url: '/admin/update_game',
        method: 'post',
        data
    })
}