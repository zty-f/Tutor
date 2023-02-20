package com.zty.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zty.common.annotation.Excel;
import com.zty.common.core.domain.BaseEntity;

/**
 * 用户下单信息对象 sys_user_order
 * 
 * @author zty
 * @date 2023-02-16
 */
public class SysUserOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户下单信息表ID */
    private Long id;

    /** 大学生用户ID */
    @Excel(name = "大学生用户ID")
    private Long studentId;

    /** 家长（学员）用户ID */
    @Excel(name = "家长", readConverterExp = "学=员")
    private Long parentId;

    /** 订单大学生方状态（0代表初始 1代表确认 2代表取消 3代表完成 4代表违约中） */
    @Excel(name = "订单状态", readConverterExp = "0=代表初始,1=代表确认,2=代表取消,3=代表完成,4=代表违约中")
    private String studentStatus;

    /** 订单学员方状态（0代表初始 1代表确认 2代表取消 3代表完成 4代表违约中） */
    @Excel(name = "订单状态", readConverterExp = "0=代表初始,1=代表确认,2=代表取消,3=代表完成,4=代表违约中")
    private String parentStatus;

    /** 订单金额 */
    @Excel(name = "订单金额")
    private BigDecimal amount;

    /** 订单双方约定 */
    @Excel(name = "订单双方约定")
    private String promise;

    /** 订单总状态（0代表大学生发起 1代表家长(学员)发起） 2代表管理员发起 */
    @Excel(name = "订单总状态", readConverterExp = "0=代表大学生发起,1=代表家长(学员)发起,2=代表管理员发起")
    private String status;

    /** 下单时间 */
    private Date orderTime;

    private boolean openConfirm;

    private boolean openCancel;

    private boolean openFinish;

    private boolean openLegal;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setStudentId(Long studentId) 
    {
        this.studentId = studentId;
    }

    public Long getStudentId() 
    {
        return studentId;
    }
    public void setParentId(Long parentId) 
    {
        this.parentId = parentId;
    }

    public Long getParentId() 
    {
        return parentId;
    }
    public void setStudentStatus(String studentStatus) 
    {
        this.studentStatus = studentStatus;
    }

    public String getStudentStatus() 
    {
        return studentStatus;
    }
    public void setParentStatus(String parentStatus) 
    {
        this.parentStatus = parentStatus;
    }

    public String getParentStatus() 
    {
        return parentStatus;
    }
    public void setAmount(BigDecimal amount) 
    {
        this.amount = amount;
    }

    public BigDecimal getAmount() 
    {
        return amount;
    }
    public void setPromise(String promise) 
    {
        this.promise = promise;
    }

    public String getPromise() 
    {
        return promise;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setOrderTime(Date orderTime) 
    {
        this.orderTime = orderTime;
    }

    public Date getOrderTime() 
    {
        return orderTime;
    }

    public boolean isOpenConfirm() {
        return openConfirm;
    }

    public void setOpenConfirm(boolean openConfirm) {
        this.openConfirm = openConfirm;
    }

    public boolean isOpenCancel() {
        return openCancel;
    }

    public void setOpenCancel(boolean openCancel) {
        this.openCancel = openCancel;
    }

    public boolean isOpenFinish() {
        return openFinish;
    }

    public void setOpenFinish(boolean openFinish) {
        this.openFinish = openFinish;
    }

    public boolean isOpenLegal() {
        return openLegal;
    }

    public void setOpenLegal(boolean openLegal) {
        this.openLegal = openLegal;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("studentId", getStudentId())
            .append("parentId", getParentId())
            .append("studentStatus", getStudentStatus())
            .append("parentStatus", getParentStatus())
            .append("amount", getAmount())
            .append("promise", getPromise())
            .append("status", getStatus())
            .append("orderTime", getOrderTime())
            .append("isOpenConfirm", isOpenConfirm())
            .append("isOpenCancel", isOpenCancel())
            .append("isOpenFinish", isOpenFinish())
            .append("isOpenLegal", isOpenLegal())
            .toString();
    }
}
