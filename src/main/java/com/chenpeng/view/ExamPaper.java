package com.chenpeng.view;

import java.util.List;

public class ExamPaper {

    private String title;

    private String starttime;

    private String endtime;

    private List<WJQuestion> questions;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public List<WJQuestion> getQuestions() {
        return questions;
    }

    public void setQuestions(List<WJQuestion> questions) {
        this.questions = questions;
    }
}
