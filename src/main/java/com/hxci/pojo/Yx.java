package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Yx {
    private Integer yxdm;

    private String yxmc;

    public Integer getYxdm() {
        return yxdm;
    }

    public void setYxdm(Integer yxdm) {
        this.yxdm = yxdm;
    }

    public String getYxmc() {
        return yxmc;
    }

    public void setYxmc(String yxmc) {
        this.yxmc = yxmc == null ? null : yxmc.trim();
    }
}