package com.chenpeng.domain;

public class Account {
    private Integer id;

    private String uid;

    private String upwd;

    private String uname;

    private Short type;

    public Account(Integer id, String uid, String upwd, String uname, Short type) {
        this.id = id;
        this.uid = uid;
        this.upwd = upwd;
        this.uname = uname;
        this.type = type;
    }

    public Account() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd == null ? null : upwd.trim();
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public Short getType() {
        return type;
    }

    public void setType(Short type) {
        this.type = type;
    }
}