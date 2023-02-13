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


// 查询用户留言信息列表
export function sendListLeave(query) {
  return request({
    url: '/core/leave/sendList',
    method: 'get',
    params: query
  })
}

// 查询用户留言信息列表
export function receivedListLeave(query) {
  return request({
    url: '/core/leave/receivedList',
    method: 'get',
    params: query
  })
}

// 查询用户留言信息详细
export function getLeave(id) {
  return request({
    url: '/core/leave/' + id,
    method: 'get'
  })
}

// 新增用户留言信息
export function addLeave(data) {
  return request({
    url: '/core/leave',
    method: 'post',
    data: data
  })
}

// 修改用户留言信息
export function updateLeave(data) {
  return request({
    url: '/core/leave',
    method: 'put',
    data: data
  })
}

// 修改用户留言状态信息
export function updateStatus(id) {
  return request({
    url: '/core/leave/'+id,
    method: 'put',
  })
}

// 删除用户留言信息
export function delLeave(id) {
  return request({
    url: '/core/leave/' + id,
    method: 'delete'
  })
}
