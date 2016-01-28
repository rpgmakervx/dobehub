package com.github.dobehub.user.service;/**
 * Description : UserService
 * Created by YangZH on 2016/1/23
 *  16:16
 */

import com.github.dobehub.user.dao.UserMapper;
import com.github.dobehub.user.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description : UserService
 * Created by YangZH on 2016/1/23
 * 16:16
 */
@Service("userService")
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User findUserById(String client_id){
        return userMapper.selectByPrimaryKey(client_id);
    }
}
