package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Sfs {
    private Integer sfslbdm;

    private String sfslb;

    public Integer getSfslbdm() {
        return sfslbdm;
    }

    public void setSfslbdm(Integer sfslbdm) {
        this.sfslbdm = sfslbdm;
    }

    public String getSfslb() {
        return sfslb;
    }

    public void setSfslb(String sfslb) {
        this.sfslb = sfslb == null ? null : sfslb.trim();
    }
}