package com.zty.system.service;

import java.util.List;
import com.zty.system.domain.SysUserLike;

/**
 * 用户点赞关联Service接口
 * 
 * @author zty
 * @date 2023-02-03
 */
public interface ISysUserLikeService 
{

    /**
     * 新增用户点赞关联
     * 
     * @param sysUserLike 用户点赞关联
     * @return 结果
     */
    public int insertSysUserLike(SysUserLike sysUserLike);

    /**
     * 删除用户点赞关联信息
     * 
     * @param userId 用户点赞关联主键
     * @return 结果
     */
    public int deleteSysUserLikeByUserId(Long userId);
}
