package com.github.dobehub.user.dao;

import com.github.dobehub.user.pojo.User;
import org.springframework.stereotype.Component;

@Component
public interface UserMapper {
    int deleteByPrimaryKey(String clientId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String clientId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}