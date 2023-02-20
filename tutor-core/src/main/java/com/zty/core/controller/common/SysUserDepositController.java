package com.zty.core.controller.common;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.zty.common.utils.SecurityUtils;
import com.zty.common.utils.sign.RsaUtils;
import com.zty.system.mapper.SysUserDepositMapper;
import com.zty.system.mapper.SysUserOrderMapper;
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

    @Autowired
    private SysUserDepositMapper sysUserDepositMapper;

    @Autowired
    private SysUserOrderMapper orderMapper;

    @Autowired
    private SysUserRoleMapper roleMapper;

    /**
     * 查询用户押金信息列表
     */
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
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        AjaxResult ajax = AjaxResult.success(sysUserDepositService.selectSysUserDepositById(id));
        int role = roleMapper.selectUserRoleIdByUserId(SecurityUtils.getUserId());
        if (role == 3){
            ajax.put("totalOrderAmount",orderMapper.selectStudentOrderAmountById(id));
        } else if (role == 4) {
            ajax.put("totalOrderAmount",orderMapper.selectParentOrderAmountById(id));
        }else{
            ajax.put("totalOrderAmount",null);
        }
        return ajax;
    }

    /**
     * 新增用户押金信息
     */
    @Log(title = "用户押金信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysUserDeposit sysUserDeposit) throws Exception {
        sysUserDeposit.setPassword(RsaUtils.decryptByPrivateKey(sysUserDeposit.getPassword()));
        return toAjax(sysUserDepositService.insertSysUserDeposit(sysUserDeposit));
    }

    /**
     * 修改用户押金信息
     */
    @Log(title = "用户押金信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysUserDeposit sysUserDeposit)
    {
        return toAjax(sysUserDepositService.updateSysUserDeposit(sysUserDeposit));
    }

    /**
     * 修改用户交易密码
     */
    @Log(title = "用户押金信息", businessType = BusinessType.UPDATE)
    @PutMapping("/updatePwd")
    public AjaxResult updatePwd(String oldPassword, String newPassword) throws Exception {
        oldPassword = RsaUtils.decryptByPrivateKey(oldPassword);
        newPassword = RsaUtils.decryptByPrivateKey(newPassword);
        String truePwd = sysUserDepositMapper.selectSysUserDepositPasswordById(SecurityUtils.getUserId());
        if (!SecurityUtils.matchesPassword(oldPassword, truePwd)){
            return error("原交易密码错误，请核对后重新输入~");
        }
        return toAjax(sysUserDepositService.updateSysUserDepositPwdByUserId(new SysUserDeposit(SecurityUtils.getUserId(),SecurityUtils.encryptPassword(newPassword))));
    }

    /**
     * 删除用户押金信息
     */
    @Log(title = "用户押金信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysUserDepositService.deleteSysUserDepositByIds(ids));
    }
}
