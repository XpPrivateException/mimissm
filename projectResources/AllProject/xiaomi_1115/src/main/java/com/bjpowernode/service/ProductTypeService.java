package com.bjpowernode.service;



import com.bjpowernode.pojo.ProductType;

import java.util.List;

/**
 * @Description:
 * @Auther: zar
 * @Date: 2020/8/31 0031 14:10
 * version: 1.0
 */
public interface ProductTypeService {
   //完成查询全部商品类型的功能
    public List<ProductType> getAllType();

}
