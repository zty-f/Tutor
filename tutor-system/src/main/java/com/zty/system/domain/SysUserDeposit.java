package com.zty.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zty.common.annotation.Excel;
import com.zty.common.core.domain.BaseEntity;

/**
 * 用户押金信息对象 sys_user_deposit
 * 
 * @author zty
 * @date 2023-02-16
 */
public class SysUserDeposit extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户押金信息表ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 押金余额 */
    @Excel(name = "押金余额")
    private BigDecimal balance;

    /** 交易密码 */
    private String password;

    /** 余额状态（0代表可用 1代表冻结） */
    @Excel(name = "余额状态", readConverterExp = "0=代表可用,1=代表冻结")
    private String status;

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
    public void setBalance(BigDecimal balance) 
    {
        this.balance = balance;
    }

    public BigDecimal getBalance() 
    {
        return balance;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("balance", getBalance())
            .append("password", getPassword())
            .append("status", getStatus())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
