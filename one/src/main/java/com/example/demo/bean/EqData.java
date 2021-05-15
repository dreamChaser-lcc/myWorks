package com.example.demo.bean;

public class EqData {
    private String wd;
    private String ph;
    private String zl;
    private String gz;

    public EqData() {
    }

    public EqData(String wd, String ph, String zl, String gz) {
        this.wd = wd;
        this.ph = ph;
        this.zl = zl;
        this.gz = gz;
    }

    public String getWd() {
        return wd;
    }

    public void setWd(String wd) {
        this.wd = wd;
    }

    public String getPh() {
        return ph;
    }

    public void setPh(String ph) {
        this.ph = ph;
    }

    public String getZl() {
        return zl;
    }

    public void setZl(String zl) {
        this.zl = zl;
    }

    public String getGz() {
        return gz;
    }

    public void setGz(String gz) {
        this.gz = gz;
    }

    @Override
    public String toString() {
        return "EqData{" +
                "wd='" + wd + '\'' +
                ", ph='" + ph + '\'' +
                ", zl='" + zl + '\'' +
                ", gz='" + gz + '\'' +
                '}';
    }
}
