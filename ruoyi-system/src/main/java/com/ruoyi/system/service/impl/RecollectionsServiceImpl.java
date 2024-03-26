package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.vo.RecollectionsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.RecollectionsMapper;
import com.ruoyi.system.domain.Recollections;
import com.ruoyi.system.service.IRecollectionsService;

/**
 * 回忆录Service业务层处理
 * 
 * @author 栖凰
 * @date 2024-03-26
 */
@Service
public class RecollectionsServiceImpl implements IRecollectionsService 
{
    @Autowired
    private RecollectionsMapper recollectionsMapper;

    /**
     * 查询回忆录
     * 
     * @param recollectionId 回忆录主键
     * @return 回忆录
     */
    @Override
    public Recollections selectRecollectionsByRecollectionId(Long recollectionId)
    {
        return recollectionsMapper.selectRecollectionsByRecollectionId(recollectionId);
    }

    /**
     * 查询回忆录列表
     * 
     * @param recollections 回忆录
     * @return 回忆录
     */
    @Override
    public List<RecollectionsVO> selectRecollectionsList(Recollections recollections)
    {
        return recollectionsMapper.selectRecollectionsList(recollections);
    }

    /**
     * 新增回忆录
     * 
     * @param recollections 回忆录
     * @return 结果
     */
    @Override
    public int insertRecollections(Recollections recollections)
    {
        recollections.setCreateTime(DateUtils.getNowDate());
        return recollectionsMapper.insertRecollections(recollections);
    }

    /**
     * 修改回忆录
     * 
     * @param recollections 回忆录
     * @return 结果
     */
    @Override
    public int updateRecollections(Recollections recollections)
    {
        recollections.setUpdateTime(DateUtils.getNowDate());
        return recollectionsMapper.updateRecollections(recollections);
    }

    /**
     * 批量删除回忆录
     * 
     * @param recollectionIds 需要删除的回忆录主键
     * @return 结果
     */
    @Override
    public int deleteRecollectionsByRecollectionIds(Long[] recollectionIds)
    {
        return recollectionsMapper.deleteRecollectionsByRecollectionIds(recollectionIds);
    }

    /**
     * 删除回忆录信息
     * 
     * @param recollectionId 回忆录主键
     * @return 结果
     */
    @Override
    public int deleteRecollectionsByRecollectionId(Long recollectionId)
    {
        return recollectionsMapper.deleteRecollectionsByRecollectionId(recollectionId);
    }
}
