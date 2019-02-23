package com.chenpeng.domain;

public class Answeritem {
    private Integer id;

    private String content;

    private Integer questionid;

    public Answeritem(Integer id, String content, Integer questionid) {
        this.id = id;
        this.content = content;
        this.questionid = questionid;
    }

    public Answeritem() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getQuestionid() {
        return questionid;
    }

    public void setQuestionid(Integer questionid) {
        this.questionid = questionid;
    }
}