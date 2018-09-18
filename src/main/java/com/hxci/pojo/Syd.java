package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Syd {
    private Integer syszddm;

    private String syszd;

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

    public Integer getSyszddm() {
        return syszddm;
    }

    public void setSyszddm(Integer syszddm) {
        this.syszddm = syszddm;
    }

    public String getSyszd() {
        return syszd;
    }

    public void setSyszd(String syszd) {
        this.syszd = syszd == null ? null : syszd.trim();
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }
}