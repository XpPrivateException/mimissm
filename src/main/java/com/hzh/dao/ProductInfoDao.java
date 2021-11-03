package com.hzh.dao;

import com.hzh.domain.ProductInfo;
import com.hzh.domain.ProductInfoExample;
import java.util.List;

import com.hzh.vo.ProductInfoVo;
import org.apache.ibatis.annotations.Param;

public interface ProductInfoDao {
    int countByExample(ProductInfoExample example);

    int deleteByExample(ProductInfoExample example);

    int deleteByPrimaryKey(Integer pId);

    int insert(ProductInfo record);

    int insertSelective(ProductInfo record);

    List<ProductInfo> selectByExample(ProductInfoExample example);

    ProductInfo selectByPrimaryKey(Integer pId);
    
    //条件查询
    List<ProductInfo> selectCondition(ProductInfoVo vo);

    int updateByExampleSelective(@Param("record") ProductInfo record, @Param("example") ProductInfoExample example);

    int updateByExample(@Param("record") ProductInfo record, @Param("example") ProductInfoExample example);

    int updateByPrimaryKeySelective(ProductInfo record);

    int updateByPrimaryKey(ProductInfo record);
}