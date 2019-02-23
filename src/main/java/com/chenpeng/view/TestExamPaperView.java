package com.chenpeng.view;

import com.chenpeng.domain.TestPaper;

import java.util.List;

/**
 * 测试试卷视图
 */
public class TestExamPaperView {

    /**
     * 试卷
     */
    private TestPaper testPaper;

    /**
     * 问题列表
     */
    private List<QuestionView> questionListdata;

    public TestPaper getTestPaper() {
        return testPaper;
    }

    public void setTestPaper(TestPaper testPaper) {
        this.testPaper = testPaper;
    }

    public List<QuestionView> getQuestionListdata() {
        return questionListdata;
    }

    public void setQuestionListdata(List<QuestionView> questionListdata) {
        this.questionListdata = questionListdata;
    }
}
