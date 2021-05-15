package com.example.demo.wxBean;

public class wxLegend {
    private String wd;
    private String hour;

    public wxLegend(String wd, String hour) {
        this.wd = wd;
        this.hour = hour;
    }

    public String getWd() {
        return wd;
    }

    public void setWd(String wd) {
        this.wd = wd;
    }

    public String getHour() {
        return hour;
    }

    public void setHour(String hour) {
        this.hour = hour;
    }

    @Override
    public String toString() {
        return "wxLegend{" +
                "wd='" + wd + '\'' +
                ", hour='" + hour + '\'' +
                '}';
    }
}
