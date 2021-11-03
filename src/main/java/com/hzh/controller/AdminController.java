package com.hzh.controller;

import com.hzh.domain.Admin;
import com.hzh.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private AdminService adminService;
    
    //登录判断
    @RequestMapping("/login.action")
    public ModelAndView login(String name, String pwd){
        ModelAndView mv = new ModelAndView();
        Admin admin = adminService.login(name,pwd);
        if(null != admin){
            //登录成功
            mv.addObject("admin",admin);
            mv.setViewName("main");
        }else{
            //登录失败
            mv.addObject("errmsg","用户名或密码不正确！");
            mv.setViewName("login");
        }
        return mv;
    }
}
