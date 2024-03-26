package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Memory;
import com.ruoyi.system.domain.vo.MemoryVO;

/**
 * 回忆Mapper接口
 * 
 * @author 栖凰
 * @date 2024-03-26
 */
public interface MemoryMapper 
{
    /**
     * 查询回忆
     * 
     * @param memoryId 回忆主键
     * @return 回忆
     */
    public Memory selectMemoryByMemoryId(Long memoryId);

    /**
     * 查询回忆列表
     * 
     * @param memory 回忆
     * @return 回忆集合
     */
    public List<MemoryVO> selectMemoryList(Memory memory);

    /**
     * 新增回忆
     * 
     * @param memory 回忆
     * @return 结果
     */
    public int insertMemory(Memory memory);

    /**
     * 修改回忆
     * 
     * @param memory 回忆
     * @return 结果
     */
    public int updateMemory(Memory memory);

    /**
     * 删除回忆
     * 
     * @param memoryId 回忆主键
     * @return 结果
     */
    public int deleteMemoryByMemoryId(Long memoryId);

    /**
     * 批量删除回忆
     * 
     * @param memoryIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMemoryByMemoryIds(Long[] memoryIds);
}
