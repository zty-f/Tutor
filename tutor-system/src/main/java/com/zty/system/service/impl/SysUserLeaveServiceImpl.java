package com.zty.system.service.impl;

import java.util.List;
import com.zty.common.utils.DateUtils;
import com.zty.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zty.system.mapper.SysUserLeaveMapper;
import com.zty.system.domain.SysUserLeave;
import com.zty.system.service.ISysUserLeaveService;

/**
 * 用户留言信息Service业务层处理
 * 
 * @author zty
 * @date 2023-02-13
 */
@Service
public class SysUserLeaveServiceImpl implements ISysUserLeaveService 
{
    @Autowired
    private SysUserLeaveMapper sysUserLeaveMapper;

    /**
     * 查询用户留言信息
     * 
     * @param id 用户留言信息主键
     * @return 用户留言信息
     */
    @Override
    public SysUserLeave selectSysUserLeaveById(Long id)
    {
        return sysUserLeaveMapper.selectSysUserLeaveById(id);
    }

    /**
     * 查询用户留言信息列表
     * 
     * @param sysUserLeave 用户留言信息
     * @return 用户留言信息
     */
    @Override
    public List<SysUserLeave> selectSysUserSendLeaveList(SysUserLeave sysUserLeave)
    {
        sysUserLeave.setSendId(SecurityUtils.getUserId());
        return sysUserLeaveMapper.selectSysUserSendLeaveList(sysUserLeave);
    }

    /**
     * 查询用户留言信息列表
     *
     * @param sysUserLeave 用户留言信息
     * @return 用户留言信息
     */
    @Override
    public List<SysUserLeave> selectSysUserReceivedLeaveList(SysUserLeave sysUserLeave)
    {
        sysUserLeave.setReceivedId(SecurityUtils.getUserId());
        return sysUserLeaveMapper.selectSysUserReceivedLeaveList(sysUserLeave);
    }

    /**
     * 新增用户留言信息
     * 
     * @param sysUserLeave 用户留言信息
     * @return 结果
     */
    @Override
    public int insertSysUserLeave(SysUserLeave sysUserLeave)
    {
        sysUserLeave.setSendId(SecurityUtils.getUserId());
        sysUserLeave.setSendUsername(SecurityUtils.getUsername());
        sysUserLeave.setCreateTime(DateUtils.getNowDate());
        return sysUserLeaveMapper.insertSysUserLeave(sysUserLeave);
    }

    /**
     * 修改用户留言信息
     * 
     * @param sysUserLeave 用户留言信息
     * @return 结果
     */
    @Override
    public int updateSysUserLeave(SysUserLeave sysUserLeave)
    {
        return sysUserLeaveMapper.updateSysUserLeave(sysUserLeave);
    }

    /**
     * 批量删除用户留言信息
     * 
     * @param ids 需要删除的用户留言信息主键
     * @return 结果
     */
    @Override
    public int deleteSysUserLeaveByIds(Long[] ids)
    {
        return sysUserLeaveMapper.deleteSysUserLeaveByIds(ids);
    }

    public int updateSysUserLeaveByIds(Long[] ids)
    {
        return sysUserLeaveMapper.updateSysUserLeaveByIds(ids);
    }
}
