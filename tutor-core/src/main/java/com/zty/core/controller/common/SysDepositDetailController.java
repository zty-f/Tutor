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
    @PreAuthorize("@ss.hasPermi('system:detail:list')")
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
    @PreAuthorize("@ss.hasPermi('system:detail:export')")
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
    @PreAuthorize("@ss.hasPermi('system:detail:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysDepositDetailService.selectSysDepositDetailById(id));
    }

    /**
     * 新增用户押金操作信息
     */
    @PreAuthorize("@ss.hasPermi('system:detail:add')")
    @Log(title = "用户押金操作信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysDepositDetail sysDepositDetail)
    {
        return toAjax(sysDepositDetailService.insertSysDepositDetail(sysDepositDetail));
    }

    /**
     * 修改用户押金操作信息
     */
    @PreAuthorize("@ss.hasPermi('system:detail:edit')")
    @Log(title = "用户押金操作信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysDepositDetail sysDepositDetail)
    {
        return toAjax(sysDepositDetailService.updateSysDepositDetail(sysDepositDetail));
    }

    /**
     * 删除用户押金操作信息
     */
    @PreAuthorize("@ss.hasPermi('system:detail:remove')")
    @Log(title = "用户押金操作信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysDepositDetailService.deleteSysDepositDetailByIds(ids));
    }
}
