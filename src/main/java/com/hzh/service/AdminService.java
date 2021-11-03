package com.hzh.service;

import com.hzh.domain.Admin;

public interface AdminService {
    
    //用户登录
    Admin login(String name, String pwd);
}
