package com.github.dobehub.comment.service;/**
 * Description : CommentService
 * Created by YangZH on 16-1-29
 *  下午11:21
 */

import com.github.dobehub.comment.dao.CommentMapper;
import com.github.dobehub.comment.pojo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description : CommentService
 * Created by YangZH on 16-1-29
 * 下午11:21
 */
@Service("commentService")
public class CommentService {

    @Autowired
    private CommentMapper commentMapper;

    /**
     * 根据动态id查询其中的评论
     * @param activity_id
     * @return
     */
    public List<Comment> findCommentByActivity(String activity_id){
        return commentMapper.selectByActivity(activity_id);
    }

    /**
     * 添加评论
     * @param comment   必须要有activity属性
     */
    public void saveComment(Comment comment){
        commentMapper.insert(comment);
    }
}
