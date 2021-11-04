package com.bjpowernode.service;

import com.bjpowernode.pojo.ProductInfo;
import com.bjpowernode.pojo.vo.ProductVo;
import com.github.pagehelper.PageInfo;


import java.util.List;

/**
 * @author 张阿荣
 * @version 1.0
 * @title: ProductInfoService
 * @projectName SSM_XiaoMi_5
 * @description:
 * @date 2019/11/29   9:49
 */
public interface ProductInfoService {
    //查所有
    public List<ProductInfo> getAll();
    //根据主键查商品
    public ProductInfo getById(Integer pid);
    //增加
    public int save(ProductInfo info);
    //删除
    public int delete(Integer pid);
    //修改
    public int update(ProductInfo info);
    //分页
    public PageInfo splitPage(int page, int pageSize);
//多条件分页查询
    public PageInfo<ProductInfo> splitPageVo(ProductVo vo, int pageSize);
    //批量删除
    public int deleteBatch(String[] pids);
}
