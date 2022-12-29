package com.zty.system.domain;

import com.zty.common.annotation.Excel;
import com.zty.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 学员家教信息对象 sys_parent
 * 
 * @author zty
 * @date 2022-12-25
 */
public class SysParent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 学员家教信息ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 学员所在地址 */
    @Excel(name = "学员所在地址")
    private String location;

    /** 学员详细背景 */
    @Excel(name = "学员详细背景")
    private String background;

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
    public void setBackground(String background) 
    {
        this.background = background;
    }

    public String getBackground() 
    {
        return background;
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
            .append("background", getBackground())
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
