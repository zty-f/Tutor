package com.zty.system.service;

import java.util.List;
import com.zty.system.domain.SysDepositDetail;

/**
 * 用户押金操作信息Service接口
 * 
 * @author zty
 * @date 2023-02-16
 */
public interface ISysDepositDetailService 
{
    /**
     * 查询用户押金操作信息
     * 
     * @param id 用户押金操作信息主键
     * @return 用户押金操作信息
     */
    public SysDepositDetail selectSysDepositDetailById(Long id);

    /**
     * 查询用户押金操作信息列表
     * 
     * @param sysDepositDetail 用户押金操作信息
     * @return 用户押金操作信息集合
     */
    public List<SysDepositDetail> selectSysDepositDetailList(SysDepositDetail sysDepositDetail);

    /**
     * 新增用户押金操作信息
     * 
     * @param sysDepositDetail 用户押金操作信息
     * @return 结果
     */
    public int insertSysDepositDetail(SysDepositDetail sysDepositDetail);

    /**
     * 修改用户押金操作信息
     * 
     * @param sysDepositDetail 用户押金操作信息
     * @return 结果
     */
    public int updateSysDepositDetail(SysDepositDetail sysDepositDetail);

    /**
     * 批量删除用户押金操作信息
     * 
     * @param ids 需要删除的用户押金操作信息主键集合
     * @return 结果
     */
    public int deleteSysDepositDetailByIds(Long[] ids);

    /**
     * 删除用户押金操作信息信息
     * 
     * @param id 用户押金操作信息主键
     * @return 结果
     */
    public int deleteSysDepositDetailById(Long id);
}
