import request from '@/utils/request'

// 查询回忆列表
export function listMemory(query) {
  return request({
    url: '/system/memory/list',
    method: 'get',
    params: query
  })
}

// 查询回忆详细
export function getMemory(memoryId) {
  return request({
    url: '/system/memory/' + memoryId,
    method: 'get'
  })
}

// 新增回忆
export function addMemory(data) {
  return request({
    url: '/system/memory',
    method: 'post',
    data: data
  })
}

// 修改回忆
export function updateMemory(data) {
  return request({
    url: '/system/memory',
    method: 'put',
    data: data
  })
}

// 删除回忆
export function delMemory(memoryId) {
  return request({
    url: '/system/memory/' + memoryId,
    method: 'delete'
  })
}
