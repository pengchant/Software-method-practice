package com.chenpeng.dao;

import com.chenpeng.domain.Quitem;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface QuitemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Quitem record);

    int insertSelective(Quitem record);

    Quitem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Quitem record);

    int updateByPrimaryKey(Quitem record);

    /**
     * 查询问题选项
     *
     * @param questionid
     * @return
     */
    List<Quitem> selectQuestionItems(@Param("questionid") int questionid);
}