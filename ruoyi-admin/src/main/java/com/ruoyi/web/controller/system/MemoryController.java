package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.vo.MemoryVO;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Memory;
import com.ruoyi.system.service.IMemoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 回忆Controller
 * 
 * @author 栖凰
 * @date 2024-03-26
 */
@RestController
@RequestMapping("/system/memory")
public class MemoryController extends BaseController
{
    @Autowired
    private IMemoryService memoryService;

    /**
     * 查询回忆列表
     */
    @PreAuthorize("@ss.hasPermi('system:memory:list')")
    @GetMapping("/list")
    public TableDataInfo list(Memory memory)
    {
        startPage();
        List<MemoryVO> list = memoryService.selectMemoryList(memory);
        return getDataTable(list);
    }

    /**
     * 导出回忆列表
     */
    @PreAuthorize("@ss.hasPermi('system:memory:export')")
    @Log(title = "回忆", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Memory memory)
    {
        List<MemoryVO> list = memoryService.selectMemoryList(memory);
        ExcelUtil<MemoryVO> util = new ExcelUtil<MemoryVO>(MemoryVO.class);
        util.exportExcel(response, list, "回忆数据");
    }

    /**
     * 获取回忆详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:memory:query')")
    @GetMapping(value = "/{memoryId}")
    public AjaxResult getInfo(@PathVariable("memoryId") Long memoryId)
    {
        return success(memoryService.selectMemoryByMemoryId(memoryId));
    }

    /**
     * 新增回忆
     */
    @PreAuthorize("@ss.hasPermi('system:memory:add')")
    @Log(title = "回忆", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Memory memory)
    {
        return toAjax(memoryService.insertMemory(memory));
    }

    /**
     * 修改回忆
     */
    @PreAuthorize("@ss.hasPermi('system:memory:edit')")
    @Log(title = "回忆", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Memory memory)
    {
        return toAjax(memoryService.updateMemory(memory));
    }

    /**
     * 删除回忆
     */
    @PreAuthorize("@ss.hasPermi('system:memory:remove')")
    @Log(title = "回忆", businessType = BusinessType.DELETE)
	@DeleteMapping("/{memoryIds}")
    public AjaxResult remove(@PathVariable Long[] memoryIds)
    {
        return toAjax(memoryService.deleteMemoryByMemoryIds(memoryIds));
    }
}
