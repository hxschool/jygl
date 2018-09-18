package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Qwdwszd {
    private String qwdwszddm;

    private String qwdwszd;

    private String level;

    private Integer dqlx;

    private String city;

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

    public void setDqlx(Integer dqlx) {
        this.dqlx = dqlx;
    }

    public Integer getDqlx() {
        return dqlx;
    }

    public String getQwdwszddm() {
        return qwdwszddm;
    }

    public void setQwdwszddm(String qwdwszddm) {
        this.qwdwszddm = qwdwszddm;
    }

    public String getQwdwszd() {
        return qwdwszd;
    }

    public void setQwdwszd(String qwdwszd) {
        this.qwdwszd = qwdwszd == null ? null : qwdwszd.trim();
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }
}