package com.github.dobehub.activity.pojo;

import com.github.dobehub.user.pojo.User;

import java.util.Date;

public class Activity {
    private String activityId;

    private User user;

    private String type;

    private Integer agreed;

    private Integer cmted;

    private Integer shared;

    private String content;

    private Date createdAt;
    public String getActivityId() {
        return activityId;
    }

    public void setActivityId(String activityId) {
        this.activityId = activityId == null ? null : activityId.trim();
    }

    public User getUser() { return user;}

    public void setUser(User user) {this.user = user;}

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Integer getAgreed() {
        return agreed;
    }

    public void setAgreed(Integer agreed) {
        this.agreed = agreed;
    }

    public Integer getCmted() {
        return cmted;
    }

    public void setCmted(Integer cmted) {
        this.cmted = cmted;
    }

    public Integer getShared() {
        return shared;
    }

    public void setShared(Integer shared) {
        this.shared = shared;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getCreatedAt() {return createdAt;}

    public void setCreatedAt(Date createdAt) {this.createdAt = createdAt;}
}