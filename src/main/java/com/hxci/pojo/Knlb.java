package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Knlb {
    private Integer knslbdm;

    private String knslb;

    public Integer getKnslbdm() {
        return knslbdm;
    }

    public void setKnslbdm(Integer knslbdm) {
        this.knslbdm = knslbdm;
    }

    public String getKnslb() {
        return knslb;
    }

    public void setKnslb(String knslb) {
        this.knslb = knslb == null ? null : knslb.trim();
    }
}