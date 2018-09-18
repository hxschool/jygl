package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Pyfs {
    private Integer pyfsdm;

    private String pyfs;

    public Integer getPyfsdm() {
        return pyfsdm;
    }

    public void setPyfsdm(Integer pyfsdm) {
        this.pyfsdm = pyfsdm;
    }

    public String getPyfs() {
        return pyfs;
    }

    public void setPyfs(String pyfs) {
        this.pyfs = pyfs == null ? null : pyfs.trim();
    }
}