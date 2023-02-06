package com.zty.system.service;

import com.zty.system.domain.Parent;
import com.zty.system.domain.vo.ParentVo;

import java.util.List;

/**
 * 学员信息Service接口
 * 
 * @author zty
 * @date 2022-12-25
 */
public interface IParentService 
{
    /**
     * 查询学员信息
     * 
     * @param userId 学员信息主键
     * @return 学员信息
     */
    public Parent selectParentByUserId(Long userId);

    /**
     * 查询学员信息列表
     * 
     * @param parent 学员信息
     * @return 学员信息集合
     */
    public List<ParentVo> selectParentList(Parent parent);

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
     * 批量删除学员信息
     * 
     * @param userIds 需要删除的学员信息主键集合
     * @return 结果
     */
    public int deleteParentByUserIds(Long[] userIds);

    /**
     * 删除学员信息信息
     * 
     * @param userId 学员信息主键
     * @return 结果
     */
    public int deleteParentByUserId(Long userId);

    /**
     * 获取认证状态
     */
    public int getAuthStatus(Long userId);
}
