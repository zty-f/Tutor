package com.zty.system.service.impl;

import java.math.BigDecimal;
import java.util.List;
import com.zty.common.utils.DateUtils;
import com.zty.common.utils.SecurityUtils;
import com.zty.system.domain.SysUserDeposit;
import com.zty.system.mapper.SysUserDepositMapper;
import com.zty.system.mapper.SysUserRoleMapper;
import com.zty.system.service.ISysUserDepositService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zty.system.mapper.SysDepositDetailMapper;
import com.zty.system.domain.SysDepositDetail;
import com.zty.system.service.ISysDepositDetailService;

/**
 * 用户押金操作信息Service业务层处理
 * 
 * @author zty
 * @date 2023-02-16
 */
@Service
public class SysDepositDetailServiceImpl implements ISysDepositDetailService 
{
    @Autowired
    private SysDepositDetailMapper sysDepositDetailMapper;

    @Autowired
    private SysUserDepositMapper sysUserDepositMapper;

    @Autowired
    private SysUserRoleMapper userRoleMapper;

    /**
     * 查询用户押金操作信息
     * 
     * @param id 用户押金操作信息主键
     * @return 用户押金操作信息
     */
    @Override
    public SysDepositDetail selectSysDepositDetailById(Long id)
    {
        return sysDepositDetailMapper.selectSysDepositDetailById(id);
    }

    /**
     * 查询用户押金操作信息列表
     * 
     * @param sysDepositDetail 用户押金操作信息
     * @return 用户押金操作信息
     */
    @Override
    public List<SysDepositDetail> selectSysDepositDetailList(SysDepositDetail sysDepositDetail)
    {
        int roleId = userRoleMapper.selectUserRoleIdByUserId(SecurityUtils.getUserId());
        if (roleId==3||roleId==4){
            sysDepositDetail.setUserId(SecurityUtils.getUserId());
        }
        return sysDepositDetailMapper.selectSysDepositDetailList(sysDepositDetail);
    }

    /**
     * 存入用户押金操作信息
     * 
     * @param sysUserDeposit 用户押金操作信息
     * @return 结果
     */
    @Override
    public int storeDeposit(SysUserDeposit sysUserDeposit)
    {
        // 1. 验证交易密码
        String pwd = sysUserDepositMapper.selectSysUserDepositPasswordById(sysUserDeposit.getUserId());
        if (!SecurityUtils.matchesPassword(sysUserDeposit.getPassword(), pwd)){
            throw new RuntimeException("交易密码错误，请重新输入~");
        }
        // 2. 个人押金信息增减
        sysUserDepositMapper.storeSysUserDeposit(sysUserDeposit);
        // 3. 押金操作详情信息插入
        BigDecimal balance = sysUserDepositMapper.selectSysUserDepositById(sysUserDeposit.getUserId()).getBalance();
        SysDepositDetail depositDetail = new SysDepositDetail(sysUserDeposit.getUserId(), sysUserDeposit.getBalance(),balance,"0");
        depositDetail.setCreateTime(DateUtils.getNowDate());
        return sysDepositDetailMapper.insertSysDepositDetail(depositDetail);
    }

    /**
     * 取出用户押金操作信息
     *
     * @param sysUserDeposit 用户押金操作信息
     * @return 结果
     */
    @Override
    public int fetchDeposit(SysUserDeposit sysUserDeposit)
    {
        // 1. 验证交易密码
        String pwd = sysUserDepositMapper.selectSysUserDepositPasswordById(sysUserDeposit.getUserId());
        if (!SecurityUtils.matchesPassword(sysUserDeposit.getPassword(), pwd)){
            throw new RuntimeException("交易密码错误，请重新输入~");
        }
        // 2. 个人押金信息增减
        sysUserDepositMapper.fetchSysUserDeposit(sysUserDeposit);
        // 3. 押金操作详情信息插入
        BigDecimal balance = sysUserDepositMapper.selectSysUserDepositById(sysUserDeposit.getUserId()).getBalance();
        SysDepositDetail depositDetail = new SysDepositDetail(sysUserDeposit.getUserId(), sysUserDeposit.getBalance(),balance,"1");
        depositDetail.setCreateTime(DateUtils.getNowDate());
        return sysDepositDetailMapper.insertSysDepositDetail(depositDetail);
    }

    /**
     * 批量删除用户押金操作信息
     * 
     * @param ids 需要删除的用户押金操作信息主键
     * @return 结果
     */
    @Override
    public int deleteSysDepositDetailByIds(Long[] ids)
    {
        return sysDepositDetailMapper.deleteSysDepositDetailByIds(ids);
    }

    /**
     * 删除用户押金操作信息信息
     * 
     * @param id 用户押金操作信息主键
     * @return 结果
     */
    @Override
    public int deleteSysDepositDetailById(Long id)
    {
        return sysDepositDetailMapper.deleteSysDepositDetailById(id);
    }
}
