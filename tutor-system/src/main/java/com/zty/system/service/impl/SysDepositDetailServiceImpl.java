package com.zty.system.service.impl;

import java.util.List;
import com.zty.common.utils.DateUtils;
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
        return sysDepositDetailMapper.selectSysDepositDetailList(sysDepositDetail);
    }

    /**
     * 新增用户押金操作信息
     * 
     * @param sysDepositDetail 用户押金操作信息
     * @return 结果
     */
    @Override
    public int insertSysDepositDetail(SysDepositDetail sysDepositDetail)
    {
        sysDepositDetail.setCreateTime(DateUtils.getNowDate());
        return sysDepositDetailMapper.insertSysDepositDetail(sysDepositDetail);
    }

    /**
     * 修改用户押金操作信息
     * 
     * @param sysDepositDetail 用户押金操作信息
     * @return 结果
     */
    @Override
    public int updateSysDepositDetail(SysDepositDetail sysDepositDetail)
    {
        return sysDepositDetailMapper.updateSysDepositDetail(sysDepositDetail);
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
