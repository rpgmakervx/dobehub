package com.github.dobehub.user.controller;/**
 * Description : UserController
 * Created by YangZH on 2016/1/16
 *  16:46
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Description : UserController
 * Created by YangZH on 2016/1/16
 * 16:46
 */
@Controller("userController")
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/{user}")
    public String user(){
        return "";
    }
}
