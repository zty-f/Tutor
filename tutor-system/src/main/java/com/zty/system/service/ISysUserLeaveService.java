package com.zty.system.service;

import java.util.List;
import com.zty.system.domain.SysUserLeave;

/**
 * 用户留言信息Service接口
 * 
 * @author zty
 * @date 2023-02-13
 */
public interface ISysUserLeaveService 
{
    /**
     * 查询用户留言信息
     * 
     * @param id 用户留言信息主键
     * @return 用户留言信息
     */
    public SysUserLeave selectSysUserLeaveById(Long id);

    /**
     * 查询用户留言信息列表
     * 
     * @param sysUserLeave 用户留言信息
     * @return 用户留言信息集合
     */
    public List<SysUserLeave> selectSysUserSendLeaveList(SysUserLeave sysUserLeave);


    public List<SysUserLeave> selectSysUserReceivedLeaveList(SysUserLeave sysUserLeave);

    /**
     * 新增用户留言信息
     * 
     * @param sysUserLeave 用户留言信息
     * @return 结果
     */
    public int insertSysUserLeave(SysUserLeave sysUserLeave);

    /**
     * 修改用户留言信息
     * 
     * @param sysUserLeave 用户留言信息
     * @return 结果
     */
    public int updateSysUserLeave(SysUserLeave sysUserLeave);

    /**
     * 批量删除用户留言信息
     * 
     * @param ids 需要删除的用户留言信息主键集合
     * @return 结果
     */
    public int deleteSysUserLeaveByIds(Long[] ids);


    public int updateSysUserLeaveByIds(Long[] ids);
}
