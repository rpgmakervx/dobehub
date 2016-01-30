package com.github.dobehub.activity.controller;/**
 * Description : ActivityController
 * Created by YangZH on 2016/1/12
 *  20:31
 */


import com.github.dobehub.activity.pojo.Activity;
import com.github.dobehub.activity.service.ActivityService;
import com.github.dobehub.user.pojo.User;
import com.github.dobehub.user.service.UserService;
import com.github.dobehub.util.Constant;
import com.github.dobehub.util.FileUtil;
import com.github.dobehub.util.RandMod;
import com.github.dobehub.util.StringUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Description : ActivityController
 * Created by YangZH on 2016/1/12
 * 20:31
 */
@Controller("activityController")
@RequestMapping("/activity")
public class ActivityController {

    @Resource(name="activityService")
    private ActivityService activityService;
    @Resource(name="userService")
    private UserService userService;
    @Resource(name="stringUtil")
    private StringUtil stringUtil;
    @Resource(name="fileUtil")
    private FileUtil fileUtil;

    @RequestMapping(value="{client_id}/add",method = RequestMethod.POST,produces = "application/json")
    @ResponseBody
    public ResponseEntity<Map<String,Object>> addActivity(HttpServletRequest request,@PathVariable String client_id,@RequestParam String content,
                              @RequestParam(required = false) CommonsMultipartFile picture){
        Map<String,Object> result = new HashMap<String, Object>();
        Activity activity = new Activity();
        System.out.println("添加者: "+client_id);
        User user = userService.findUserById(client_id);
        if(user!=null){
            activity.setContent(content);
            activity.setUser(user);
            activity.setAgreed(0);
            activity.setCmted(0);
            activity.setShared(0);
            activity.setType("self");
            activity.setCreatedAt(new Date());
            activity.setActivityId(stringUtil.randomCode(6, RandMod.NUMERIC));
            activity.setImage(0);
            if(picture!=null){activity.setImage(1);}
            activityService.saveActivity(activity);
            fileUtil.activityImageUpload(request,activity,picture);
            result.put("message",Constant.NORMAL);
            result.put("code",200);
            result.put("activity",activity);
        }else{
            result.put("message", Constant.NO_USER);
            result.put("code",404);
        }
        return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
    }

    /**
     * 分页查询所有动态
     * @param pageindex
     * @return
     */
    @RequestMapping(value="fetchAll",method = RequestMethod.GET,produces = "application/json")
    public ResponseEntity<Map<String,Object>> fetchAllActivity(@RequestParam Integer pageindex){
        Map<String,Object> result = new HashMap<String, Object>();
        List<Activity> activities = activityService.findAllActivity(pageindex, Constant.PAGESIZE);
        result.put("message",Constant.NORMAL);
        result.put("code",200);
        result.put("activities",activities);
        System.out.println("activities: "+activities);
        return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
    }
}
