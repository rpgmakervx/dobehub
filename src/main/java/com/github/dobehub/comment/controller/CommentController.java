package com.github.dobehub.comment.controller;/**
 * Description : CommentController
 * Created by YangZH on 16-1-29
 *  下午11:29
 */

import com.github.dobehub.activity.pojo.Activity;
import com.github.dobehub.activity.service.ActivityService;
import com.github.dobehub.comment.pojo.Comment;
import com.github.dobehub.comment.service.CommentService;
import com.github.dobehub.user.pojo.User;
import com.github.dobehub.user.service.UserService;
import com.github.dobehub.util.Constant;
import com.github.dobehub.util.RandMod;
import com.github.dobehub.util.StringUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Description : CommentController
 * Created by YangZH on 16-1-29
 * 下午11:29
 */
@RestController("commentController")
@RequestMapping("comment")
public class CommentController {

    @Resource(name="commentService")
    private CommentService commentService;
    @Resource(name="activityService")
    private ActivityService activityService;
    @Resource(name="stringUtil")
    private StringUtil stringUtil;
    @Resource(name="userService")
    private UserService userService;
    /**
     * 查询某动态下的全部评论
     * @param activity_id
     * @return
     */
    @RequestMapping(value="fetch",method = RequestMethod.GET,produces = "application/json")
    public ResponseEntity<Map<String,Object>> listComments(@RequestParam String activity_id){
        Map<String,Object> result = new HashMap<String, Object>();
        result.put("message", Constant.NORMAL);
        result.put("code", 200);
        result.put("comments", commentService.findCommentByActivity(activity_id));
        return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
    }

    /**
     * 对某动态发起评论
     * @param activity_id
     * @param content
     * @param client_id
     * @return
     */
    @RequestMapping(value="{activity_id}/add/{client_id}",method = RequestMethod.POST,produces = "application/json")
    @ResponseBody
    public ResponseEntity<Map<String,Object>> addComment(@PathVariable String activity_id,@RequestParam String content,
                                                         @PathVariable String client_id){
        Map<String,Object> result = new HashMap<String, Object>();
        Activity activity = activityService.findActivityById(activity_id);
        User user = userService.findUserById(client_id);
        if(user!=null){
            Comment comment = new Comment();
            comment.setActivity(activity);
            comment.setCommentAt(new Date());
            comment.setCommentId(stringUtil.randomCode(8, RandMod.LOWERCHAR));
            comment.setContent(content);
            comment.setUser(user);
            commentService.saveComment(comment);
            result.put("message", Constant.NORMAL);
            result.put("code", 200);
            result.put("comment", comment);
        }else{
            result.put("message", Constant.NO_USER);
            result.put("code", 404);
        }
        return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
    }
}
