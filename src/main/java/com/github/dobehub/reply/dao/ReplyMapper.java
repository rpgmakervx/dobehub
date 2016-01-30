package com.github.dobehub.reply.dao;

import com.github.dobehub.reply.pojo.Reply;
import org.springframework.stereotype.Component;

@Component
public interface ReplyMapper {
    int deleteByPrimaryKey(String replyId);

    int insert(Reply record);

    int insertSelective(Reply record);

    Reply selectByPrimaryKey(String replyId);

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKeyWithBLOBs(Reply record);

    int updateByPrimaryKey(Reply record);
}