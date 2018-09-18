package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Bdz {
    private Integer bdzqflbdm;

    private String bdzqflb;

    public Integer getBdzqflbdm() {
        return bdzqflbdm;
    }

    public void setBdzqflbdm(Integer bdzqflbdm) {
        this.bdzqflbdm = bdzqflbdm;
    }

    public String getBdzqflb() {
        return bdzqflb;
    }

    public void setBdzqflb(String bdzqflb) {
        this.bdzqflb = bdzqflb == null ? null : bdzqflb.trim();
    }
}