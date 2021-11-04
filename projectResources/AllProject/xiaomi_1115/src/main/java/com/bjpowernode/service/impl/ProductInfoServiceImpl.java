package com.bjpowernode.service.impl;

import com.bjpowernode.mapper.ProductInfoMapper;
import com.bjpowernode.pojo.ProductInfo;
import com.bjpowernode.pojo.ProductInfoExample;
import com.bjpowernode.pojo.vo.ProductVo;
import com.bjpowernode.service.ProductInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 张阿荣
 * @version 1.0
 * @title: ProductInfoServiceImpl
 * @projectName SSM_XiaoMi_5
 * @description:
 * @date 2019/11/29   9:56
 */
@Service
public class ProductInfoServiceImpl implements ProductInfoService {
    //由spring提供dao层对象的注入
    @Autowired
    private ProductInfoMapper pmapper;

    @Override
    public List<ProductInfo> getAll() {
        return pmapper.selectByExample(new ProductInfoExample());
    }

    @Override
    public ProductInfo getById(Integer pid) {
        return pmapper.selectByPrimaryKey(pid);
    }

    @Override
    public int save(ProductInfo info) {
        return pmapper.insert(info);
    }

    @Override
    public int delete(Integer pid) {
        int num=0;
        try {
            num = pmapper.deleteByPrimaryKey(pid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }

    @Override
    public int update(ProductInfo info) {
        return pmapper.updateByPrimaryKeySelective(info);
    }


    @Override
    public PageInfo splitPage(int page, int pageSize) {
        //商品分页一定会借助于PageHelper类，还要借助于ProductInfoExample
        ProductInfoExample example=new ProductInfoExample();
        //设置的字符串是字段名称和排序规则
        example.setOrderByClause("p_id desc");
        //切记切记：在取集合之前，使用分页工具设置当前页和每页的记录数
        PageHelper.startPage(page,pageSize);
        //取集合
        List<ProductInfo> list=pmapper.selectByExample(example);

        //将查到的集合封装进pageInfo
        PageInfo<ProductInfo> pageInfo=new PageInfo<>(list);

        return pageInfo;
    }

    @Override
    public PageInfo<ProductInfo> splitPageVo(ProductVo vo, int pageSize) {
        //切记切记：在取集合之前，使用分页插件一定要先设置当前页和每页的个数
        PageHelper.startPage(vo.getPage(),pageSize);
        //取集合
        List<ProductInfo> list=pmapper.selectConditionSplitPage(vo);

        return new PageInfo<>(list);
    }

    @Override
    public int deleteBatch(String[] pids) {
        return pmapper.deleteBatch(pids);
    }

//    @Override
//    public PageInfo<ProductInfo> splitPageVo(ProductVo vo, int pageSize) {
//        //切记切记：在取集合之前，使用分页工具设置当前页和每页的记录数
//        PageHelper.startPage(vo.getPage(),pageSize);
//        //取集合
//        List<ProductInfo> list=pmapper.selectConditionSplitPage(vo);
//
//        //将查到的集合封装进pageInfo
//        PageInfo<ProductInfo> pageInfo=new PageInfo<>(list);
//
//        return pageInfo;
//    }
}