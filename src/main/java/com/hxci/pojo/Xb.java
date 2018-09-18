package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Xb {
    private Integer xbdm;

    private String xb;

    public Integer getXbdm() {
        return xbdm;
    }

    public void setXbdm(Integer xbdm) {
        this.xbdm = xbdm;
    }

    public String getXb() {
        return xb;
    }

    public void setXb(String xb) {
        this.xb = xb == null ? null : xb.trim();
    }
}