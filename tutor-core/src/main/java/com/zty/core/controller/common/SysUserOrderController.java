package com.zty.core.controller.common;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.zty.common.utils.DateUtils;
import com.zty.common.utils.SecurityUtils;
import com.zty.system.mapper.SysUserRoleMapper;
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
import com.zty.system.domain.SysUserOrder;
import com.zty.system.service.ISysUserOrderService;
import com.zty.common.utils.poi.ExcelUtil;
import com.zty.common.core.page.TableDataInfo;

/**
 * 用户下单信息Controller
 * 
 * @author zty
 * @date 2023-02-16
 */
@RestController
@RequestMapping("/system/order")
public class SysUserOrderController extends BaseController
{
    @Autowired
    private ISysUserOrderService sysUserOrderService;

    @Autowired
    private SysUserRoleMapper roleMapper;

    /**
     * 查询用户下单信息列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysUserOrder sysUserOrder)
    {
        startPage();
        List<SysUserOrder> list = sysUserOrderService.selectSysUserOrderList(sysUserOrder);
        return getDataTable(list);
    }

    /**
     * 导出用户下单信息列表
     */
    @Log(title = "用户下单信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysUserOrder sysUserOrder)
    {
        List<SysUserOrder> list = sysUserOrderService.selectSysUserOrderList(sysUserOrder);
        ExcelUtil<SysUserOrder> util = new ExcelUtil<SysUserOrder>(SysUserOrder.class);
        util.exportExcel(response, list, "用户下单信息数据");
    }

    /**
     * 获取用户下单信息详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysUserOrderService.selectSysUserOrderById(id));
    }

    /**
     * 新增用户下单信息
     */
    @Log(title = "用户下单信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUserOrder sysUserOrder)
    {
        int role = roleMapper.selectUserRoleIdByUserId(SecurityUtils.getUserId());
        if (role==3){
            sysUserOrder.setStudentId(SecurityUtils.getUserId());
        } else if (role == 4) {
            sysUserOrder.setParentId(SecurityUtils.getUserId());
        }
        sysUserOrder.setStudentStatus("0");
        sysUserOrder.setParentStatus("0");
        sysUserOrder.setStatus("0");
        sysUserOrder.setOrderTime(DateUtils.getNowDate());
        return toAjax(sysUserOrderService.insertSysUserOrder(sysUserOrder));
    }

    /**
     * 修改用户下单信息
     */
    @Log(title = "用户下单信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysUserOrder sysUserOrder)
    {
        return toAjax(sysUserOrderService.updateSysUserOrder(sysUserOrder));
    }

    /**
     * 删除用户下单信息
     */
    @Log(title = "用户下单信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysUserOrderService.deleteSysUserOrderByIds(ids));
    }
}
