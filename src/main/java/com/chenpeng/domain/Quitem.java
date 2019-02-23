package com.chenpeng.domain;

public class Quitem {
    private Integer id;

    private String content;

    private Integer num;

    private Integer counter;

    private Integer questionid;

    public Quitem(Integer id, String content, Integer num, Integer counter, Integer questionid) {
        this.id = id;
        this.content = content;
        this.num = num;
        this.counter = counter;
        this.questionid = questionid;
    }

    public Quitem() {
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

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getCounter() {
        return counter;
    }

    public void setCounter(Integer counter) {
        this.counter = counter;
    }

    public Integer getQuestionid() {
        return questionid;
    }

    public void setQuestionid(Integer questionid) {
        this.questionid = questionid;
    }
}