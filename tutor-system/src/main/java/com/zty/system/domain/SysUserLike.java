package com.zty.system.domain;

/**
 * 用户点赞关联 sys_user_like
 * 
 * @author zty
 */
public class SysUserLike
{
    /** 用户ID */
    private Long userId;

    /** 喜欢用户ID */
    private Long likeId;

    public SysUserLike() {
    }

    public SysUserLike(Long userId, Long likeId) {
        this.userId = userId;
        this.likeId = likeId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getLikeId() {
        return likeId;
    }

    public void setLikeId(Long likeId) {
        this.likeId = likeId;
    }

    @Override
    public String toString() {
        return "SysUserLike{" +
                "userId=" + userId +
                ", likeId=" + likeId +
                '}';
    }
}
