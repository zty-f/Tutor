package com.zty.system.domain;

import com.zty.common.annotation.Excel;
import com.zty.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 学生家教信息对象 sys_student
 * 
 * @author zty
 * @date 2022-12-25
 */
public class SysStudent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学生家教信息ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 学生所在地址 */
    @Excel(name = "学生所在地址")
    private String location;

    /** 所在高校 */
    @Excel(name = "所在高校")
    private String university;

    /** 专业 */
    @Excel(name = "专业")
    private String major;

    /** 学生详细背景 */
    @Excel(name = "学生详细背景")
    private String background;

    /** 授课方式（0老师上门 1学生上门 2线上辅导） */
    @Excel(name = "授课方式", readConverterExp = "0=老师上门,1=学生上门,2=线上辅导")
    private String teachWay;

    /** 认证状态（0代表未认证 1表示已认证） */
    @Excel(name = "认证状态", readConverterExp = "0=代表未认证,1=表示已认证")
    private String authStatus;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setLocation(String location) 
    {
        this.location = location;
    }

    public String getLocation() 
    {
        return location;
    }
    public void setUniversity(String university) 
    {
        this.university = university;
    }

    public String getUniversity() 
    {
        return university;
    }
    public void setMajor(String major) 
    {
        this.major = major;
    }

    public String getMajor() 
    {
        return major;
    }
    public void setBackground(String background) 
    {
        this.background = background;
    }

    public String getBackground() 
    {
        return background;
    }
    public void setTeachWay(String teachWay) 
    {
        this.teachWay = teachWay;
    }

    public String getTeachWay() 
    {
        return teachWay;
    }
    public void setAuthStatus(String authStatus) 
    {
        this.authStatus = authStatus;
    }

    public String getAuthStatus() 
    {
        return authStatus;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("location", getLocation())
            .append("university", getUniversity())
            .append("major", getMajor())
            .append("background", getBackground())
            .append("teachWay", getTeachWay())
            .append("authStatus", getAuthStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
