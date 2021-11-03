package com.hzh.service;

import com.github.pagehelper.PageInfo;
import com.hzh.domain.ProductInfo;
import com.hzh.vo.ProductInfoVo;

import java.util.List;

public interface ProductInfoService {
    
    //显示全部商品
    List<ProductInfo> getAll();
    
    //分页查询
    PageInfo<ProductInfo> getPage(int pageNum, int pageSize);
    
    //新增商品
    int save(ProductInfo productInfo);
    
    //根据id查单挑
    ProductInfo getById(int id);
    
    //更新商品
    int update(ProductInfo productInfo);
    
    //删除单个商品
    int del(int id);
    
    List<ProductInfo> selectCondition(ProductInfoVo vo);
}
