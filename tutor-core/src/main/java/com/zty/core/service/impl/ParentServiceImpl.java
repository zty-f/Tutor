package com.zty.core.service.impl;

import java.util.List;
import com.zty.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import com.zty.common.utils.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.zty.core.domain.SysParent;
import com.zty.core.mapper.ParentMapper;
import com.zty.core.domain.Parent;
import com.zty.core.service.IParentService;

/**
 * 学员信息Service业务层处理
 * 
 * @author zty
 * @date 2022-12-25
 */
@Service
public class ParentServiceImpl implements IParentService 
{
    @Autowired
    private ParentMapper parentMapper;

    /**
     * 查询学员信息
     * 
     * @param userId 学员信息主键
     * @return 学员信息
     */
    @Override
    public Parent selectParentByUserId(Long userId)
    {
        return parentMapper.selectParentByUserId(userId);
    }

    /**
     * 查询学员信息列表
     * 
     * @param parent 学员信息
     * @return 学员信息
     */
    @Override
    public List<Parent> selectParentList(Parent parent)
    {
        return parentMapper.selectParentList(parent);
    }

    /**
     * 新增学员信息
     * 
     * @param parent 学员信息
     * @return 结果
     */
    @Transactional
    @Override
    public int insertParent(Parent parent)
    {
        parent.setCreateTime(DateUtils.getNowDate());
        int rows = parentMapper.insertParent(parent);
        insertSysParent(parent);
        return rows;
    }

    /**
     * 修改学员信息
     * 
     * @param parent 学员信息
     * @return 结果
     */
    @Transactional
    @Override
    public int updateParent(Parent parent)
    {
        parent.setUpdateTime(DateUtils.getNowDate());
        parentMapper.deleteSysParentByUserId(parent.getUserId());
        insertSysParent(parent);
        return parentMapper.updateParent(parent);
    }

    /**
     * 批量删除学员信息
     * 
     * @param userIds 需要删除的学员信息主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteParentByUserIds(Long[] userIds)
    {
        parentMapper.deleteSysParentByUserIds(userIds);
        return parentMapper.deleteParentByUserIds(userIds);
    }

    /**
     * 删除学员信息信息
     * 
     * @param userId 学员信息主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteParentByUserId(Long userId)
    {
        parentMapper.deleteSysParentByUserId(userId);
        return parentMapper.deleteParentByUserId(userId);
    }

    /**
     * 新增学员家教信息信息
     * 
     * @param parent 学员信息对象
     */
    public void insertSysParent(Parent parent)
    {
        SysParent sysParent = parent.getSysParent();
        Long userId = parent.getUserId();
        if (StringUtils.isNotNull(sysParent)){
            sysParent.setUserId(userId);
            sysParent.setCreateTime(DateUtils.getNowDate());
            parentMapper.batchSysParent(sysParent);
        }
    }
}
