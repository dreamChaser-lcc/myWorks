package com.example.demo.bean;

public class FeedBack {
    private int id;
    private String content;
    private String username;
    private String time;
    private String contacts;
    private boolean state;
    private String fbcontent;
    private String admin;
    private String fbtype;
    public FeedBack() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
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

    public String getFbtype() {
        return fbtype;
    }

    public void setFbtype(String fbtype) {
        this.fbtype = fbtype;
    }

    @Override
    public String toString() {
        return "FeedBack{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", username='" + username + '\'' +
                ", time='" + time + '\'' +
                ", contacts='" + contacts + '\'' +
                ", state=" + state +
                ", fbcontent='" + fbcontent + '\'' +
                ", admin='" + admin + '\'' +
                ", fbtype='" + fbtype + '\'' +
                '}';
    }
}
