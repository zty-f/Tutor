package com.zty.system.mapper;

import com.zty.system.domain.SysUserLike;

import java.util.List;

public interface SysUserLikeMapper {

    /**
     * 查询用户点赞关联
     */
    public int selectSysUserLikeByUserIdAndLikeId(SysUserLike sysUserLike);

    /**
     * 查询用户点赞获取数量
     */
    public int selectSysUserLikeNum(Long userId);

    /**
     * 查询用户喜欢列表id
     */
    public List<Long> selectSysUserLikeIds(Long userId);

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
    public int deleteSysUserLike(SysUserLike sysUserLike);
}
