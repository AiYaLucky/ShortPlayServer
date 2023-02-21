package com.aiyalucky.shortplayserver.controller;

import com.aiyalucky.shortplayserver.dao.User;
import com.aiyalucky.shortplayserver.service.UserServiceImpl;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: xu xiao wei
 * @Date: 2023/2/19 15:34
 * @Version 1.0
 * Created by IntelliJ IDEA.
 */
@RestController
@RequestMapping("/user")
public class UserController {
    private final UserServiceImpl userService;
    private final Gson gson;

    @Autowired
    public UserController(UserServiceImpl userService, Gson gson) {
        this.userService = userService;
        this.gson = gson;
    }

    @PostMapping("/login")
    public String login(@RequestBody User user) {
        User loginUser = userService.login(user.getAccount(), user.getPassword());
        if (loginUser == null) {
            return gson.toJson(ResponseEntity.status(HttpStatus.UNAUTHORIZED.value()).body("登陆失败，请检查账号或者密码是否正确"));
        }
        return gson.toJson(ResponseEntity.status(HttpStatus.OK.value()).body("登录成功"));
    }

    @PostMapping("/register")
    public String register(@RequestBody User user) {
        int result = userService.register(user);
        if (result == 0) {
            return gson.toJson(ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR.value()).body("注册失败~"));
        }
        return gson.toJson(ResponseEntity.status(HttpStatus.OK.value()).body("注册成成功"));
    }
}