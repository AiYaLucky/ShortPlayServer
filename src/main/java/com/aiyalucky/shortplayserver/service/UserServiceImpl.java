package com.aiyalucky.shortplayserver.service;

import com.aiyalucky.shortplayserver.dao.User;
import com.aiyalucky.shortplayserver.mapper.UserMapper;
import com.aiyalucky.shortplayserver.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: xu xiao wei
 * @Date: 2023/2/19 15:32
 * @Version 1.0
 * Created by IntelliJ IDEA.
 */
@Service
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;

    @Autowired
    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    public User login(String account, String password) {
        User user = userMapper.findByUsername(account);
        if (user != null && password.equals(user.getPassword())) {
            return user;
        }
        return null;
    }

    public int register(User user) {
        return userMapper.insert(user);
    }
}
