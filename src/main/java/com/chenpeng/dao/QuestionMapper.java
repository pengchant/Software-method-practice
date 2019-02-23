package com.chenpeng.dao;

import com.chenpeng.domain.Question;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Question record);

    int insertSelective(Question record);

    Question selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKey(Question record);

    /**
     * 加载题目
     *
     * @param paperid
     * @return
     */
    List<Question> selecExamQuestions(@Param("paperid") int paperid);
}