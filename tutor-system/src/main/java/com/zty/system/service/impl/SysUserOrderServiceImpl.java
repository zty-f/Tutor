package com.zty.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zty.system.mapper.SysUserOrderMapper;
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
