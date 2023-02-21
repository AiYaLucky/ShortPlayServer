package com.aiyalucky.shortplayserver.service.impl;


import com.aiyalucky.shortplayserver.dao.User;

/**
 * @Author: xu xiao wei
 * @Date: 2023/2/20 23:21
 * @Version 1.0
 * Created by IntelliJ IDEA.
 */
public interface UserService {
    User login(String account, String password);

    int register(User user);
}
