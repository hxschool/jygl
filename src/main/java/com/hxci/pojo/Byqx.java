package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Byqx {
    private Integer byqxdm;

    private String byqx;

    public Integer getByqxdm() {
        return byqxdm;
    }

    public void setByqxdm(Integer byqxdm) {
        this.byqxdm = byqxdm;
    }

    public String getByqx() {
        return byqx;
    }

    public void setByqx(String byqx) {
        this.byqx = byqx == null ? null : byqx.trim();
    }
}