package com.example.demo.controller.wxFb.wxFbBean;

public class wxFbReturnBean {
    private int id;
    private String username;
    private String fbtype;
    private String content;
    private String contacts;
    private String time;
    private String fbcontent;
    private String admin;
    private boolean state;

    public wxFbReturnBean() {
        super();
    }

    public wxFbReturnBean(int id, String username, String fbtype, String content, String contacts, String time, String fbcontent, String admin, boolean state) {
        this.id = id;
        this.username = username;
        this.fbtype = fbtype;
        this.content = content;
        this.contacts = contacts;
        this.time = time;
        this.fbcontent = fbcontent;
        this.admin = admin;
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFbtype() {
        return fbtype;
    }

    public void setFbtype(String fbtype) {
        this.fbtype = fbtype;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getFbcontent() {
        return fbcontent;
    }

    public void setFbcontent(String fbcontent) {
        this.fbcontent = fbcontent;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "wxFbReturnBean{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", fbtype='" + fbtype + '\'' +
                ", content='" + content + '\'' +
                ", contacts='" + contacts + '\'' +
                ", time='" + time + '\'' +
                ", fbcontent='" + fbcontent + '\'' +
                ", admin='" + admin + '\'' +
                ", state=" + state +
                '}';
    }
}
