package com.aiyalucky.shortplayserver.service.impl;

import com.aiyalucky.shortplayserver.dao.User;
import com.aiyalucky.shortplayserver.mapper.UserMapper;
import com.aiyalucky.shortplayserver.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Author xu xiao wei
 * @ClassName UserServiceImpl
 * @Package com.aiyalucky.shortplayserver.service.impl
 * @Date 2023/3/2 22:33
 * @Version 1.0
 */
@Service
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;

    @Autowired
    public UserServiceImpl(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    @Transactional
    public User login(String account, String password) {
        User user = userMapper.findByUsername(account);
        if (user != null && password.equals(user.getPassword())) {
            return user;
        }
        return null;
    }
    @Override
    @Transactional
    public int register(User user) {
        return userMapper.insert(user);
    }
}
