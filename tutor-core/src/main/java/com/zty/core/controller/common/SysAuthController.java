package com.zty.core.controller.common;

import com.zty.common.annotation.Log;
import com.zty.common.constant.HttpStatus;
import com.zty.common.core.domain.AjaxResult;
import com.zty.common.enums.BusinessType;
import com.zty.common.exception.ServiceException;
import com.zty.common.utils.rabbitmq.MQSender;
import com.zty.system.domain.vo.AuthVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @version V1.0
 * @ClassName: com.zty.core.controller.common.SysAuthController.java
 * @Copyright swpu
 * @author: zty-f
 * @date: 2023-02-06 16:18
 * @Description: 认证接口
 */

@RestController
@RequestMapping("/onlineAuth")
public class SysAuthController {

    @Autowired
    private MQSender mqSender;

    @Log(title = "用户在线认证", businessType = BusinessType.OTHER)
    @PostMapping
    public AjaxResult onlineAuth(@RequestBody AuthVo authVo){
        String msg = authVo.toString();
        try {
            mqSender.sendAuthMessage(msg);
        } catch (Exception e) {
            throw new ServiceException("系统错误导致认证出错，请稍后重新认证~", HttpStatus.ERROR);
        }
        return AjaxResult.success("认证申请已发送，请耐心等待~");
    }
}
