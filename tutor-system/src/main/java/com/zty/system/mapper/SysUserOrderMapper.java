package com.zty.system.mapper;

import java.math.BigDecimal;
import java.util.List;
import com.zty.system.domain.SysUserOrder;

/**
 * 用户下单信息Mapper接口
 * 
 * @author zty
 * @date 2023-02-16
 */
public interface SysUserOrderMapper 
{
    /**
     * 查询用户下单信息
     * 
     * @param id 用户下单信息主键
     * @return 用户下单信息
     */
    public SysUserOrder selectSysUserOrderById(Long id);

    /**
     * 查询学生用户下单总金额
     *
     * @param id 用户下单信息主键
     * @return 用户下单信息
     */
    public BigDecimal selectStudentOrderAmountById(Long id);

    /**
     * 查询家长（学员）用户下单总金额
     *
     * @param id 用户下单信息主键
     * @return 用户下单信息
     */
    public BigDecimal selectParentOrderAmountById(Long id);

    /**
     * 查询学生用户确认下单总金额
     *
     * @param id 用户下单信息主键
     * @return 用户下单信息
     */
    public BigDecimal selectStudentOrderConfirmAmountById(Long id);

    /**
     * 查询家长（学员）用户确认下单总金额
     *
     * @param id 用户下单信息主键
     * @return 用户下单信息
     */
    public BigDecimal selectParentOrderConfirmAmountById(Long id);

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
     * 删除用户下单信息
     * 
     * @param id 用户下单信息主键
     * @return 结果
     */
    public int deleteSysUserOrderById(Long id);

    /**
     * 批量删除用户下单信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysUserOrderByIds(Long[] ids);

    /**
     * 修改用户下单状态
     */
    public int updateStudentOrderStatus(int id,String status);


    public int updateParentOrderStatus(int id,String status);
}
