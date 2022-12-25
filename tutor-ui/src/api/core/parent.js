import request from '@/utils/request'

// 查询家长信息列表
export function listParent(query) {
  return request({
    url: '/core/parent/list',
    method: 'get',
    params: query
  })
}

// 查询家长信息详细
export function getParent(userId) {
  return request({
    url: '/core/parent/' + userId,
    method: 'get'
  })
}

// 新增家长信息
export function addParent(data) {
  return request({
    url: '/core/parent',
    method: 'post',
    data: data
  })
}

// 修改家长信息
export function updateParent(data) {
  return request({
    url: '/core/parent',
    method: 'put',
    data: data
  })
}

// 删除家长信息
export function delParent(userId) {
  return request({
    url: '/core/parent/' + userId,
    method: 'delete'
  })
}
