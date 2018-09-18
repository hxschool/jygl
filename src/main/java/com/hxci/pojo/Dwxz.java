package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Dwxz {
    private Integer dwxzdm;

    private String dwxz;

    public Integer getDwxzdm() {
        return dwxzdm;
    }

    public void setDwxzdm(Integer dwxzdm) {
        this.dwxzdm = dwxzdm;
    }

    public String getDwxz() {
        return dwxz;
    }

    public void setDwxz(String dwxz) {
        this.dwxz = dwxz == null ? null : dwxz.trim();
    }
}