package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Zy {
    private String zydm;

    private String zy;

    private String zycc;

    private String xkdlno;

    private String xkdlname;

    private Integer xkzlno;

    private String xkzlname;

    public String getZydm() {
        return zydm;
    }

    public void setZydm(String zydm) {
        this.zydm = zydm == null ? null : zydm.trim();
    }

    public String getZy() {
        return zy;
    }

    public void setZy(String zy) {
        this.zy = zy == null ? null : zy.trim();
    }

    public String getZycc() {
        return zycc;
    }

    public void setZycc(String zycc) {
        this.zycc = zycc == null ? null : zycc.trim();
    }

    public String getXkdlno() {
        return xkdlno;
    }

    public void setXkdlno(String xkdlno) {
        this.xkdlno = xkdlno == null ? null : xkdlno.trim();
    }

    public String getXkdlname() {
        return xkdlname;
    }

    public void setXkdlname(String xkdlname) {
        this.xkdlname = xkdlname == null ? null : xkdlname.trim();
    }

    public Integer getXkzlno() {
        return xkzlno;
    }

    public void setXkzlno(Integer xkzlno) {
        this.xkzlno = xkzlno;
    }

    public String getXkzlname() {
        return xkzlname;
    }

    public void setXkzlname(String xkzlname) {
        this.xkzlname = xkzlname == null ? null : xkzlname.trim();
    }
}