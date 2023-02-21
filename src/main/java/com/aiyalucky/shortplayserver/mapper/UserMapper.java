package com.aiyalucky.shortplayserver.mapper;

import com.aiyalucky.shortplayserver.dao.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @Author: xu xiao wei
 * @Date: 2023/2/19 15:33
 * @Version 1.0
 * Created by IntelliJ IDEA.
 */
@Mapper
public interface UserMapper {
    User findByUsername(String account);

    int insert(User user);

    int deleteUser(String uid);
}
