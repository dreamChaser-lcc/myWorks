package com.example.demo.bean;

public class AliBean {
    private String value;
    private String time;

    public AliBean(String value, String time) {
        this.value = value;
        this.time = time;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "AliBean{" +
                "value='" + value + '\'' +
                ", time='" + time + '\'' +
                '}';
    }
}
