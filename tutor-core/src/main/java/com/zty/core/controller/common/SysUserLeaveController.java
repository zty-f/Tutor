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
import com.zty.system.domain.SysUserLeave;
import com.zty.system.service.ISysUserLeaveService;
import com.zty.common.utils.poi.ExcelUtil;
import com.zty.common.core.page.TableDataInfo;

/**
 * 用户留言信息Controller
 * 
 * @author zty
 * @date 2023-02-13
 */
@RestController
@RequestMapping("/core/leave")
public class SysUserLeaveController extends BaseController
{
    @Autowired
    private ISysUserLeaveService sysUserLeaveService;

    /**
     * 查询用户留言信息列表
     */
    @GetMapping("/sendList")
    public TableDataInfo sendList(SysUserLeave sysUserLeave)
    {
        startPage();
        List<SysUserLeave> list = sysUserLeaveService.selectSysUserSendLeaveList(sysUserLeave);
        return getDataTable(list);
    }

    /**
     * 查询用户留言信息列表
     */
    @GetMapping("/receivedList")
    public TableDataInfo receivedList(SysUserLeave sysUserLeave)
    {
        startPage();
        List<SysUserLeave> list = sysUserLeaveService.selectSysUserReceivedLeaveList(sysUserLeave);
        return getDataTable(list);
    }

    /**
     * 导出用户留言信息列表
     */
    @Log(title = "用户留言信息", businessType = BusinessType.EXPORT)
    @PostMapping("/exportSendList")
    public void exportSendList(HttpServletResponse response, SysUserLeave sysUserLeave)
    {
        List<SysUserLeave> list = sysUserLeaveService.selectSysUserSendLeaveList(sysUserLeave);
        ExcelUtil<SysUserLeave> util = new ExcelUtil<SysUserLeave>(SysUserLeave.class);
        util.exportExcel(response, list, "用户留言信息数据");
    }

    /**
     * 导出用户留言信息列表
     */
    @Log(title = "用户留言信息", businessType = BusinessType.EXPORT)
    @PostMapping("/exportReceivedList")
    public void exportReceivedList(HttpServletResponse response, SysUserLeave sysUserLeave)
    {
        List<SysUserLeave> list = sysUserLeaveService.selectSysUserReceivedLeaveList(sysUserLeave);
        ExcelUtil<SysUserLeave> util = new ExcelUtil<SysUserLeave>(SysUserLeave.class);
        util.exportExcel(response, list, "用户留言信息数据");
    }

    /**
     * 获取用户留言信息详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysUserLeaveService.selectSysUserLeaveById(id));
    }

    /**
     * 新增用户留言信息
     */
    @Log(title = "用户留言信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUserLeave sysUserLeave)
    {
        return toAjax(sysUserLeaveService.insertSysUserLeave(sysUserLeave));
    }

    /**
     * 修改用户留言信息
     */
    @Log(title = "用户留言信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysUserLeave sysUserLeave)
    {
        return toAjax(sysUserLeaveService.updateSysUserLeave(sysUserLeave));
    }

    /**
     * 删除用户留言信息
     */
    @Log(title = "用户留言信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysUserLeaveService.deleteSysUserLeaveByIds(ids));
    }


    /**
     * 修改用户留言状态信息
     */
    @Log(title = "用户留言信息", businessType = BusinessType.UPDATE)
    @PutMapping("/{ids}")
    public AjaxResult update(@PathVariable Long[] ids)
    {
        return toAjax(sysUserLeaveService.updateSysUserLeaveByIds(ids));
    }
}
