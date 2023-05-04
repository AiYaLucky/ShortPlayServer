package com.aiyalucky.shortplayserver.controller;

import com.aiyalucky.shortplayserver.dao.AdminUser;
import com.aiyalucky.shortplayserver.dao.User;
import com.aiyalucky.shortplayserver.https.ServerResponse;
import com.aiyalucky.shortplayserver.service.impl.AdminUserServiceImpl;
import com.aiyalucky.shortplayserver.service.impl.UserServiceImpl;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 后台管理控制器
 *
 * @Author xu xiao wei
 * @ClassName UserController
 * @Package com.aiyalucky.shortplayserver.controller
 * @Date 2023/3/2 22:39
 * @Version 1.0
 */

@RestController
@RequestMapping("/web")
public class AdminUserController {
    private final AdminUserServiceImpl adminUserService;
    private final Gson gson;

    @Autowired
    public AdminUserController(AdminUserServiceImpl adminUserService, Gson gson) {
        this.adminUserService = adminUserService;
        this.gson = gson;
    }

    @PostMapping("/login")
    public String login(@RequestBody AdminUser adminUser) {
        AdminUser loginUser = adminUserService.login(adminUser.getUsername(), adminUser.getPassword());
        ServerResponse response = new ServerResponse();
        HashMap<String, Object> map = new HashMap<>(16);

        if (loginUser == null) {
            response.setCode(HttpStatus.UNAUTHORIZED.value());
            response.setMessage("登录失败，请检查账号密码是否正确");
            map.put("", "");
        } else {
            map.put("user", loginUser);
            response.setCode(HttpStatus.OK.value());
            response.setMessage("登录成功");
            response.setData(map);
        }
        return gson.toJson(response);
    }

    @PostMapping("/register")
    public String register(@RequestBody AdminUser user) {
        int result = adminUserService.register(user);
        if (result == 0) {
            return gson.toJson(ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR.value()).body("注册失败~"));
        }
        return gson.toJson(ResponseEntity.status(HttpStatus.OK.value()).body("注册成成功"));
    }
}