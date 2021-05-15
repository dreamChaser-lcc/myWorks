package com.example.demo.bean;

public class CurrentEqData {
    private int id;
    private String deviceName;
    private int ledSwitch;
    private String wd;
    private String hum;
    private Boolean fanSwitch;
    private String smoke;
    private String time;

    public CurrentEqData(int id, String deviceName, int ledSwitch, String wd, String hum, Boolean fanSwitch, String smoke, String time) {
        this.id = id;
        this.deviceName = deviceName;
        this.ledSwitch = ledSwitch;
        this.wd = wd;
        this.hum = hum;
        this.fanSwitch = fanSwitch;
        this.smoke = smoke;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public int getLedSwitch() {
        return ledSwitch;
    }

    public void setLedSwitch(int ledSwitch) {
        this.ledSwitch = ledSwitch;
    }

    public String getWd() {
        return wd;
    }

    public void setWd(String wd) {
        this.wd = wd;
    }

    public String getHum() {
        return hum;
    }

    public void setHum(String hum) {
        this.hum = hum;
    }

    public Boolean getFanSwitch() {
        return fanSwitch;
    }

    public void setFanSwitch(Boolean fanSwitch) {
        this.fanSwitch = fanSwitch;
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
        return "CurrentEqData{" +
                "id=" + id +
                ", deviceName='" + deviceName + '\'' +
                ", ledSwitch=" + ledSwitch +
                ", wd='" + wd + '\'' +
                ", hum='" + hum + '\'' +
                ", fanSwitch=" + fanSwitch +
                ", smoke='" + smoke + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}
