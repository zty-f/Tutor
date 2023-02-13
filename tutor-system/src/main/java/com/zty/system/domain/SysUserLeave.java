package com.zty.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zty.common.annotation.Excel;
import com.zty.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 用户留言信息对象 sys_user_leave
 * 
 * @author zty
 * @date 2023-02-13
 */
public class SysUserLeave
{

    /** 留言信息表ID */
    private Long id;

    /** 留言用户ID */
    @Excel(name = "留言用户ID")
    private Long sendId;

    /** 留言用户账户名 */
    @Excel(name = "留言用户账户名")
    private String sendUsername;

    /** 被留言用户id */
    @Excel(name = "被留言用户id")
    private Long receivedId;

    /** 被留言用户账户名 */
    @Excel(name = "被留言用户账户名")
    private String receivedUsername;

    /** 留言内容 */
    @Excel(name = "留言内容")
    private String context;

    /** 读取状态（0代表未读 2代表已读） */
    @Excel(name = "读取状态", readConverterExp = "0=代表未读,2=代表已读")
    private String status;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date createTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setSendId(Long sendId) 
    {
        this.sendId = sendId;
    }

    public Long getSendId() 
    {
        return sendId;
    }
    public void setSendUsername(String sendUsername) 
    {
        this.sendUsername = sendUsername;
    }

    public String getSendUsername() 
    {
        return sendUsername;
    }
    public void setReceivedId(Long receivedId) 
    {
        this.receivedId = receivedId;
    }

    public Long getReceivedId() 
    {
        return receivedId;
    }
    public void setReceivedUsername(String receivedUsername) 
    {
        this.receivedUsername = receivedUsername;
    }

    public String getReceivedUsername() 
    {
        return receivedUsername;
    }
    public void setContext(String context) 
    {
        this.context = context;
    }

    public String getContext() 
    {
        return context;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("sendId", getSendId())
            .append("sendUsername", getSendUsername())
            .append("receivedId", getReceivedId())
            .append("receivedUsername", getReceivedUsername())
            .append("context", getContext())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .toString();
    }
}
