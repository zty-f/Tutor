import request from '@/utils/request'

// 查询用户押金信息列表
export function listDeposit(query) {
  return request({
    url: '/system/deposit/list',
    method: 'get',
    params: query
  })
}

// 查询用户押金信息详细
export function getDeposit(id) {
  return request({
    url: '/system/deposit/' + id,
    method: 'get'
  })
}

// 新增用户押金信息
export function addDeposit(data) {
  return request({
    url: '/system/deposit',
    method: 'post',
    data: data
  })
}

// 修改用户押金信息
export function updateDeposit(data) {
  return request({
    url: '/system/deposit',
    method: 'put',
    data: data
  })
}

// 删除用户押金信息
export function delDeposit(id) {
  return request({
    url: '/system/deposit/' + id,
    method: 'delete'
  })
}

// 查询用户押金操作信息列表
export function listDetail(query) {
  return request({
    url: '/system/detail/list',
    method: 'get',
    params: query
  })
}

// 查询用户押金操作信息详细
export function getDetail(id) {
  return request({
    url: '/system/detail/' + id,
    method: 'get'
  })
}

// 新增用户押金操作信息
export function addDetail(data) {
  return request({
    url: '/system/detail',
    method: 'post',
    data: data
  })
}

// 修改用户押金操作信息
export function updateDetail(data) {
  return request({
    url: '/system/detail',
    method: 'put',
    data: data
  })
}

// 删除用户押金操作信息
export function delDetail(id) {
  return request({
    url: '/system/detail/' + id,
    method: 'delete'
  })
}

// 查询用户下单信息列表
export function listOrder(query) {
  return request({
    url: '/system/order/list',
    method: 'get',
    params: query
  })
}

// 查询用户下单信息详细
export function getOrder(id) {
  return request({
    url: '/system/order/' + id,
    method: 'get'
  })
}

// 新增用户下单信息
export function addOrder(data) {
  return request({
    url: '/system/order',
    method: 'post',
    data: data
  })
}

// 修改用户下单信息
export function updateOrder(data) {
  return request({
    url: '/system/order',
    method: 'put',
    data: data
  })
}

// 删除用户下单信息
export function delOrder(id) {
  return request({
    url: '/system/order/' + id,
    method: 'delete'
  })
}
