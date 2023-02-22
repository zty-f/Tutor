package com.zty.core.controller.manager;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.zty.common.core.domain.entity.SysUser;
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
import com.zty.system.service.ISysUserService;
import com.zty.common.utils.poi.ExcelUtil;
import com.zty.common.core.page.TableDataInfo;

/**
 * 管理员信息Controller
 * 
 * @author zty
 * @date 2023-02-22
 */
@RestController
@RequestMapping("/core/manager")
public class SysManagerController extends BaseController
{
    @Autowired
    private ISysUserService sysUserService;

    /**
     * 查询管理员信息列表
     */
    @PreAuthorize("@ss.hasPermi('core:manager:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysUser sysUser)
    {
        startPage();
        List<SysUser> list = sysUserService.selectSysUserList(sysUser);
        return getDataTable(list);
    }

    /**
     * 导出管理员信息列表
     */
    @PreAuthorize("@ss.hasPermi('core:manager:export')")
    @Log(title = "管理员信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysUser sysUser)
    {
        List<SysUser> list = sysUserService.selectSysUserList(sysUser);
        ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
        util.exportExcel(response, list, "管理员信息数据");
    }

    /**
     * 获取管理员信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('core:manager:query')")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") Long userId)
    {
        return success(sysUserService.selectSysUserByUserId(userId));
    }

    /**
     * 新增管理员信息
     */
    @PreAuthorize("@ss.hasPermi('core:manager:add')")
    @Log(title = "管理员信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUser sysUser)
    {
        return toAjax(sysUserService.insertSysUser(sysUser));
    }

    /**
     * 修改管理员信息
     */
    @PreAuthorize("@ss.hasPermi('core:manager:edit')")
    @Log(title = "管理员信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysUser sysUser)
    {
        return toAjax(sysUserService.updateSysUser(sysUser));
    }

    /**
     * 删除管理员信息
     */
    @PreAuthorize("@ss.hasPermi('core:manager:remove')")
    @Log(title = "管理员信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(sysUserService.deleteSysUserByUserIds(userIds));
    }
}
