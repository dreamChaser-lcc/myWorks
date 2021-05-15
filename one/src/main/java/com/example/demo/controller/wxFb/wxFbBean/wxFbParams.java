package com.example.demo.controller.wxFb.wxFbBean;

public class wxFbParams {
    private String username;
    private String fbtype;
    private String content;
    private String contacts;
    private String time;
    private boolean isDisabled;

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

    public boolean isDisabled() {
        return isDisabled;
    }

    public void setDisabled(boolean disabled) {
        isDisabled = disabled;
    }

    @Override
    public String toString() {
        return "wxFbParams{" +
                "username='" + username + '\'' +
                ", fbtype='" + fbtype + '\'' +
                ", content='" + content + '\'' +
                ", contacts='" + contacts + '\'' +
                ", time='" + time + '\'' +
                ", isDisabled=" + isDisabled +
                '}';
    }
}
