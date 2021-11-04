package com.bjpowernode.controller;


import com.bjpowernode.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 张阿荣
 * @version 1.0
 * @title: AdminController
 * @projectName SSM_XiaoMi_5
 * @description:
 * @date 2019/11/28   11:44
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    //创建业务逻辑层的对象
    @Autowired
    private AdminService adminService;

      @RequestMapping("/login")
    public String login(String name, String pwd, Model model) {
        String s = adminService.login(name, pwd);
        if ("ok".equals(s)) {
            model.addAttribute("name", name);
            return "main";
        } else {
            model.addAttribute("errmsg", "用户名或密码不正确！");
            return "login";
        }
    }

}