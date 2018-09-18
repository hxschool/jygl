package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Mz {
    private String mzdm;

    private String mz;

    public String getMzdm() {
        return mzdm;
    }

    public void setMzdm(String mzdm) {
        this.mzdm = mzdm == null ? null : mzdm.trim();
    }

    public String getMz() {
        return mz;
    }

    public void setMz(String mz) {
        this.mz = mz == null ? null : mz.trim();
    }
}