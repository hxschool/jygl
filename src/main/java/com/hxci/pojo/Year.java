package com.hxci.pojo;

import lombok.ToString;

@ToString
public class Year {
    private String timeno;

    private String timename;

    public String getTimeno() {
        return timeno;
    }

    public void setTimeno(String timeno) {
        this.timeno = timeno == null ? null : timeno.trim();
    }

    public String getTimename() {
        return timename;
    }

    public void setTimename(String timename) {
        this.timename = timename == null ? null : timename.trim();
    }
}