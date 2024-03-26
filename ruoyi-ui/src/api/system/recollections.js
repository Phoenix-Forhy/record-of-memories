import request from '@/utils/request'

// 查询回忆录列表
export function listRecollections(query) {
  return request({
    url: '/system/recollections/list',
    method: 'get',
    params: query
  })
}

// 查询回忆录详细
export function getRecollections(recollectionId) {
  return request({
    url: '/system/recollections/' + recollectionId,
    method: 'get'
  })
}

// 新增回忆录
export function addRecollections(data) {
  return request({
    url: '/system/recollections',
    method: 'post',
    data: data
  })
}

// 修改回忆录
export function updateRecollections(data) {
  return request({
    url: '/system/recollections',
    method: 'put',
    data: data
  })
}

// 删除回忆录
export function delRecollections(recollectionId) {
  return request({
    url: '/system/recollections/' + recollectionId,
    method: 'delete'
  })
}
