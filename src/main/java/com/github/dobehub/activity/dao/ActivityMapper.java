package com.github.dobehub.activity.dao;

import com.github.dobehub.activity.pojo.Activity;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public interface ActivityMapper {
    int deleteByPrimaryKey(String activityId);

    int insert(Activity record);

    int insertSelective(Activity record);

    Activity selectByPrimaryKey(String activityId);

    List<Activity> selectAll();

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKeyWithBLOBs(Activity record);

    int updateByPrimaryKey(Activity record);
}