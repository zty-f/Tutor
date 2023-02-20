package com.zty.system.service.impl;

import java.util.List;

import com.zty.common.utils.SecurityUtils;
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
    private ParentMapper parentMapper;

    @Autowired
    private StudentMapper studentMapper;

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
        return sysUserOrderMapper.selectSysUserOrderList(sysUserOrder);
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
        // 设置用户押金状态为冻结，只能存入
        userDepositMapper.updateSysUserDepositStatus(sysUserOrder.getStudentId(), "1");
        userDepositMapper.updateSysUserDepositStatus(sysUserOrder.getParentId(), "1");
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
}
