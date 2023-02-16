package com.zty.system.service;

import java.util.List;
import com.zty.system.domain.SysUserOrder;

/**
 * 用户下单信息Service接口
 * 
 * @author zty
 * @date 2023-02-16
 */
public interface ISysUserOrderService 
{
    /**
     * 查询用户下单信息
     * 
     * @param id 用户下单信息主键
     * @return 用户下单信息
     */
    public SysUserOrder selectSysUserOrderById(Long id);

    /**
     * 查询用户下单信息列表
     * 
     * @param sysUserOrder 用户下单信息
     * @return 用户下单信息集合
     */
    public List<SysUserOrder> selectSysUserOrderList(SysUserOrder sysUserOrder);

    /**
     * 新增用户下单信息
     * 
     * @param sysUserOrder 用户下单信息
     * @return 结果
     */
    public int insertSysUserOrder(SysUserOrder sysUserOrder);

    /**
     * 修改用户下单信息
     * 
     * @param sysUserOrder 用户下单信息
     * @return 结果
     */
    public int updateSysUserOrder(SysUserOrder sysUserOrder);

    /**
     * 批量删除用户下单信息
     * 
     * @param ids 需要删除的用户下单信息主键集合
     * @return 结果
     */
    public int deleteSysUserOrderByIds(Long[] ids);

    /**
     * 删除用户下单信息信息
     * 
     * @param id 用户下单信息主键
     * @return 结果
     */
    public int deleteSysUserOrderById(Long id);
}
