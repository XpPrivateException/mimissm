package com.bjpowernode.service.impl;


import com.bjpowernode.mapper.AdminMapper;
import com.bjpowernode.pojo.Admin;
import com.bjpowernode.pojo.AdminExample;
import com.bjpowernode.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 张阿荣
 * @version 1.0
 * @title: AdminServiceImpl
 * @projectName SSM_XiaoMi_5
 * @description:
 * @date 2019/11/28   11:16
 */
@Service
public class AdminServiceImpl implements AdminService {
    //spring框架为你提供mapper实现类的对象
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public String login(String name, String pwd) {
        String s="no";
        //根据用户名查用户对象回来，取出查回来的对象的密码和传来的密码对比，判断登录是否成功
        //创建条件封装的对象AdminExample
        AdminExample example=new AdminExample();
        //将用户名作为条件封装进AdminExample对象
        example.createCriteria().andANameEqualTo(name);

        List<Admin> list=adminMapper.selectByExample(example);
        if(list!=null && list.size()>0){
            Admin admin=list.get(0);
            if(pwd.equals(admin.getaPass())){
                s="ok";
            }
        }
        return s;
    }
}