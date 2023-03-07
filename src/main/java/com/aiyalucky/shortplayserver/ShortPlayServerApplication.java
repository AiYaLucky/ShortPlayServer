package com.aiyalucky.shortplayserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 * @author 小白上楼梯
 */
@SpringBootApplication
@EnableTransactionManagement
public class ShortPlayServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShortPlayServerApplication.class, args);
    }

}
