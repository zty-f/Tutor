import request from '@/utils/request'

// 查询管理员信息列表
export function listManager(query) {
  return request({
    url: '/core/manager/list',
    method: 'get',
    params: query
  })
}

// 查询管理员信息详细
export function getManager(userId) {
  return request({
    url: '/core/manager/' + userId,
    method: 'get'
  })
}

// 新增管理员信息
export function addManager(data) {
  return request({
    url: '/core/manager',
    method: 'post',
    data: data
  })
}

// 修改管理员信息
export function updateManager(data) {
  return request({
    url: '/core/manager',
    method: 'put',
    data: data
  })
}

// 删除管理员信息
export function delManager(userId) {
  return request({
    url: '/core/manager/' + userId,
    method: 'delete'
  })
}
