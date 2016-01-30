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

    /**
     * 添加动态
     * @param activity
     */
    public void saveActivity(Activity activity){
        activityMapper.insert(activity);
    }

    /**
     * 分页查询全部动态
     * @param offset
     * @param limit
     * @return
     */
    public List<Activity> findAllActivity(int offset,int limit){
        PageHelper.startPage(offset, limit);
        return activityMapper.selectAll();
    }

    /**
     * 通过id查询activity
     * @param activity_id
     * @return
     */
    public Activity findActivityById(String activity_id){
        return activityMapper.selectByPrimaryKey(activity_id);
    }
}
