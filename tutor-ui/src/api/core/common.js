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

// 新增用户点赞关联
export function addCollect(data) {
  return request({
    url: '/core/collect',
    method: 'post',
    data: data
  })
}

// 删除用户点赞关联
export function delCollect(data) {
  return request({
    url: '/core/collect/',
    method: 'delete',
    data: data
  })
}

// 查询用户点赞关联详细
export function getCollectNum(userId) {
  return request({
    url: '/core/collect/' + userId,
    method: 'get'
  })
}


// 在线认证
export function onlineAuth(data) {
  return request({
    url: '/onlineAuth',
    method: 'post',
    data: data
  })
}

// 查询用户点赞列表
export function getLikeList() {
  return request({
    url: '/core/like/list',
    method: 'get'
  })
}

// 查询用户粉丝列表
export function getFansList() {
  return request({
    url: '/core/like/fans',
    method: 'get'
  })
}

// 查询用户点赞列表
export function getCollectList() {
  return request({
    url: '/core/collect/list',
    method: 'get'
  })
}

