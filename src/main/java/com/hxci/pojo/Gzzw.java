package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Gzzw {
    private Integer gzzwlbdm;

    private String gzzwlb;

    public Integer getGzzwlbdm() {
        return gzzwlbdm;
    }

    public void setGzzwlbdm(Integer gzzwlbdm) {
        this.gzzwlbdm = gzzwlbdm;
    }

    public String getGzzwlb() {
        return gzzwlb;
    }

    public void setGzzwlb(String gzzwlb) {
        this.gzzwlb = gzzwlb == null ? null : gzzwlb.trim();
    }
}