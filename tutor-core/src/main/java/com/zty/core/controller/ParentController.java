package com.zty.core.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.zty.common.annotation.Log;
import com.zty.common.core.controller.BaseController;
import com.zty.common.core.domain.AjaxResult;
import com.zty.common.enums.BusinessType;
import com.zty.core.domain.Parent;
import com.zty.core.service.IParentService;
import com.zty.common.utils.poi.ExcelUtil;
import com.zty.common.core.page.TableDataInfo;

/**
 * 学员信息Controller
 * 
 * @author zty
 * @date 2022-12-25
 */
@RestController
@RequestMapping("/core/parent")
public class ParentController extends BaseController
{
    @Autowired
    private IParentService parentService;

    /**
     * 查询学员信息列表
     */
    @PreAuthorize("@ss.hasPermi('core:parent:list')")
    @GetMapping("/list")
    public TableDataInfo list(Parent parent)
    {
        startPage();
        List<Parent> list = parentService.selectParentList(parent);
        return getDataTable(list);
    }

    /**
     * 导出学员信息列表
     */
    @PreAuthorize("@ss.hasPermi('core:parent:export')")
    @Log(title = "学员信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Parent parent)
    {
        List<Parent> list = parentService.selectParentList(parent);
        ExcelUtil<Parent> util = new ExcelUtil<Parent>(Parent.class);
        util.exportExcel(response, list, "学员信息数据");
    }

    /**
     * 获取学员信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('core:parent:query')")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") Long userId)
    {
        return success(parentService.selectParentByUserId(userId));
    }

    /**
     * 新增学员信息
     */
    @PreAuthorize("@ss.hasPermi('core:parent:add')")
    @Log(title = "学员信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Parent parent)
    {
        return toAjax(parentService.insertParent(parent));
    }

    /**
     * 修改学员信息
     */
    @PreAuthorize("@ss.hasPermi('core:parent:edit')")
    @Log(title = "学员信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Parent parent)
    {
        return toAjax(parentService.updateParent(parent));
    }

    /**
     * 删除学员信息
     */
    @PreAuthorize("@ss.hasPermi('core:parent:remove')")
    @Log(title = "学员信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(parentService.deleteParentByUserIds(userIds));
    }
}
