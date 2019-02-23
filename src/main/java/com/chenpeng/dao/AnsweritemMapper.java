package com.chenpeng.dao;

import com.chenpeng.domain.Answeritem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnsweritemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Answeritem record);

    int insertSelective(Answeritem record);

    Answeritem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Answeritem record);

    int updateByPrimaryKey(Answeritem record);

    /**
     * 查询
     * @param questionid
     * @return
     */
    List<Answeritem> selectAnswers(@Param("questionid")int questionid);
}