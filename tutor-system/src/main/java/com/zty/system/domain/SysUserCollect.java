package com.zty.system.domain;

/**
 * 用户收藏关联 sys_user_collect
 * 
 * @author zty
 */
public class SysUserCollect
{
    /** 用户ID */
    private Long userId;

    /** 喜欢用户ID */
    private Long collectId;

    public SysUserCollect() {
    }

    public SysUserCollect(Long userId, Long collectId) {
        this.userId = userId;
        this.collectId = collectId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getCollectId() {
        return collectId;
    }

    public void setCollectId(Long collectId) {
        this.collectId = collectId;
    }

    @Override
    public String toString() {
        return "SysUserCollect{" +
                "userId=" + userId +
                ", collectId=" + collectId +
                '}';
    }
}
