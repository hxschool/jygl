package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Dwhy {
    private Integer dwhydm;

    private String dwhy;

    public Integer getDwhydm() {
        return dwhydm;
    }

    public void setDwhydm(Integer dwhydm) {
        this.dwhydm = dwhydm;
    }

    public String getDwhy() {
        return dwhy;
    }

    public void setDwhy(String dwhy) {
        this.dwhy = dwhy == null ? null : dwhy.trim();
    }
}