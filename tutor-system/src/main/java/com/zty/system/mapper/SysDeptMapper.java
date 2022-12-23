package com.zty.system.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.zty.common.core.domain.entity.SysDept;

/**
 * 职级管理 数据层
 * 
 * @author zty
 */
public interface SysDeptMapper
{
    /**
     * 查询职级管理数据
     * 
     * @param dept 职级信息
     * @return 职级信息集合
     */
    public List<SysDept> selectDeptList(SysDept dept);

    /**
     * 根据角色ID查询职级树信息
     * 
     * @param roleId 角色ID
     * @param deptCheckStrictly 职级树选择项是否关联显示
     * @return 选中职级列表
     */
    public List<Long> selectDeptListByRoleId(@Param("roleId") Long roleId, @Param("deptCheckStrictly") boolean deptCheckStrictly);

    /**
     * 根据职级ID查询信息
     * 
     * @param deptId 职级ID
     * @return 职级信息
     */
    public SysDept selectDeptById(Long deptId);

    /**
     * 根据ID查询所有子职级
     * 
     * @param deptId 职级ID
     * @return 职级列表
     */
    public List<SysDept> selectChildrenDeptById(Long deptId);

    /**
     * 根据ID查询所有子职级（正常状态）
     * 
     * @param deptId 职级ID
     * @return 子职级数
     */
    public int selectNormalChildrenDeptById(Long deptId);

    /**
     * 是否存在子节点
     * 
     * @param deptId 职级ID
     * @return 结果
     */
    public int hasChildByDeptId(Long deptId);

    /**
     * 查询职级是否存在用户
     * 
     * @param deptId 职级ID
     * @return 结果
     */
    public int checkDeptExistUser(Long deptId);

    /**
     * 校验职级名称是否唯一
     * 
     * @param deptName 职级名称
     * @param parentId 父职级ID
     * @return 结果
     */
    public SysDept checkDeptNameUnique(@Param("deptName") String deptName, @Param("parentId") Long parentId);

    /**
     * 新增职级信息
     * 
     * @param dept 职级信息
     * @return 结果
     */
    public int insertDept(SysDept dept);

    /**
     * 修改职级信息
     * 
     * @param dept 职级信息
     * @return 结果
     */
    public int updateDept(SysDept dept);

    /**
     * 修改所在职级正常状态
     * 
     * @param deptIds 职级ID组
     */
    public void updateDeptStatusNormal(Long[] deptIds);

    /**
     * 修改子元素关系
     * 
     * @param depts 子元素
     * @return 结果
     */
    public int updateDeptChildren(@Param("depts") List<SysDept> depts);

    /**
     * 删除职级管理信息
     * 
     * @param deptId 职级ID
     * @return 结果
     */
    public int deleteDeptById(Long deptId);
}
