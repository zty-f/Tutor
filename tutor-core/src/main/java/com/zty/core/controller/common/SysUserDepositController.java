package com.zty.core.controller.common;

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
import com.zty.system.domain.SysUserDeposit;
import com.zty.system.service.ISysUserDepositService;
import com.zty.common.utils.poi.ExcelUtil;
import com.zty.common.core.page.TableDataInfo;

/**
 * 用户押金信息Controller
 * 
 * @author zty
 * @date 2023-02-16
 */
@RestController
@RequestMapping("/system/deposit")
public class SysUserDepositController extends BaseController
{
    @Autowired
    private ISysUserDepositService sysUserDepositService;

    /**
     * 查询用户押金信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:deposit:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysUserDeposit sysUserDeposit)
    {
        startPage();
        List<SysUserDeposit> list = sysUserDepositService.selectSysUserDepositList(sysUserDeposit);
        return getDataTable(list);
    }

    /**
     * 导出用户押金信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:deposit:export')")
    @Log(title = "用户押金信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysUserDeposit sysUserDeposit)
    {
        List<SysUserDeposit> list = sysUserDepositService.selectSysUserDepositList(sysUserDeposit);
        ExcelUtil<SysUserDeposit> util = new ExcelUtil<SysUserDeposit>(SysUserDeposit.class);
        util.exportExcel(response, list, "用户押金信息数据");
    }

    /**
     * 获取用户押金信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:deposit:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysUserDepositService.selectSysUserDepositById(id));
    }

    /**
     * 新增用户押金信息
     */
    @PreAuthorize("@ss.hasPermi('system:deposit:add')")
    @Log(title = "用户押金信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUserDeposit sysUserDeposit)
    {
        return toAjax(sysUserDepositService.insertSysUserDeposit(sysUserDeposit));
    }

    /**
     * 修改用户押金信息
     */
    @PreAuthorize("@ss.hasPermi('system:deposit:edit')")
    @Log(title = "用户押金信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysUserDeposit sysUserDeposit)
    {
        return toAjax(sysUserDepositService.updateSysUserDeposit(sysUserDeposit));
    }

    /**
     * 删除用户押金信息
     */
    @PreAuthorize("@ss.hasPermi('system:deposit:remove')")
    @Log(title = "用户押金信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysUserDepositService.deleteSysUserDepositByIds(ids));
    }
}
