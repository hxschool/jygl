package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Xl {
    private String xldm;

    private String xl;

    public String getXldm() {
        return xldm;
    }

    public void setXldm(String xldm) {
        this.xldm = xldm == null ? null : xldm.trim();
    }

    public String getXl() {
        return xl;
    }

    public void setXl(String xl) {
        this.xl = xl == null ? null : xl.trim();
    }
}