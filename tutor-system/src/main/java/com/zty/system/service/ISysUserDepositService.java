package com.zty.system.service;

import java.util.List;
import com.zty.system.domain.SysUserDeposit;

/**
 * 用户押金信息Service接口
 * 
 * @author zty
 * @date 2023-02-16
 */
public interface ISysUserDepositService 
{
    /**
     * 查询用户押金信息
     * 
     * @param id 用户押金信息主键
     * @return 用户押金信息
     */
    public SysUserDeposit selectSysUserDepositById(Long id);

    /**
     * 查询用户押金信息列表
     * 
     * @param sysUserDeposit 用户押金信息
     * @return 用户押金信息集合
     */
    public List<SysUserDeposit> selectSysUserDepositList(SysUserDeposit sysUserDeposit);

    /**
     * 新增用户押金信息
     * 
     * @param sysUserDeposit 用户押金信息
     * @return 结果
     */
    public int insertSysUserDeposit(SysUserDeposit sysUserDeposit);

    /**
     * 修改用户押金信息
     * 
     * @param sysUserDeposit 用户押金信息
     * @return 结果
     */
    public int updateSysUserDeposit(SysUserDeposit sysUserDeposit);

    public int updateSysUserDepositPwdByUserId(SysUserDeposit sysUserDeposit);

    /**
     * 批量删除用户押金信息
     * 
     * @param ids 需要删除的用户押金信息主键集合
     * @return 结果
     */
    public int deleteSysUserDepositByIds(Long[] ids);

    /**
     * 删除用户押金信息信息
     * 
     * @param id 用户押金信息主键
     * @return 结果
     */
    public int deleteSysUserDepositById(Long id);
}
