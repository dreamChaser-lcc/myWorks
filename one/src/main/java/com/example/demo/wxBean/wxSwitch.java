package com.example.demo.wxBean;

public class wxSwitch {
    private String eqName;
    private boolean switchWd;
    private boolean switchZl;
    private boolean switchGz;

    public wxSwitch() {
    }
    public wxSwitch(String eqName, boolean switchWd, boolean switchZl, boolean switchGz) {
        this.eqName = eqName;
        this.switchWd = switchWd;
        this.switchZl = switchZl;
        this.switchGz = switchGz;
    }

    public String getEqName() {
        return eqName;
    }

    public void setEqName(String eqName) {
        this.eqName = eqName;
    }

    public boolean isSwitchWd() {
        return switchWd;
    }

    public void setSwitchWd(boolean switchWd) {
        this.switchWd = switchWd;
    }

    public boolean isSwitchZl() {
        return switchZl;
    }

    public void setSwitchZl(boolean switchZl) {
        this.switchZl = switchZl;
    }

    public boolean isSwitchGz() {
        return switchGz;
    }

    public void setSwitchGz(boolean switchGz) {
        this.switchGz = switchGz;
    }

    @Override
    public String toString() {
        return "wxEqdata{" +
                "eqName='" + eqName + '\'' +
                ", switchWd=" + switchWd +
                ", switchZl=" + switchZl +
                ", switchGz=" + switchGz +
                '}';
    }
}
