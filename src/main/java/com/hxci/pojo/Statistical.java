package com.hxci.pojo;

import java.util.List;

public class Statistical
{
  private Integer count;
  private String code;
  private String name;
  private Integer allCount = Integer.valueOf(0);

  public Integer getCount()
  {
    return this.count;
  }

  public void setCount(Integer count) {
    this.count = count;
  }

  public String getCode() {
    return this.code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Integer getAllCount(List<Statistical> list)
  {
    for (Statistical statistical : list) {
      Statistical tmp21_20 = this; tmp21_20.allCount = Integer.valueOf(tmp21_20.allCount.intValue() + statistical.getCount().intValue());
    }
    return this.allCount;
  }
}