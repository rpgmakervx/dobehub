package com.github.dobehub.global.controller;/**
 * Description : GlobalControler
 * Created by YangZH on 2016/1/22
 *  11:45
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Description : GlobalControler
 * Created by YangZH on 2016/1/22
 * 11:45
 */
@Controller("globalController")
public class GlobalController {


    @RequestMapping("/index")
    public String index(){
        return "index";
    }
}
