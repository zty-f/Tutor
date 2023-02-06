package com.zty.common.utils.rabbitmq;

import com.zty.common.utils.http.HttpUtils;
import com.zty.common.utils.mail.Sendmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * @version V1.0
 * @ClassName: com.zty.seckill.rabbitmq.MQReceiver.java
 * @Copyright swpu
 * @author: zty-f
 * @date: 2022-03-26 20:22
 * @Description: 消息接收者
 */
@Service
public class MQReceiver {

    private static final Logger log = LoggerFactory.getLogger(HttpUtils.class);

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * @MethodName:  receiverAuthMessage
     * @Param msg
     * @Return void
     * @Exception
     * @author: zty-f
     * @date:  2023-02-06 15:40
     * @Description: 获取认证消息发送邮件
     * **/
    @RabbitListener(queues = "authQueue")
    public void receiverAuthMessage(String msg){
        log.info("接收到的认证消息："+msg);
        // 组装发送邮件~
        //我们使用线程来专门发送邮件，防止出现耗时，和网站注册人数过多的情况；
        Sendmail send = new Sendmail(msg);
        //启动线程，线程启动之后就会执行run方法来发送邮件
        send.start();
    }
}
