package com.aiyalucky.shortplayserver.service.impl;

import com.aiyalucky.shortplayserver.dao.AdminUser;
import com.aiyalucky.shortplayserver.dao.User;
import com.aiyalucky.shortplayserver.mapper.AdminUserMapper;
import com.aiyalucky.shortplayserver.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
* @author 小白上楼梯
* @description 针对表【admin_user】的数据库操作Service实现
* @createDate 2023-03-08 18:20:41
*/
@Service
public class AdminUserServiceImpl implements AdminUserService{
    private final AdminUserMapper adminUserMapper;

    @Autowired
    public AdminUserServiceImpl(AdminUserMapper adminUserMapper) {
        this.adminUserMapper = adminUserMapper;
    }

    @Override
    @Transactional
    public AdminUser login(String account, String password) {
        return null;
    }

    @Override
    @Transactional
    public int register(AdminUser user) {
        return 0;
    }
}
