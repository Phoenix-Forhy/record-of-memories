package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Recollections;
import com.ruoyi.system.domain.vo.RecollectionsVO;

/**
 * 回忆录Mapper接口
 * 
 * @author 栖凰
 * @date 2024-03-26
 */
public interface RecollectionsMapper 
{
    /**
     * 查询回忆录
     * 
     * @param recollectionId 回忆录主键
     * @return 回忆录
     */
    public Recollections selectRecollectionsByRecollectionId(Long recollectionId);

    /**
     * 查询回忆录列表
     * 
     * @param recollections 回忆录
     * @return 回忆录集合
     */
    public List<RecollectionsVO> selectRecollectionsList(Recollections recollections);

    /**
     * 新增回忆录
     * 
     * @param recollections 回忆录
     * @return 结果
     */
    public int insertRecollections(Recollections recollections);

    /**
     * 修改回忆录
     * 
     * @param recollections 回忆录
     * @return 结果
     */
    public int updateRecollections(Recollections recollections);

    /**
     * 删除回忆录
     * 
     * @param recollectionId 回忆录主键
     * @return 结果
     */
    public int deleteRecollectionsByRecollectionId(Long recollectionId);

    /**
     * 批量删除回忆录
     * 
     * @param recollectionIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRecollectionsByRecollectionIds(Long[] recollectionIds);
}
