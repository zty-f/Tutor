package com.zty.system.service.impl;

import com.zty.common.core.domain.entity.SysDept;
import com.zty.common.utils.DateUtils;
import com.zty.common.utils.StringUtils;
import com.zty.system.domain.Parent;
import com.zty.system.domain.SysParent;
import com.zty.system.domain.vo.ParentVo;
import com.zty.system.mapper.*;
import com.zty.system.service.IParentService;
import com.zty.system.service.ISysDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

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

    @Autowired
    private SysDeptMapper deptMapper;

    @Autowired
    private SysRoleMapper roleMapper;

    @Autowired
    private SysPostMapper postMapper;

    @Autowired
    private SysUserRoleMapper userRoleMapper;

    @Autowired
    private SysUserPostMapper userPostMapper;
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
    public List<ParentVo> selectParentList(Parent parent)
    {
        List<Parent> parents = parentMapper.selectParentList(parent);
        List<ParentVo> res = new ArrayList<>();
        Long selectDeptId = parent.getDeptId();
        for (Parent p : parents) {
            if (selectDeptId!=null&&p.getDeptId()<selectDeptId)continue;
            ParentVo parentVo = new ParentVo(p);
            parentVo.setDeptName(deptMapper.selectDeptById(p.getDeptId()).getDeptName());
            parentVo.setRoleName(roleMapper.selectRolePermissionByUserId(p.getUserId()).get(0).getRoleName());
            parentVo.setPosts(postMapper.selectPostsByUserId(p.getUserId()));
            res.add(parentVo);
        }
        return res;
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
        // 删除用户与角色关联
        userRoleMapper.deleteUserRole(userIds);
        // 删除用户与岗位关联
        userPostMapper.deleteUserPost(userIds);
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
        // 删除用户与角色关联
        userRoleMapper.deleteUserRoleByUserId(userId);
        // 删除用户与岗位表
        userPostMapper.deleteUserPostByUserId(userId);
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
