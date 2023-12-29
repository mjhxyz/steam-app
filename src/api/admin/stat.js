import request from '@/utils/request'

export function getTodayStatList() {
    return request({
        url: '/admin/stat',
    })
}

export function getTotalStatList() {
    return request({
        url: '/admin/total_stat',
    })
}

export function getStatByDay() {
    return request({
        url: '/admin/stat_by_day',
    })
}
