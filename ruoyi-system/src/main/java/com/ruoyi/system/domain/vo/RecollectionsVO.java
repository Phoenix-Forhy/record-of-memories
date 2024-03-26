package com.ruoyi.system.domain.vo;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 回忆录显示对象 recollectionsVO
 * 
 * @author 栖凰
 * @date 2024-03-26
 */
public class RecollectionsVO extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 回忆录id */
    @Excel(name = "回忆录id")
    private Long recollectionId;

    /** 回忆录名称 */
    @Excel(name = "回忆录名称")
    private String recollectionName;

    /** 创建人名称 */
    @Excel(name = "创建人名称")
    private String createByName;

    public String getCreateByName() {
        return createByName;
    }

    public void setCreateByName(String createByName) {
        this.createByName = createByName;
    }

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
            .append("createByName",getCreateByName())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
