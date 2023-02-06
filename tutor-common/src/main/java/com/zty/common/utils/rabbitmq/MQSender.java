package com.zty.common.utils.rabbitmq;
import com.zty.common.utils.LogUtils;
import com.zty.common.utils.http.HttpUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @version V1.0
 * @ClassName: com.zty.seckill.rabbitmq.MQSender.java
 * @Copyright swpu
 * @author: zty-f
 * @date: 2022-03-26 20:17
 * @Description: 消息发送者
 */
@Service
public class MQSender{

    private static final Logger log = LoggerFactory.getLogger(HttpUtils.class);
    @Autowired
    private RabbitTemplate rabbitTemplate;


    /**
     * @MethodName:  sendAuthMessage
     * @Param message
     * @Return void
     * @Exception
     * @author: zty-f
     * @date:  2023-02-6 15:24
     * @Description: 发送认证消息
     * **/
    public void sendAuthMessage(String message) throws Exception{
        log.info("发送认证消息："+message);
        rabbitTemplate.convertAndSend("authExchange","auth.message",message);
    }
}
