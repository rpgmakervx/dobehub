package com.github.dobehub.comment.dao;

import com.github.dobehub.comment.pojo.Comment;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public interface CommentMapper {
    int deleteByPrimaryKey(String commentId);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(String commentId);
    List<Comment> selectByActivity(String activityId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKeyWithBLOBs(Comment record);

    int updateByPrimaryKey(Comment record);
}