package com.chenpeng.view;

import com.chenpeng.domain.Answeritem;
import com.chenpeng.domain.Question;
import com.chenpeng.domain.Quitem;

import java.util.List;

/**
 * 问题视图
 */
public class QuestionView {

    /**
     * 问题
     */
    private Question question;

    /**
     * 选项
     */
    private List<Quitem> selectItemList;

    /**
     * 问答内容
     */
    private List<Answeritem> answeritems;


    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public List<Quitem> getSelectItemList() {
        return selectItemList;
    }

    public void setSelectItemList(List<Quitem> selectItemList) {
        this.selectItemList = selectItemList;
    }

    public List<Answeritem> getAnsweritems() {
        return answeritems;
    }

    public void setAnsweritems(List<Answeritem> answeritems) {
        this.answeritems = answeritems;
    }
}
