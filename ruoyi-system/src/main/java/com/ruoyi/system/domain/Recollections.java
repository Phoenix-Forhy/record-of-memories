package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 回忆录对象 recollections
 * 
 * @author 栖凰
 * @date 2024-03-26
 */
public class Recollections extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 回忆录id */
    @Excel(name = "回忆录id")
    private Long recollectionId;

    /** 回忆录名称 */
    @Excel(name = "回忆录名称")
    private String recollectionName;

    public void setRecollectionId(Long recollectionId) 
    {
        this.recollectionId = recollectionId;
    }

    public Long getRecollectionId() 
    {
        return recollectionId;
    }
    public void setRecollectionName(String recollectionName) 
    {
        this.recollectionName = recollectionName;
    }

    public String getRecollectionName() 
    {
        return recollectionName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recollectionId", getRecollectionId())
            .append("recollectionName", getRecollectionName())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
