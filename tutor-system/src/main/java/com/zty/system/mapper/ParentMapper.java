package com.zty.system.mapper;


import com.zty.system.domain.Parent;
import com.zty.system.domain.SysParent;

import java.util.List;

/**
 * 学员信息Mapper接口
 * 
 * @author zty
 * @date 2022-12-25
 */
public interface ParentMapper 
{
    /**
     * 查询学员信息
     * 
     * @param userId 学员信息主键
     * @return 学员信息
     */
    public Parent selectParentByUserId(Long userId);

    /**
     * 查询学员信息是否存在
     *
     * @param userId 学员信息主键
     * @return 学员信息
     */
    public int selectExistByUserId(Long userId);

    /**
     * 查询学员信息列表
     * 
     * @param parent 学员信息
     * @return 学员信息集合
     */
    public List<Parent> selectParentList(Parent parent);

    /**
     * 新增学员信息
     * 
     * @param parent 学员信息
     * @return 结果
     */
    public int insertParent(Parent parent);

    /**
     * 修改学员信息
     * 
     * @param parent 学员信息
     * @return 结果
     */
    public int updateParent(Parent parent);

    /**
     * 删除学员信息
     * 
     * @param userId 学员信息主键
     * @return 结果
     */
    public int deleteParentByUserId(Long userId);

    /**
     * 批量删除学员信息
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteParentByUserIds(Long[] userIds);

    /**
     * 批量删除学员家教信息
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysParentByUserIds(Long[] userIds);
    
    /**
     * 批量新增学员家教信息
     * 
     * @param sysParent 学员家教信息列表
     * @return 结果
     */
    public int batchSysParent(SysParent sysParent);
    

    /**
     * 通过学员信息主键删除学员家教信息信息
     * 
     * @param userId 学员信息ID
     * @return 结果
     */
    public int deleteSysParentByUserId(Long userId);

    /**
     * 获取认证状态
     * @param userId
     * @return
     */
    public int getAuthStatus(Long userId);
}
