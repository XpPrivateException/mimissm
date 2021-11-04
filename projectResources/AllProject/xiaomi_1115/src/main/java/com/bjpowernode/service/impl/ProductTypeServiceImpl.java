package com.bjpowernode.service.impl;


import com.bjpowernode.mapper.ProductTypeMapper;
import com.bjpowernode.pojo.ProductType;
import com.bjpowernode.pojo.ProductTypeExample;
import com.bjpowernode.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description:
 * @Auther: zar
 * @Date: 2020/8/31 0031 14:12
 * version: 1.0
 */
@Service("ProductTypeServiceImpl")
public class ProductTypeServiceImpl implements ProductTypeService {
    //必有数据访问层的mapper对象

    @Autowired
    private ProductTypeMapper typeMapper;

    @Override
    public List<ProductType> getAllType() {
        return typeMapper.selectByExample(new ProductTypeExample());
    }
}
