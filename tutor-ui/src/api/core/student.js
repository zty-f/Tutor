import request from '@/utils/request'

// 查询学生信息列表
export function listStudent(query) {
  return request({
    url: '/core/student/list',
    method: 'get',
    params: query
  })
}

// 查询学生信息详细
export function getStudent(userId) {
  return request({
    url: '/core/student/' + userId,
    method: 'get'
  })
}

// 新增学生信息
export function addStudent(data) {
  return request({
    url: '/core/student',
    method: 'post',
    data: data
  })
}

// 修改学生信息
export function updateStudent(data) {
  return request({
    url: '/core/student',
    method: 'put',
    data: data
  })
}

// 删除学生信息
export function delStudent(userId) {
  return request({
    url: '/core/student/' + userId,
    method: 'delete'
  })
}
