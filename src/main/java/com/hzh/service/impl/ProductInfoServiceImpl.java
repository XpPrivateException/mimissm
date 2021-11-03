package com.hzh.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzh.dao.ProductInfoDao;
import com.hzh.domain.ProductInfo;
import com.hzh.domain.ProductInfoExample;
import com.hzh.service.ProductInfoService;
import com.hzh.vo.ProductInfoVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductInfoServiceImpl implements ProductInfoService {
    
    @Autowired
    private ProductInfoDao productInfoDao;
    
    //查询所有
    @Override
    public List<ProductInfo> getAll() {
        return productInfoDao.selectByExample(new ProductInfoExample());
    }
    
    //分页查询
    @Override
    public PageInfo<ProductInfo> getPage(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        ProductInfoExample example = new ProductInfoExample();
        //按主键降序排序
        example.setOrderByClause("p_id desc");
        List<ProductInfo> list = productInfoDao.selectByExample(example);
        //返回分页对象
        return new PageInfo<ProductInfo>(list);
    }
    
    //新增商品
    @Override
    public int save(ProductInfo productInfo) {
        return productInfoDao.insert(productInfo);
    }
    
    //根据id查单条
    @Override
    public ProductInfo getById(int id) {
        return productInfoDao.selectByPrimaryKey(id);
    }
    
    //更新
    @Override
    public int update(ProductInfo productInfo) {
        return productInfoDao.updateByPrimaryKey(productInfo);
    }
    
    //删除单条
    @Override
    public int del(int id) {
        return productInfoDao.deleteByPrimaryKey(id);
    }
    
    //条件查询
    @Override
    public List<ProductInfo> selectCondition(ProductInfoVo vo){
        return productInfoDao.selectCondition(vo);
    }
    
}
