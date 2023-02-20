package com.zty.system.domain.vo;

import com.zty.common.annotation.Excel;
import com.zty.system.domain.Parent;

import java.util.List;

/**
 * @version V1.0
 * @ClassName: com.zty.system.domain.vo.ParentVo.java
 * @Copyright swpu
 * @author: zty-f
 * @date: 2022-12-29 15:47
 * @Description: 学员信息数据传输对象
 */
public class ParentVo {
    private static final long serialVersionUID = 1L;

    /** 职级*/
    @Excel(name = "职级")
    private String deptName;

    /** 岗位 */
    private List<String> posts;

    /** 角色*/
    @Excel(name = "角色")
    private String roleName;

    private boolean isLike;

    private boolean isCollect;

    private int likeNum;

    private int collectNum;

    private String authStatus;

    /** 学员信息 */
    private Parent parent;

    public ParentVo() {
    }

    public ParentVo(Parent parent) {
        this.parent = parent;
    }

    public ParentVo(String deptName, List<String> posts, String roleName, Parent parent) {
        this.deptName = deptName;
        this.posts = posts;
        this.roleName = roleName;
        this.parent = parent;
    }

    public String getAuthStatus() {
        return authStatus;
    }

    public void setAuthStatus(String authStatus) {
        this.authStatus = authStatus;
    }

    public boolean isLike() {
        return isLike;
    }

    public void setLike(boolean like) {
        isLike = like;
    }

    public boolean isCollect() {
        return isCollect;
    }

    public void setCollect(boolean collect) {
        isCollect = collect;
    }

    public int getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(int likeNum) {
        this.likeNum = likeNum;
    }

    public int getCollectNum() {
        return collectNum;
    }

    public void setCollectNum(int collectNum) {
        this.collectNum = collectNum;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public List<String> getPosts() {
        return posts;
    }

    public void setPosts(List<String> posts) {
        this.posts = posts;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Parent getParent() {
        return parent;
    }

    public void setParent(Parent parent) {
        this.parent = parent;
    }

    @Override
    public String toString() {
        return "ParentVo{" +
                "deptName='" + deptName + '\'' +
                ", posts=" + posts +
                ", roleName='" + roleName + '\'' +
                ", isLike=" + isLike +
                ", isCollect=" + isCollect +
                ", likeNum=" + likeNum +
                ", collectNum=" + collectNum +
                ", authStatus='" + authStatus + '\'' +
                ", parent=" + parent +
                '}';
    }
}
