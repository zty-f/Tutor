package com.zty.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zty.common.annotation.Excel;
import com.zty.common.core.domain.BaseEntity;

/**
 * 用户押金操作信息对象 sys_deposit_detail
 * 
 * @author zty
 * @date 2023-02-16
 */
public class SysDepositDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户押金操作信息表ID */
    private Long id;

    /** 用户ID */
    private Long userId;

    /** 操作押金金额数量 */
    @Excel(name = "操作押金金额数量")
    private BigDecimal amount;

    /** 押金余额 */
    @Excel(name = "押金余额")
    private BigDecimal balance;

    /** 操作状态（0代表存钱 1代表取钱） */
    @Excel(name = "操作状态", readConverterExp = "0=代表存钱,1=代表取钱")
    private String action;

    public SysDepositDetail() {
    }

    public SysDepositDetail(Long userId, BigDecimal amount, BigDecimal balance, String action) {
        this.userId = userId;
        this.amount = amount;
        this.balance = balance;
        this.action = action;
    }

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
    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }
    public void setBalance(BigDecimal balance) 
    {
        this.balance = balance;
    }

    public BigDecimal getBalance() 
    {
        return balance;
    }
    public void setAction(String action) 
    {
        this.action = action;
    }

    public String getAction() 
    {
        return action;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("amount", getAmount())
            .append("balance", getBalance())
            .append("action", getAction())
            .append("createTime", getCreateTime())
            .toString();
    }
}
