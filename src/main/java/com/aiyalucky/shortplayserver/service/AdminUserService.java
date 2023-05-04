package com.aiyalucky.shortplayserver.service;


import com.aiyalucky.shortplayserver.dao.AdminUser;

import java.util.List;

/**
* @author 小白上楼梯
* @description 针对表【admin_user】的数据库操作Service
* @createDate 2023-03-08 18:20:41
*/
public interface AdminUserService {

    AdminUser login(String account, String password);

    int register(AdminUser user);

    List<AdminUser> selectAll();
}
