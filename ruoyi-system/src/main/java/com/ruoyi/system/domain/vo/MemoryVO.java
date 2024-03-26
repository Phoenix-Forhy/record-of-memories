package com.ruoyi.system.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.time.LocalTime;

/**
 * 回忆视图对象 memoryVO
 * 
 * @author 栖凰
 * @date 2024-03-26
 */
public class MemoryVO extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 回忆id */
    @Excel(name = "回忆id")
    private Long memoryId;

    /** 回忆名 */
    @Excel(name = "回忆名")
    private String memoryName;

    /** 回忆图片 */
    @Excel(name = "回忆图片")
    private String memoryImg;

    /** 持续时间 */
    @JsonFormat(pattern = "HH:mm:ss")
    @Excel(name = "持续时间", width = 30, dateFormat = "HH:mm:ss")
    private LocalTime memoryTime;

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

    public String getRecollectionName() {
        return recollectionName;
    }

    public void setRecollectionName(String recollectionName) {
        this.recollectionName = recollectionName;
    }



    public void setMemoryId(Long memoryId) 
    {
        this.memoryId = memoryId;
    }

    public Long getMemoryId() 
    {
        return memoryId;
    }
    public void setMemoryName(String memoryName) 
    {
        this.memoryName = memoryName;
    }

    public String getMemoryName() 
    {
        return memoryName;
    }
    public void setMemoryImg(String memoryImg) 
    {
        this.memoryImg = memoryImg;
    }

    public String getMemoryImg() 
    {
        return memoryImg;
    }
    public void setMemoryTime(LocalTime memoryTime)
    {
        this.memoryTime = memoryTime;
    }

    public LocalTime getMemoryTime()
    {
        return memoryTime;
    }
    public void setRecollectionId(Long recollectionId) 
    {
        this.recollectionId = recollectionId;
    }

    public Long getRecollectionId() 
    {
        return recollectionId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("memoryId", getMemoryId())
            .append("memoryName", getMemoryName())
            .append("memoryImg", getMemoryImg())
            .append("memoryTime", getMemoryTime())
            .append("recollectionId", getRecollectionId())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
