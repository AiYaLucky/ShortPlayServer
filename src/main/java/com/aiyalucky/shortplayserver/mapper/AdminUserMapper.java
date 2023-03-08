package com.aiyalucky.shortplayserver.mapper;


import com.aiyalucky.shortplayserver.dao.AdminUser;
import com.aiyalucky.shortplayserver.dao.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author 小白上楼梯
 * @description 针对表【admin_user】的数据库操作Mapper
 * @createDate 2023-03-08 18:20:41
 * @Entity com.aiyalucky.shortplayserver.dao.AdminUser
 */
@Mapper
public interface AdminUserMapper {

    AdminUser findByUsername(String account);

    int insert(User user);

    int deleteUser(String uid);
}
