package com.zty.common.core.domain.model;

import com.zty.common.annotation.Excel;

import java.util.List;

/**
 * 用户注册对象
 * 
 * @author zty
 */
public class RegisterBody extends LoginBody
{
    /** 职级ID */
    @Excel(name = "职级ID")
    private Long deptId;

    /** 岗位 */
    private List<Long> postIds;

    /*判断注册角色为学生还是学员*/
    private boolean parentRegister;

    /** 用户邮箱 */
    @Excel(name = "用户邮箱")
    private String email;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String phonenumber;

    /** 用户性别（0男 1女 2未知） */
    @Excel(name = "用户性别", readConverterExp = "0=男,1=女,2=未知")
    private String sex;

    /** 头像地址 */
    @Excel(name = "头像地址")
    private String avatar;

    /** 学生所在地址 */
    @Excel(name = "学生所在地址")
    private String location;

    /** 所在高校 */
    @Excel(name = "所在高校")
    private String university;

    /** 专业 */
    @Excel(name = "专业")
    private String major;

    /** 详细背景 */
    @Excel(name = "学生详细背景")
    private String background;

    /** 薪资 */
    @Excel(name = "薪资待遇")
    private String salaryExpect;

    /** 授课方式（0老师上门 1学生上门 2线上辅导） */
    @Excel(name = "授课方式", readConverterExp = "0=老师上门,1=学生上门,2=线上辅导")
    private String teachWay;

    public List<Long> getPostIds() {
        return postIds;
    }

    public void setPostIds(List<Long> postIds) {
        this.postIds = postIds;
    }

    public boolean getParentRegister() {
        return parentRegister;
    }

    public void setParentRegister(boolean parentRegister) {
        this.parentRegister = parentRegister;
    }

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getBackground() {
        return background;
    }

    public void setBackground(String background) {
        this.background = background;
    }

    public String getTeachWay() {
        return teachWay;
    }

    public void setTeachWay(String teachWay) {
        this.teachWay = teachWay;
    }

    public String getSalaryExpect() {
        return salaryExpect;
    }

    public void setSalaryExpect(String salaryExpect) {
        this.salaryExpect = salaryExpect;
    }

    @Override
    public String toString() {
        return "RegisterBody{" +
                "deptId=" + deptId +
                ", postIds=" + postIds +
                ", parentRegister=" + parentRegister +
                ", email='" + email + '\'' +
                ", phonenumber='" + phonenumber + '\'' +
                ", sex='" + sex + '\'' +
                ", avatar='" + avatar + '\'' +
                ", location='" + location + '\'' +
                ", university='" + university + '\'' +
                ", major='" + major + '\'' +
                ", background='" + background + '\'' +
                ", salaryExpect='" + salaryExpect + '\'' +
                ", teachWay='" + teachWay + '\'' +
                '}';
    }
}
