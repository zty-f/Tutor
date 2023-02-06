package com.zty.common.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.TopicExchange;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @version V1.0
 * @ClassName: com.zty.seckill.config.RabbitMQConfig.java
 * @Copyright swpu
 * @author: zty-f
 * @date: 2023-02-06 15:16
 * @Description: 秒杀功能使用的RabbitMQ配置类
 */
@Configuration
public class RabbitMQConfig {
    private static final String QUEUE = "authQueue";
    private static final String EXCHANGE = "authExchange";
    @Bean
    public Queue queue(){
        return new Queue(QUEUE);
    }

    @Bean
    public TopicExchange topicExchange(){
        return new TopicExchange(EXCHANGE);
    }

    @Bean
    public Binding binding(){
        return BindingBuilder.bind(queue()).to(topicExchange()).with("auth.#");
    }
}
