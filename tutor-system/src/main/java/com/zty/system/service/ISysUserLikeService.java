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
     * 查询用户点赞关联
     */
    public boolean selectSysUserLikeByUserIdAndLikeId(Long userId, Long likeId);

    /**
     * 查询用户获赞数量
     */
    public int selectSysUserLikeNum(Long userId);

    /**
     * 查询用户喜欢列表id
     */
    public List<Long> selectSysUserLikeIds(Long userId);

    /**
     * 查询用户粉丝列表id
     */
    public List<Long> selectSysUserFansIds(Long userId);

    /**
     * 新增用户点赞关联
     * 
     * @param sysUserLike 用户点赞关联
     * @return 结果
     */
    public int insertSysUserLike(SysUserLike sysUserLike);

    /**
     * 删除用户点赞关联信息
     */
    public int deleteSysUserLike(SysUserLike sysUserLike);
}
