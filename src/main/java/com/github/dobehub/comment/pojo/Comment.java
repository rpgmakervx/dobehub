package com.github.dobehub.comment.pojo;

import com.github.dobehub.activity.pojo.Activity;
import com.github.dobehub.user.pojo.User;

import java.util.Date;

public class Comment {
    private String commentId;

    private User user;

    private Activity activity;

    private Date commentAt;

    private String content;

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId == null ? null : commentId.trim();
    }

    public User getUser() {return user;}

    public void setUser(User user) {this.user = user;}

    public Activity getActivity() {return activity;}

    public void setActivity(Activity activity) {this.activity = activity;}

    public Date getCommentAt() {
        return commentAt;
    }

    public void setCommentAt(Date commentAt) {
        this.commentAt = commentAt;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}