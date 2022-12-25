package com.zty.core.mapper;

import java.util.List;
import com.zty.core.domain.Parent;
import com.zty.core.domain.SysParent;

/**
 * 家长信息Mapper接口
 * 
 * @author zty
 * @date 2022-12-25
 */
public interface ParentMapper 
{
    /**
     * 查询家长信息
     * 
     * @param userId 家长信息主键
     * @return 家长信息
     */
    public Parent selectParentByUserId(Long userId);

    /**
     * 查询家长信息列表
     * 
     * @param parent 家长信息
     * @return 家长信息集合
     */
    public List<Parent> selectParentList(Parent parent);

    /**
     * 新增家长信息
     * 
     * @param parent 家长信息
     * @return 结果
     */
    public int insertParent(Parent parent);

    /**
     * 修改家长信息
     * 
     * @param parent 家长信息
     * @return 结果
     */
    public int updateParent(Parent parent);

    /**
     * 删除家长信息
     * 
     * @param userId 家长信息主键
     * @return 结果
     */
    public int deleteParentByUserId(Long userId);

    /**
     * 批量删除家长信息
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteParentByUserIds(Long[] userIds);

    /**
     * 批量删除家长家教信息
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysParentByUserIds(Long[] userIds);
    
    /**
     * 批量新增家长家教信息
     * 
     * @param sysParentList 家长家教信息列表
     * @return 结果
     */
    public int batchSysParent(List<SysParent> sysParentList);
    

    /**
     * 通过家长信息主键删除家长家教信息信息
     * 
     * @param userId 家长信息ID
     * @return 结果
     */
    public int deleteSysParentByUserId(Long userId);
}
