package com.github.dobehub.activity.service;/**
 * Description : ActivityService
 * Created by YangZH on 2016/1/21
 *  16:19
 */

import com.github.dobehub.activity.dao.ActivityMapper;
import com.github.dobehub.activity.pojo.Activity;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description : ActivityService
 * Created by YangZH on 2016/1/21
 * 16:19
 */
@Service("activityService")
public class ActivityService {

    @Autowired
    private ActivityMapper activityMapper;

    public void saveActivity(Activity activity){
        activityMapper.insert(activity);
    }

    public List<Activity> findAllActivity(int offset,int limit){
        PageHelper.startPage(offset, limit);
        return activityMapper.selectAll();
    }
}
