package com.aiyalucky.shortplayserver.service.impl;

import com.aiyalucky.shortplayserver.dao.AdminUser;
import com.aiyalucky.shortplayserver.mapper.AdminUserMapper;
import com.aiyalucky.shortplayserver.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author 小白上楼梯
 * @description 针对表【admin_user】的数据库操作Service实现
 * @createDate 2023-03-08 18:20:41
 */
@Service
public class AdminUserServiceImpl implements AdminUserService {
    private final AdminUserMapper adminUserMapper;
    private static ConcurrentHashMap<String, AdminUser> adminUserConcurrentHashMap;

    {
        adminUserConcurrentHashMap = new ConcurrentHashMap<>();
    }

    @Autowired
    public AdminUserServiceImpl(AdminUserMapper adminUserMapper) {
        this.adminUserMapper = adminUserMapper;
//        List<AdminUser> adminUserList = this.adminUserMapper.selectAll();  //没有创建表，先不做数据
//        for (AdminUser adminUser : adminUserList) {
//            adminUserConcurrentHashMap.put(adminUser.getUsername(), adminUser);
//        }
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public AdminUser login(String username, String password) {
        AdminUser adminUser = null;
        if (!adminUserConcurrentHashMap.containsKey(username)) {
            adminUser = adminUserMapper.selectByName(username);
            adminUserConcurrentHashMap.put(adminUser.getUsername(), adminUser);
        } else {
            adminUser = adminUserConcurrentHashMap.get(username);
        }
        return adminUser;
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public int register(AdminUser user) {
        return 0;
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    public List<AdminUser> selectAll() {
        return adminUserMapper.selectAll();
    }
}
