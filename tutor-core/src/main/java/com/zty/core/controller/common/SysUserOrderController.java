package com.zty.core.controller.common;

import java.math.BigDecimal;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.zty.common.utils.DateUtils;
import com.zty.common.utils.SecurityUtils;
import com.zty.common.utils.sign.RsaUtils;
import com.zty.system.domain.SysUserDeposit;
import com.zty.system.mapper.*;
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

    @Autowired
    private SysUserOrderMapper userOrderMapper;

    @Autowired
    private SysUserDepositMapper userDepositMapper;

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private ParentMapper parentMapper;

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
        // 判断下单双方用户是否进行在线认证
        if (role==3){
            sysUserOrder.setStudentId(SecurityUtils.getUserId());
            sysUserOrder.setStatus("0");
        } else if (role == 4) {
            sysUserOrder.setParentId(SecurityUtils.getUserId());
            sysUserOrder.setStatus("1");
        }else {
            sysUserOrder.setStatus("2");
        }
        if (studentMapper.selectExistByUserId(sysUserOrder.getStudentId())<=0){
            throw new RuntimeException("该大学生用户ID不存在，请核对后重新输入");
        }
        if (parentMapper.selectExistByUserId(sysUserOrder.getParentId())<=0){
            throw new RuntimeException("该家长(学员)用户ID不存在，请核对后重新输入");
        }
        if (studentMapper.getAuthStatus(sysUserOrder.getStudentId())==0){
            return error("您或者对方未进行在线认证，请您核对后再进行下单！");
        }
        if (parentMapper.getAuthStatus(sysUserOrder.getParentId())==0){
            return error("您或者对方未进行在线认证，请您核对后再进行下单！");
        }
        // 1.获取订单对应用户已经创建的订单金额
        BigDecimal sAmount = userOrderMapper.selectStudentOrderAmountById(sysUserOrder.getStudentId());
        BigDecimal pAmount = userOrderMapper.selectParentOrderAmountById(sysUserOrder.getParentId());
        // 2.获取用户押金-已创建订单金额判断是否足够该订单创建（订单双方所剩押金余额必须>=本次订单金额）
        SysUserDeposit sDeposit = userDepositMapper.selectSysUserDepositById(sysUserOrder.getStudentId());
        if (sDeposit==null){
            return error("您或者对方未开通交易功能，请您核对后再进行下单！");
        }
        SysUserDeposit pDeposit = userDepositMapper.selectSysUserDepositById(sysUserOrder.getParentId());
        if (pDeposit==null){
            return error("您或者对方未开通交易功能，请您核对后再进行下单！");
        }
        BigDecimal sReBalance = sDeposit.getBalance();
        BigDecimal pReBalance = pDeposit.getBalance();
        if (sAmount!=null){
            sReBalance = sReBalance.subtract(sAmount);
        }
        if (pAmount!=null){
            pReBalance = pReBalance.subtract(pAmount);
        }
        if (sReBalance.compareTo(sysUserOrder.getAmount())<0){
            return error("您或者对方押金金额不足，请您核对后再进行下单！提示：订单对应双方的押金金额必须大于等于各自所有创建订单总金额。");
        }
        if (pReBalance.compareTo(sysUserOrder.getAmount())<0){
            return error("您或者对方押金金额不足，请您核对后再进行下单！提示：订单对应双方的押金金额必须大于等于各自所有创建订单总金额。");
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
        // 1.获取订单对应用户已经创建的订单金额
        BigDecimal sAmount = userOrderMapper.selectStudentOrderAmountById(sysUserOrder.getStudentId());
        BigDecimal pAmount = userOrderMapper.selectParentOrderAmountById(sysUserOrder.getParentId());
        // 2.获取用户押金-已创建订单金额判断是否足够该订单创建（订单双方所剩押金余额必须>=本次订单金额）
        BigDecimal sReBalance = userDepositMapper.selectSysUserDepositById(sysUserOrder.getStudentId()).getBalance();
        BigDecimal pReBalance = userDepositMapper.selectSysUserDepositById(sysUserOrder.getParentId()).getBalance();
        if (sAmount!=null){
            sReBalance = sReBalance.subtract(sAmount);
        }
        if (pAmount!=null){
            pReBalance = pReBalance.subtract(pAmount);
        }
        if (sReBalance.compareTo(sysUserOrder.getAmount())<0){
            return error("您或者对方押金金额不足，请您核对后再进行下单！提示：订单对应双方的押金金额必须大于等于各自所有创建订单总金额。");
        }
        if (pReBalance.compareTo(sysUserOrder.getAmount())<0){
            return error("您或者对方押金金额不足，请您核对后再进行下单！提示：订单对应双方的押金金额必须大于等于各自所有创建订单总金额。");
        }
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

    /**
     * 修改用户订单状态
     */
    @Log(title = "用户订单信息", businessType = BusinessType.UPDATE)
    @PutMapping("/updateStatus")
    public AjaxResult updateStatus(int id, String status) throws Exception {
        return toAjax(sysUserOrderService.updateStatus(id,status));
    }
}
