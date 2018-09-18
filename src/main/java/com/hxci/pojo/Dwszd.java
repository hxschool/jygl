package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Dwszd {
    private Integer dwszddm;

    private String dwszd;

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

    public Integer getDwszddm() {
        return dwszddm;
    }

    public void setDwszddm(Integer dwszddm) {
        this.dwszddm = dwszddm;
    }

    public String getDwszd() {
        return dwszd;
    }

    public void setDwszd(String dwszd) {
        this.dwszd = dwszd == null ? null : dwszd.trim();
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }
}