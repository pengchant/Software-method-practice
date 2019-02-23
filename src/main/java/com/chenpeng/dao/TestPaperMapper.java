package com.chenpeng.dao;

import com.chenpeng.domain.TestPaper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TestPaperMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TestPaper record);

    int insertSelective(TestPaper record);

    TestPaper selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TestPaper record);

    int updateByPrimaryKey(TestPaper record);

    /**
     * 分页查询已经上传的记录
     * @param suberid
     * @return
     */
    List<TestPaper> selectAddedPaper(@Param("suberid") int suberid);
}