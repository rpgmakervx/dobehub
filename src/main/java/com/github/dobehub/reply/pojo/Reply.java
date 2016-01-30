package com.github.dobehub.reply.pojo;


import com.github.dobehub.comment.pojo.Comment;
import com.github.dobehub.user.pojo.User;

import java.util.Date;
public class Reply {
    private String replyId;

    private Comment comment;

    private User user;

    private User toUser;

    private Date replyAt;

    private String content;

    public String getReplyId() {
        return replyId;
    }

    public void setReplyId(String replyId) {
        this.replyId = replyId == null ? null : replyId.trim();
    }

    public Comment getComment() {return comment;}

    public void setComment(Comment comment) {this.comment = comment;}

    public User getUser() {return user;}

    public void setUser(User user) {this.user = user;}

    public User getToUser() {return toUser;}

    public void setToUser(User toUser) {this.toUser = toUser;}

    public Date getReplyAt() {
        return replyAt;
    }

    public void setReplyAt(Date replyAt) {
        this.replyAt = replyAt;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}