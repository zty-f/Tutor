package com.zty.system.domain.vo;

import com.zty.common.annotation.Excel;

/**
 * @version V1.0
 * @ClassName: com.zty.system.domain.vo.AuthVo.java
 * @Copyright swpu
 * @author: zty-f
 * @date: 2023-02-06 16:19
 * @Description: 在线认证消息传输结构体
 */
public class AuthVo {
    /** 用户ID */
    private Long userId;

    /** 用户角色 */
    private String role;

    /** 用户邮箱 */
    private String email;

    /** 手机号码 */
    private String phonenumber;

    /** 用户真实姓名 */
    private String trueName;

    /** 用户身份证号码 */
    private String idCard;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
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

    public String getTrueName() {
        return trueName;
    }

    public void setTrueName(String trueName) {
        this.trueName = trueName;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    @Override
    public String toString() {
        return "认证人信息：{" + "\n"+
                "用户ID=" + userId + "\n"+
                "用户角色=" + role + "\n"+
                "用户邮箱=" + email + '\n' +
                "用户电话=" + phonenumber + '\n' +
                "用户真实姓名=" + trueName + '\n' +
                "用户身份证号=" + idCard + '\n' +
                '}'+"\n"+
                "请尽快前往系统对该用户信息进行认证~~~~";
    }
}
