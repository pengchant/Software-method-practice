package com.chenpeng.domain;

public class Question {
    private Integer id;

    private String content;

    private Short type;

    private Integer paperid;

    public Question(Integer id, String content, Short type, Integer paperid) {
        this.id = id;
        this.content = content;
        this.type = type;
        this.paperid = paperid;
    }

    public Question() {
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

    public Short getType() {
        return type;
    }

    public void setType(Short type) {
        this.type = type;
    }

    public Integer getPaperid() {
        return paperid;
    }

    public void setPaperid(Integer paperid) {
        this.paperid = paperid;
    }
}