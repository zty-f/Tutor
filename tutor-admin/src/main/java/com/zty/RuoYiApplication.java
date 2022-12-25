package com.zty;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author zty
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class RuoYiApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  系统启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                "  _____            _                     \n" +
                " |_   _|  _  _    | |_     ___      _ _  \n" +
                "   | |   | || |   |  _|   / _ \\    | '_| \n" +
                "  _|_|_   \\_,_|   _\\__|   \\___/   _|_|_  \n" +
                "_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"|_|\"\"\"\"\"| \n" +
                "\"`-$-$-'\"`-$-$-'\"`-*-*-'\"`-$-$-'\"`-$-$-' ");
    }
}
