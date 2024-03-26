package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.vo.RecollectionsVO;
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
import com.ruoyi.system.domain.Recollections;
import com.ruoyi.system.service.IRecollectionsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 回忆录Controller
 * 
 * @author 栖凰
 * @date 2024-03-26
 */
@RestController
@RequestMapping("/system/recollections")
public class RecollectionsController extends BaseController
{
    @Autowired
    private IRecollectionsService recollectionsService;

    /**
     * 查询回忆录列表
     */
    @PreAuthorize("@ss.hasPermi('system:recollections:list')")
    @GetMapping("/list")
    public TableDataInfo list(Recollections recollections)
    {
        startPage();
        List<RecollectionsVO> list = recollectionsService.selectRecollectionsList(recollections);
        return getDataTable(list);
    }

    /**
     * 导出回忆录列表
     */
    @PreAuthorize("@ss.hasPermi('system:recollections:export')")
    @Log(title = "回忆录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Recollections recollections)
    {
        List<RecollectionsVO> list = recollectionsService.selectRecollectionsList(recollections);
        ExcelUtil<RecollectionsVO> util = new ExcelUtil<RecollectionsVO>(RecollectionsVO.class);
        util.exportExcel(response, list, "回忆录数据");
    }

    /**
     * 获取回忆录详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:recollections:query')")
    @GetMapping(value = "/{recollectionId}")
    public AjaxResult getInfo(@PathVariable("recollectionId") Long recollectionId)
    {
        return success(recollectionsService.selectRecollectionsByRecollectionId(recollectionId));
    }

    /**
     * 新增回忆录
     */
    @PreAuthorize("@ss.hasPermi('system:recollections:add')")
    @Log(title = "回忆录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Recollections recollections)
    {
        return toAjax(recollectionsService.insertRecollections(recollections));
    }

    /**
     * 修改回忆录
     */
    @PreAuthorize("@ss.hasPermi('system:recollections:edit')")
    @Log(title = "回忆录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Recollections recollections)
    {
        return toAjax(recollectionsService.updateRecollections(recollections));
    }

    /**
     * 删除回忆录
     */
    @PreAuthorize("@ss.hasPermi('system:recollections:remove')")
    @Log(title = "回忆录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{recollectionIds}")
    public AjaxResult remove(@PathVariable Long[] recollectionIds)
    {
        return toAjax(recollectionsService.deleteRecollectionsByRecollectionIds(recollectionIds));
    }
}
