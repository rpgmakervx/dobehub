package com.github.dobehub.question.dao;

import com.github.dobehub.question.pojo.Question;

public interface QuestionMapper {
    int deleteByPrimaryKey(String questId);

    int insert(Question record);

    int insertSelective(Question record);

    Question selectByPrimaryKey(String questId);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKeyWithBLOBs(Question record);

    int updateByPrimaryKey(Question record);
}