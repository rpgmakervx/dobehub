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
import com.github.dobehub.util.StringUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
    public String addActivity(HttpServletRequest request,@PathVariable String client_id,@RequestParam String content,
                              @RequestParam(required = false) CommonsMultipartFile picture){
        Activity activity = new Activity();
        System.out.println("picture: "+picture.getSize());
        User user = userService.findUserById(client_id);
        activity.setContent(content);
        activity.setUser(user);
        activity.setAgreed(0);
        activity.setCmted(0);
        activity.setShared(0);
        activity.setType("self");
        activity.setCreatedAt(new Date());
        activity.setActivityId(stringUtil.randomCode(6));
        activityService.saveActivity(activity);
        fileUtil.imageUpload(request,activity.getActivityId(),picture);
        return "redirect:/index";
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
