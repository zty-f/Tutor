package com.zty.system.mapper;

import java.util.List;
import com.zty.system.domain.SysRoleDept;

/**
 * 角色与职级关联表 数据层
 * 
 * @author zty
 */
public interface SysRoleDeptMapper
{
    /**
     * 通过角色ID删除角色和职级关联
     * 
     * @param roleId 角色ID
     * @return 结果
     */
    public int deleteRoleDeptByRoleId(Long roleId);

    /**
     * 批量删除角色职级关联信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteRoleDept(Long[] ids);

    /**
     * 查询职级使用数量
     * 
     * @param deptId 职级ID
     * @return 结果
     */
    public int selectCountRoleDeptByDeptId(Long deptId);

    /**
     * 批量新增角色职级信息
     * 
     * @param roleDeptList 角色职级列表
     * @return 结果
     */
    public int batchRoleDept(List<SysRoleDept> roleDeptList);
}
