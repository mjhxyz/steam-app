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
