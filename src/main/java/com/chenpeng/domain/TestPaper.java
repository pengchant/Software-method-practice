package com.chenpeng.domain;

import java.util.Date;

public class TestPaper {
    private Integer id;

    private String title;

    private Date starttime;

    private Date endtime;

    private Integer suber;

    private Integer hastested;

    public TestPaper(Integer id, String title, Date starttime, Date endtime, Integer suber, Integer hastested) {
        this.id = id;
        this.title = title;
        this.starttime = starttime;
        this.endtime = endtime;
        this.suber = suber;
        this.hastested = hastested;
    }

    public TestPaper() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public Integer getSuber() {
        return suber;
    }

    public void setSuber(Integer suber) {
        this.suber = suber;
    }

    public Integer getHastested() {
        return hastested;
    }

    public void setHastested(Integer hastested) {
        this.hastested = hastested;
    }
}