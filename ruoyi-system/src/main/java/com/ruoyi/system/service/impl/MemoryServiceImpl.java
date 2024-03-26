package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.vo.MemoryVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MemoryMapper;
import com.ruoyi.system.domain.Memory;
import com.ruoyi.system.service.IMemoryService;

/**
 * 回忆Service业务层处理
 * 
 * @author 栖凰
 * @date 2024-03-26
 */
@Service
public class MemoryServiceImpl implements IMemoryService 
{
    @Autowired
    private MemoryMapper memoryMapper;

    /**
     * 查询回忆
     * 
     * @param memoryId 回忆主键
     * @return 回忆
     */
    @Override
    public Memory selectMemoryByMemoryId(Long memoryId)
    {
        return memoryMapper.selectMemoryByMemoryId(memoryId);
    }

    /**
     * 查询回忆列表
     * 
     * @param memory 回忆
     * @return 回忆
     */
    @Override
    public List<MemoryVO> selectMemoryList(Memory memory)
    {
        return memoryMapper.selectMemoryList(memory);
    }

    /**
     * 新增回忆
     * 
     * @param memory 回忆
     * @return 结果
     */
    @Override
    public int insertMemory(Memory memory)
    {
        memory.setCreateTime(DateUtils.getNowDate());
        return memoryMapper.insertMemory(memory);
    }

    /**
     * 修改回忆
     * 
     * @param memory 回忆
     * @return 结果
     */
    @Override
    public int updateMemory(Memory memory)
    {
        memory.setUpdateTime(DateUtils.getNowDate());
        return memoryMapper.updateMemory(memory);
    }

    /**
     * 批量删除回忆
     * 
     * @param memoryIds 需要删除的回忆主键
     * @return 结果
     */
    @Override
    public int deleteMemoryByMemoryIds(Long[] memoryIds)
    {
        return memoryMapper.deleteMemoryByMemoryIds(memoryIds);
    }

    /**
     * 删除回忆信息
     * 
     * @param memoryId 回忆主键
     * @return 结果
     */
    @Override
    public int deleteMemoryByMemoryId(Long memoryId)
    {
        return memoryMapper.deleteMemoryByMemoryId(memoryId);
    }
}
