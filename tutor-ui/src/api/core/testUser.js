import request from '@/utils/request'

// 查询测试用户信息列表
export function listTestUser(query) {
  return request({
    url: '/core/testUser/list',
    method: 'get',
    params: query
  })
}

// 查询测试用户信息详细
export function getTestUser(userId) {
  return request({
    url: '/core/testUser/' + userId,
    method: 'get'
  })
}

// 新增测试用户信息
export function addTestUser(data) {
  return request({
    url: '/core/testUser',
    method: 'post',
    data: data
  })
}

// 修改测试用户信息
export function updateTestUser(data) {
  return request({
    url: '/core/testUser',
    method: 'put',
    data: data
  })
}

// 删除测试用户信息
export function delTestUser(userId) {
  return request({
    url: '/core/testUser/' + userId,
    method: 'delete'
  })
}
