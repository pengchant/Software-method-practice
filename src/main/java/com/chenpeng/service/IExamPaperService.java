package com.chenpeng.service;

import com.chenpeng.domain.Account;
import com.chenpeng.domain.TestPaper;
import com.chenpeng.view.ExamPaper;
import com.chenpeng.view.TestExamPaperView;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface IExamPaperService {

    /**
     * 录入试题
     *
     * @param paper
     * @param account
     * @return
     */
    Boolean addExamPaper(ExamPaper paper, Account account);

    /**
     * 分页查询已经添加的问卷调查
     *
     * @param suberid
     * @param pageNo
     * @param pageSize
     * @return
     */
    PageInfo<TestPaper> queryExams(int suberid, int pageNo, int pageSize);


    /**
     * 查询试卷
     *
     * @param paperid
     * @return
     */
    TestExamPaperView queryExamViews(int paperid);

    /**
     * 答卷
     *
     * @param data
     * @return
     */
    boolean doExam(List<Map<String, String>> data);

}
