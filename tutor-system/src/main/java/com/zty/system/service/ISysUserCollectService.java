package com.zty.system.service;

import java.util.List;
import com.zty.system.domain.SysUserCollect;

/**
 * 用户收藏关联Service接口
 * 
 * @author zty
 * @date 2023-02-04
 */
public interface ISysUserCollectService 
{
    /**
     * 查询用户收藏关联
     */
    public boolean selectSysUserCollectByUserIdAndCollectId(Long userId, Long collectId);

    /**
     * 查询用户收藏获取数量
     */
    public int selectSysUserCollectNum(Long userId);

    /**
     * 查询用户收藏列表id
     */
    public List<Long> selectSysUserCollectIds(Long userId);

    /**
     * 新增用户收藏关联
     *
     * @param sysUserCollect 用户收藏关联
     * @return 结果
     */
    public int insertSysUserCollect(SysUserCollect sysUserCollect);


    /**
     * 删除用户收藏关联
     *
     * @param userId 用户收藏关联主键
     * @return 结果
     */
    public int deleteSysUserCollect(SysUserCollect sysUserCollect);
}
