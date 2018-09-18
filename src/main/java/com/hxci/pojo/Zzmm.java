package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Zzmm {
    private String zzmmdm;

    private String zzmm;

    public String getZzmmdm() {
        return zzmmdm;
    }

    public void setZzmmdm(String zzmmdm) {
        this.zzmmdm = zzmmdm == null ? null : zzmmdm.trim();
    }

    public String getZzmm() {
        return zzmm;
    }

    public void setZzmm(String zzmm) {
        this.zzmm = zzmm == null ? null : zzmm.trim();
    }
}