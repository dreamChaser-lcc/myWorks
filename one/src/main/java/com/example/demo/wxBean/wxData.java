package com.example.demo.wxBean;

public class wxData {
    private  int id;
    private String eqName;
    private String wd;
    private String smoke;
    private  String time;

    public wxData(int id, String eqName, String wd, String smoke, String time) {
        this.id = id;
        this.eqName = eqName;
        this.wd = wd;
        this.smoke = smoke;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEqName() {
        return eqName;
    }

    public void setEqName(String eqName) {
        this.eqName = eqName;
    }

    public String getWd() {
        return wd;
    }

    public void setWd(String wd) {
        this.wd = wd;
    }

    public String getSmoke() {
        return smoke;
    }

    public void setSmoke(String smoke) {
        this.smoke = smoke;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "wxData{" +
                "id=" + id +
                ", eqName='" + eqName + '\'' +
                ", wd='" + wd + '\'' +
                ", smoke='" + smoke + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}

