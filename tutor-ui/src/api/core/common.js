import request from '@/utils/request'

// 新增用户点赞关联
export function addLike(data) {
  return request({
    url: '/core/like',
    method: 'post',
    data: data
  })
}

// 删除用户点赞关联
export function delLike(data) {
  return request({
    url: '/core/like/',
    method: 'delete',
    data: data
  })
}

// 查询用户点赞关联详细
export function getLikeNum(userId) {
  return request({
    url: '/core/like/' + userId,
    method: 'get'
  })
}
