package com.github.dobehub.util;/**
 * Description : StringUtil
 * Created by YangZH on 2016/1/22
 *  11:21
 */

import org.springframework.stereotype.Component;
import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;
import java.util.UUID;

/**
 * Description : StringUtil
 * Created by YangZH on 2016/1/22
 * 11:21
 */
@Component("stringUtil")
public class StringUtil {

    /**
     * 生成uuid
     * @return
     */
    public String getUUID(){
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * md5加密
     * @param str
     * @return
     */
    public String getMD5(String str) {
        StringBuffer buf = new StringBuffer("");
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            byte b[] = md.digest();
            int i;
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
            str = buf.toString();
            System.out.println("result: " + buf.toString());// 32位的加密
            System.out.println("result: " + buf.toString().substring(8, 24));// 16位的加密

        } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();

        }
        return buf.toString();
    }

    /**
     * base64加密
     * @param str
     * @return
     */
    public String getBase64(String str) {
        byte[] b = null;
        String s = null;
        try {
            b = str.getBytes("utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        if (b != null) {
            s = new BASE64Encoder().encode(b);
        }
        return s;
    }

    /**
     * 生成指定位数的随机字符串
     * @param level 生成长度
*    * @param mod   生成模式（按照指定模式生成,模式有：数字类型，大写字母，小写字母，数字字母混合）
     * @return
     */
    public String randomCode(int level,RandMod mod){
        String randcode = "";
        switch (mod){
            case NUMERIC:randcode = Constant.NUMERIC;break;
            case UPPERCHAR:randcode = Constant.UPPERCHAR;break;
            case LOWERCHAR:randcode = Constant.LOWERCHAR;break;
            case MIXED:randcode = Constant.MIXED;break;
        }
        int len = randcode.length();
        StringBuffer password = new StringBuffer();
        Random rand = new Random();
        for(int i=0;i<level&&len>0;i++){
            password.append(randcode.charAt(rand.nextInt(len)));
        }
        return password.toString();
    }
    /**
     * 生成验证码
     * @return
     */
    public String valideCode(){
        String numberic = "1234567890";
        String character = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuffer result = new StringBuffer();
        Random rand = new Random();
        for(int i=0;i<6;i++){
            if(i<3){
                result.append(character.charAt(rand.nextInt(26)));
            }else{
                result.append(numberic.charAt(rand.nextInt(10)));
            }
        }
        return result.toString();
    }
}
