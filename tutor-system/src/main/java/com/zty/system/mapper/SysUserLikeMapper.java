package com.zty.system.mapper;

import com.zty.system.domain.SysUserCollect;
import com.zty.system.domain.SysUserLike;

import java.util.List;

public interface SysUserLikeMapper {

    /**
     * 新增用户点赞关联
     *
     * @param sysUserLike 用户点赞关联
     * @return 结果
     */
    public int insertSysUserLike(SysUserLike sysUserLike);

    /**
     * 删除用户点赞关联
     *
     * @param userId 用户点赞关联主键
     * @return 结果
     */
    public int deleteSysUserLikeByUserId(Long userId);
}
