package com.hzh.service.impl.impl;

import com.hzh.dao.ProductTypeDao;
import com.hzh.domain.ProductType;
import com.hzh.domain.ProductTypeExample;
import com.hzh.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("productTypeService")
public class ProductTypeServiceImpl implements ProductTypeService {
    
    @Autowired
    private ProductTypeDao productTypeDao;
    
    //查询所有商品类别
    @Override
    public List<ProductType> getAll() {
        return productTypeDao.selectByExample(new ProductTypeExample());
    }
}
