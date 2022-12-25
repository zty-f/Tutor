package com.zty.core.service;

import java.util.List;
import com.zty.core.domain.Parent;

/**
 * 家长信息Service接口
 * 
 * @author zty
 * @date 2022-12-25
 */
public interface IParentService 
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
     * 批量删除家长信息
     * 
     * @param userIds 需要删除的家长信息主键集合
     * @return 结果
     */
    public int deleteParentByUserIds(Long[] userIds);

    /**
     * 删除家长信息信息
     * 
     * @param userId 家长信息主键
     * @return 结果
     */
    public int deleteParentByUserId(Long userId);
}
