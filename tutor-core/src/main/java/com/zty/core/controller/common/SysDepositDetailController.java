package com.zty.core.controller.common;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.zty.common.utils.SecurityUtils;
import com.zty.common.utils.sign.RsaUtils;
import com.zty.system.domain.SysUserDeposit;
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
import com.zty.system.domain.SysDepositDetail;
import com.zty.system.service.ISysDepositDetailService;
import com.zty.common.utils.poi.ExcelUtil;
import com.zty.common.core.page.TableDataInfo;

/**
 * 用户押金操作信息Controller
 * 
 * @author zty
 * @date 2023-02-16
 */
@RestController
@RequestMapping("/system/detail")
public class SysDepositDetailController extends BaseController
{
    @Autowired
    private ISysDepositDetailService sysDepositDetailService;

    /**
     * 查询用户押金操作信息列表
     */
    @GetMapping("/list")
    public TableDataInfo list(SysDepositDetail sysDepositDetail)
    {
        startPage();
        List<SysDepositDetail> list = sysDepositDetailService.selectSysDepositDetailList(sysDepositDetail);
        return getDataTable(list);
    }

    /**
     * 导出用户押金操作信息列表
     */
    @Log(title = "用户押金操作信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysDepositDetail sysDepositDetail)
    {
        List<SysDepositDetail> list = sysDepositDetailService.selectSysDepositDetailList(sysDepositDetail);
        ExcelUtil<SysDepositDetail> util = new ExcelUtil<SysDepositDetail>(SysDepositDetail.class);
        util.exportExcel(response, list, "用户押金操作信息数据");
    }

    /**
     * 获取用户押金操作信息详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysDepositDetailService.selectSysDepositDetailById(id));
    }

    /**
     * 存入用户押金操作信息
     */
    @Log(title = "用户押金操作信息", businessType = BusinessType.OTHER)
    @PostMapping("/store")
    public AjaxResult store(@RequestBody SysUserDeposit sysUserDeposit) throws Exception {
        sysUserDeposit.setUserId(SecurityUtils.getUserId());
        sysUserDeposit.setPassword(RsaUtils.decryptByPrivateKey(sysUserDeposit.getPassword()));
        return toAjax(sysDepositDetailService.storeDeposit(sysUserDeposit));
    }

    /**
     * 取出用户押金操作信息
     */
    @Log(title = "用户押金操作信息", businessType = BusinessType.OTHER)
    @PutMapping("/fetch")
    public AjaxResult fetch(@RequestBody SysUserDeposit sysUserDeposit) throws Exception {
        sysUserDeposit.setUserId(SecurityUtils.getUserId());
        sysUserDeposit.setPassword(RsaUtils.decryptByPrivateKey(sysUserDeposit.getPassword()));
        return toAjax(sysDepositDetailService.fetchDeposit(sysUserDeposit));
    }

    /**
     * 删除用户押金操作信息
     */
    @Log(title = "用户押金操作信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysDepositDetailService.deleteSysDepositDetailByIds(ids));
    }
}
