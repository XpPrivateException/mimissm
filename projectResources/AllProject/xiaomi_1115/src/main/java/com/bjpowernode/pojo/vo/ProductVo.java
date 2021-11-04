package com.bjpowernode.pojo.vo;

/**
 * @author 张阿荣
 * @version 1.0
 * @title: ProductVo
 * @projectName SSM_XiaoMi_5
 * @description:
 * @date 2019/12/3   9:27
 */
public class ProductVo {
    //封装所有页面上的查询条件
    private String pname;
    private Integer typeid;
    private Integer lprice;
    private Integer hprice;
    private Integer page=1;

    @Override
    public String toString() {
        return "ProductVo{" +
                "pname='" + pname + '\'' +
                ", typeid=" + typeid +
                ", lprice=" + lprice +
                ", hprice=" + hprice +
                ", page=" + page +
                '}';
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Integer getLprice() {
        return lprice;
    }

    public void setLprice(Integer lprice) {
        this.lprice = lprice;
    }

    public Integer getHprice() {
        return hprice;
    }

    public void setHprice(Integer hprice) {
        this.hprice = hprice;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public ProductVo() {
    }

    public ProductVo(String pname, Integer typeid, Integer lprice, Integer hprice, Integer page) {
        this.pname = pname;
        this.typeid = typeid;
        this.lprice = lprice;
        this.hprice = hprice;
        this.page = page;
    }
}