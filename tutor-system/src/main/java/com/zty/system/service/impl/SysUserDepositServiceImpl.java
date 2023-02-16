package com.zty.system.service.impl;

import java.util.List;
import com.zty.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zty.system.mapper.SysUserDepositMapper;
import com.zty.system.domain.SysUserDeposit;
import com.zty.system.service.ISysUserDepositService;

/**
 * 用户押金信息Service业务层处理
 * 
 * @author zty
 * @date 2023-02-16
 */
@Service
public class SysUserDepositServiceImpl implements ISysUserDepositService 
{
    @Autowired
    private SysUserDepositMapper sysUserDepositMapper;

    /**
     * 查询用户押金信息
     * 
     * @param id 用户押金信息主键
     * @return 用户押金信息
     */
    @Override
    public SysUserDeposit selectSysUserDepositById(Long id)
    {
        return sysUserDepositMapper.selectSysUserDepositById(id);
    }

    /**
     * 查询用户押金信息列表
     * 
     * @param sysUserDeposit 用户押金信息
     * @return 用户押金信息
     */
    @Override
    public List<SysUserDeposit> selectSysUserDepositList(SysUserDeposit sysUserDeposit)
    {
        return sysUserDepositMapper.selectSysUserDepositList(sysUserDeposit);
    }

    /**
     * 新增用户押金信息
     * 
     * @param sysUserDeposit 用户押金信息
     * @return 结果
     */
    @Override
    public int insertSysUserDeposit(SysUserDeposit sysUserDeposit)
    {
        return sysUserDepositMapper.insertSysUserDeposit(sysUserDeposit);
    }

    /**
     * 修改用户押金信息
     * 
     * @param sysUserDeposit 用户押金信息
     * @return 结果
     */
    @Override
    public int updateSysUserDeposit(SysUserDeposit sysUserDeposit)
    {
        sysUserDeposit.setUpdateTime(DateUtils.getNowDate());
        return sysUserDepositMapper.updateSysUserDeposit(sysUserDeposit);
    }

    /**
     * 批量删除用户押金信息
     * 
     * @param ids 需要删除的用户押金信息主键
     * @return 结果
     */
    @Override
    public int deleteSysUserDepositByIds(Long[] ids)
    {
        return sysUserDepositMapper.deleteSysUserDepositByIds(ids);
    }

    /**
     * 删除用户押金信息信息
     * 
     * @param id 用户押金信息主键
     * @return 结果
     */
    @Override
    public int deleteSysUserDepositById(Long id)
    {
        return sysUserDepositMapper.deleteSysUserDepositById(id);
    }
}
