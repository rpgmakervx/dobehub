package com.github.dobehub.util;

import com.github.dobehub.activity.pojo.Activity;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Component("fileUtil")
public class FileUtil {

	/**
	 * 业务功能：从请求中读取用户的头像
	 * @param request(请求对象，用来获取服务器路径)
	 * @param picture(图片对象)
	 * @param activity_id(动态的id)
	 * 图片如果存在就覆盖掉，所有图片都叫sign.jpg
	 */
	public boolean activityImageUpload(HttpServletRequest request,Activity activity, CommonsMultipartFile picture){
		if(picture!=null&&picture.getSize()>0){
			String pictureRealPathDir = request.getSession().getServletContext().getRealPath("assets/images/activity/"+activity.getUser().getClientId());
			String fileName =pictureRealPathDir+File.separator+activity.getActivityId()+".jpg";
			try {
				File f = new File(fileName);
				File folder = new File(pictureRealPathDir);
				if(!folder.exists())
					folder.mkdirs();
				picture.getFileItem().write(f);
				return true;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
		}else return false;
	}
}
