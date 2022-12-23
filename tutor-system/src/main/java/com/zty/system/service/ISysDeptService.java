package com.zty.system.service;

import java.util.List;
import com.zty.common.core.domain.TreeSelect;
import com.zty.common.core.domain.entity.SysDept;

/**
 * 职级管理 服务层
 * 
 * @author zty
 */
public interface ISysDeptService
{
    /**
     * 查询职级管理数据
     * 
     * @param dept 职级信息
     * @return 职级信息集合
     */
    public List<SysDept> selectDeptList(SysDept dept);

    /**
     * 查询职级树结构信息
     * 
     * @param dept 职级信息
     * @return 职级树信息集合
     */
    public List<TreeSelect> selectDeptTreeList(SysDept dept);

    /**
     * 构建前端所需要树结构
     * 
     * @param depts 职级列表
     * @return 树结构列表
     */
    public List<SysDept> buildDeptTree(List<SysDept> depts);

    /**
     * 构建前端所需要下拉树结构
     * 
     * @param depts 职级列表
     * @return 下拉树结构列表
     */
    public List<TreeSelect> buildDeptTreeSelect(List<SysDept> depts);

    /**
     * 根据角色ID查询职级树信息
     * 
     * @param roleId 角色ID
     * @return 选中职级列表
     */
    public List<Long> selectDeptListByRoleId(Long roleId);

    /**
     * 根据职级ID查询信息
     * 
     * @param deptId 职级ID
     * @return 职级信息
     */
    public SysDept selectDeptById(Long deptId);

    /**
     * 根据ID查询所有子职级（正常状态）
     * 
     * @param deptId 职级ID
     * @return 子职级数
     */
    public int selectNormalChildrenDeptById(Long deptId);

    /**
     * 是否存在职级子节点
     * 
     * @param deptId 职级ID
     * @return 结果
     */
    public boolean hasChildByDeptId(Long deptId);

    /**
     * 查询职级是否存在用户
     * 
     * @param deptId 职级ID
     * @return 结果 true 存在 false 不存在
     */
    public boolean checkDeptExistUser(Long deptId);

    /**
     * 校验职级名称是否唯一
     * 
     * @param dept 职级信息
     * @return 结果
     */
    public String checkDeptNameUnique(SysDept dept);

    /**
     * 校验职级是否有数据权限
     * 
     * @param deptId 职级id
     */
    public void checkDeptDataScope(Long deptId);

    /**
     * 新增保存职级信息
     * 
     * @param dept 职级信息
     * @return 结果
     */
    public int insertDept(SysDept dept);

    /**
     * 修改保存职级信息
     * 
     * @param dept 职级信息
     * @return 结果
     */
    public int updateDept(SysDept dept);

    /**
     * 删除职级管理信息
     * 
     * @param deptId 职级ID
     * @return 结果
     */
    public int deleteDeptById(Long deptId);
}
