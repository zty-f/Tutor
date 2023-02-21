package com.zty.system.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Objects;

import com.zty.common.utils.SecurityUtils;
import com.zty.system.domain.SysUserDeposit;
import com.zty.system.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zty.system.domain.SysUserOrder;
import com.zty.system.service.ISysUserOrderService;

/**
 * 用户下单信息Service业务层处理
 * 
 * @author zty
 * @date 2023-02-16
 */
@Service
public class SysUserOrderServiceImpl implements ISysUserOrderService 
{
    @Autowired
    private SysUserOrderMapper sysUserOrderMapper;

    @Autowired
    private SysUserDepositMapper userDepositMapper;

    @Autowired
    private SysUserRoleMapper roleMapper;

    /**
     * 查询用户下单信息
     * 
     * @param id 用户下单信息主键
     * @return 用户下单信息
     */
    @Override
    public SysUserOrder selectSysUserOrderById(Long id)
    {
        return sysUserOrderMapper.selectSysUserOrderById(id);
    }

    /**
     * 查询用户下单信息列表
     * 
     * @param sysUserOrder 用户下单信息
     * @return 用户下单信息
     */
    @Override
    public List<SysUserOrder> selectSysUserOrderList(SysUserOrder sysUserOrder)
    {
        int role = roleMapper.selectUserRoleIdByUserId(SecurityUtils.getUserId());
        if (role==3){
            sysUserOrder.setStudentId(SecurityUtils.getUserId());
        } else if (role == 4) {
            sysUserOrder.setParentId(SecurityUtils.getUserId());
        }
        List<SysUserOrder> userOrders = sysUserOrderMapper.selectSysUserOrderList(sysUserOrder);
        for (SysUserOrder userOrder : userOrders) {
            int s = Integer.parseInt(userOrder.getStudentStatus()); //订单对应学生方状态
            int p = Integer.parseInt(userOrder.getParentStatus()); //订单对应学员方状态
            if (role==3){ // 学生
                if ((s==0&&p==0)||(s==0&&p==1)){
                    userOrder.setOpenConfirm(true);
                }
                if ((s==0&&p==0)||(s==0&&p==2)||(s==0&&p==1)||(s==1&&p==2)){
                    userOrder.setOpenCancel(true);
                }
                if ((s==1&&p==1)||(s==1&&p==3)){
                    userOrder.setOpenFinish(true);
                }
                if ((s==1&&p==1)||(s==1&&p==4)||(s==1&&p==3)||(s==3&&p==4)){
                    userOrder.setOpenLegal(true);
                }
            }else if (role==4){ // 家长（学员）
                if ((s==0&&p==0)||(s==1&&p==0)){
                    userOrder.setOpenConfirm(true);
                }
                if ((s==0&&p==0)||(s==2&&p==0)||(s==1&&p==0)||(s==2&&p==1)){
                    userOrder.setOpenCancel(true);
                }
                if ((s==1&&p==1)||(s==3&&p==1)){
                    userOrder.setOpenFinish(true);
                }
                if ((s==1&&p==1)||(s==4&&p==1)||(s==3&&p==1)||(s==4&&p==3)){
                    userOrder.setOpenLegal(true);
                }
            }
        }
        return userOrders;
    }

    /**
     * 新增用户下单信息
     * 
     * @param sysUserOrder 用户下单信息
     * @return 结果
     */
    @Override
    public int insertSysUserOrder(SysUserOrder sysUserOrder)
    {
        return sysUserOrderMapper.insertSysUserOrder(sysUserOrder);
    }

    /**
     * 修改用户下单信息
     * 
     * @param sysUserOrder 用户下单信息
     * @return 结果
     */
    @Override
    public int updateSysUserOrder(SysUserOrder sysUserOrder)
    {
        return sysUserOrderMapper.updateSysUserOrder(sysUserOrder);
    }

    /**
     * 批量删除用户下单信息
     * 
     * @param ids 需要删除的用户下单信息主键
     * @return 结果
     */
    @Override
    public int deleteSysUserOrderByIds(Long[] ids)
    {
        return sysUserOrderMapper.deleteSysUserOrderByIds(ids);
    }

    /**
     * 删除用户下单信息信息
     * 
     * @param id 用户下单信息主键
     * @return 结果
     */
    @Override
    public int deleteSysUserOrderById(Long id)
    {
        return sysUserOrderMapper.deleteSysUserOrderById(id);
    }

    /**
     * 修改用户下单状态信息
     */
    @Override
    public int updateStatus(int id,String status){
        int role = roleMapper.selectUserRoleIdByUserId(SecurityUtils.getUserId());
        SysUserOrder sysUserOrder = sysUserOrderMapper.selectSysUserOrderById((long) id);
        // 双方确认
        if (status.equals("1") &&
                (sysUserOrder.getStudentStatus().equals("1") || sysUserOrder.getParentStatus().equals("1"))){
            // 设置用户押金状态为冻结，只能存入
            userDepositMapper.updateSysUserDepositStatus(sysUserOrder.getStudentId(), "1");
            userDepositMapper.updateSysUserDepositStatus(sysUserOrder.getParentId(), "1");
        }
        // 双方取消
        if (status.equals("2") &&
                (sysUserOrder.getStudentStatus().equals("2") || sysUserOrder.getParentStatus().equals("2"))){
            sysUserOrderMapper.updateStudentOrderStatus(id,"0");
            return sysUserOrderMapper.updateParentOrderStatus(id,"0");
        }
        // 双方完成
        if (status.equals("3") &&
                (sysUserOrder.getStudentStatus().equals("3") || sysUserOrder.getParentStatus().equals("3"))){
            unfrozeFunds(sysUserOrder);
            sysUserOrderMapper.updateStudentOrderStatus(id,"0");
            return sysUserOrderMapper.updateParentOrderStatus(id,"0");
        }
        if (role==3){ // 学生
            return sysUserOrderMapper.updateStudentOrderStatus(id,status);
        }
        return sysUserOrderMapper.updateParentOrderStatus(id,status);
    }

    /*条件符合解冻资金*/
    public void unfrozeFunds(SysUserOrder sysUserOrder){
        //判断双方所有订单情况，条件符合（没有确认的订单解冻资金）
        BigDecimal sAmount = sysUserOrderMapper.selectStudentOrderConfirmAmountById(sysUserOrder.getStudentId());
        if (sAmount==null||sAmount.compareTo(new BigDecimal(0))==0){
            userDepositMapper.updateSysUserDepositStatus(sysUserOrder.getStudentId(), "0");
        }
        BigDecimal pAmount = sysUserOrderMapper.selectParentOrderConfirmAmountById(sysUserOrder.getParentId());
        if (pAmount==null||pAmount.compareTo(new BigDecimal(0))==0){
            userDepositMapper.updateSysUserDepositStatus(sysUserOrder.getParentId(), "0");
        }
    }
}
