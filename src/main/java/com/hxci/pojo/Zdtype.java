package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Zdtype {
    private String zddm;

    private String zdmc;

    private Integer px;

    public String getZddm() {
        return zddm;
    }

    public void setZddm(String zddm) {
        this.zddm = zddm == null ? null : zddm.trim();
    }

    public String getZdmc() {
        return zdmc;
    }

    public void setZdmc(String zdmc) {
        this.zdmc = zdmc == null ? null : zdmc.trim();
    }

    public Integer getPx() {
        return px;
    }

    public void setPx(Integer px) {
        this.px = px;
    }
}