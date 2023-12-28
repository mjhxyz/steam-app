import request from '@/utils/request'
export function deleteComment(data) {
    return request({
        url: '/admin/delete_comment',
        method: 'post',
        data
    })
}

export function getCommentList() {
    return request({
        url: '/admin/list_comment',
    })
}

export function getCommentListByGameId(data) {
    return request({
        url: '/admin/list_comment_by_game_id',
        method: 'post',
        data
    })
}

export function addComment(data) {
    return request({
        url: '/admin/add_comment',
        method: 'post',
        data
    })
}
