package com.hzh.service.impl;

import com.hzh.dao.AdminDao;
import com.hzh.domain.Admin;
import com.hzh.domain.AdminExample;
import com.hzh.service.AdminService;
import com.hzh.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{
    
    @Autowired
    private AdminDao adminDao;
    
    @Override
    public Admin login(String name, String pwd) {
        AdminExample adminExample = new AdminExample();
        //添加name查询条件
        adminExample.createCriteria().andANameEqualTo(name);
        List<Admin> adminList = adminDao.selectByExample(adminExample);
        //提取出查询到的Admin
        Admin admin = (adminList == null ? null : adminList.get(0));
        //对比姓名密码，错误则返回空
        if(null != admin && admin.getaPass().equals( MD5Util.getMD5(pwd))){
            return admin;
        }
        return null;
    }
}
