package com.hzh.controller;

import com.github.pagehelper.PageInfo;
import com.hzh.domain.ProductInfo;
import com.hzh.service.ProductInfoService;
import com.hzh.utils.FileNameUtil;
import com.hzh.vo.ProductInfoVo;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/prod")
public class ProductInfoController {
    
    @Autowired
    private ProductInfoService productInfoService;
    
    //查询所有
    @RequestMapping("/getAll.action")
    public ModelAndView getAll(){
        ModelAndView mv = new ModelAndView();
        List<ProductInfo> productInfoList = productInfoService.getAll();
        mv.addObject("list",productInfoList);
        mv.setViewName("product");
        return mv;
    }
    
    //点击商品管理的分页查询
    @RequestMapping("/split.action")
    public ModelAndView getPage(String pageNum, String pageSize){
        ModelAndView mv = new ModelAndView();
        PageInfo<ProductInfo> info = productInfoService.getPage(
                //非空验证、初始化避免空指针
                Integer.parseInt(pageNum = (null == pageNum) ? "1": pageNum),
                Integer.parseInt(pageSize = (null == pageSize) ? "5": pageSize)
        );
        mv.addObject("info",info);
        mv.setViewName("product");
        return mv;
    }
    
    //分页查询
    @ResponseBody
    @RequestMapping("/ajaxsplit.action")
    public void ajaxsplit(int page, HttpSession session, HttpServletRequest request){
        //每页条数写死了，动态的话还要改前端，懒得弄了
        PageInfo<ProductInfo> info = productInfoService.getPage(page, 5);
        session.setAttribute("info",info);
    }
    
    //文件上传
    @ResponseBody
    @RequestMapping("/ajaxImg.action")
    public Object ajaxImg(MultipartFile pimage,HttpServletRequest request){
        //uuid.jsp/png的后缀
        String saveFileName = FileNameUtil.getUUIDFileName() + FileNameUtil.getFileType(pimage.getOriginalFilename());
        String imgName = pimage.getOriginalFilename();
        //图片路径
        String path = request.getServletContext().getRealPath("/image_big");
        //存储
        try {
            pimage.transferTo(new File(path + File.separator + saveFileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        //封装json对象
        JSONObject object = new JSONObject();
        object.put("imgurl",saveFileName);
        object.put("imgName",imgName);
        return object.toString();
    }
    
    //新增商品信息
    @RequestMapping("/save.action")
    public String save(ProductInfo productInfo,String pimageName,HttpServletRequest request){
        productInfo.setpDate(new Date());
        productInfo.setpImage(pimageName == null ? "" : pimageName);
        int count = productInfoService.save(productInfo);
        //根据结果选择不同的信息
        request.setAttribute("msg",1 == count ? "增加成功！": "增加失败，请联系管理员！");
        return "forward:/prod/split.action";
    }
    
    //根据id查单条
    @RequestMapping("/one.action")
    public ModelAndView one(int pid){
        ModelAndView mv = new ModelAndView();
        //封装数据
        mv.addObject("prod",productInfoService.getById(pid));
        mv.setViewName("update");
        return mv;
    }
    
    //更新商品
    @RequestMapping("/update.action")
    public String update(ProductInfo productInfo, HttpServletRequest request){
        int count = productInfoService.update(productInfo);
        request.setAttribute("msg",1 == count ? "修改成功！": "修改失败，请联系管理员！");
        return "forward:/prod/split.action";
    }
    
    //删除商品
    @RequestMapping("/delete.action")
    public String del(HttpServletRequest request){
        
        int count = productInfoService.del(Integer.parseInt(request.getParameter("pid")));
        
        request.setAttribute("msg",1 == count ? "删除成功！": "删除失败，请联系管理员！");
        
        return "forward:/prod/split.action";
    }
    
    //批量删除
    @RequestMapping("deletebatch.action")
    public String deletebatch(String[] str, HttpServletRequest request){
        //String[] deleteIds = request.getParameterValues("str");
        //循环复用单条删除即可，
        String msg = "删除成功！";
        for (String id : str) {
            if(1 != productInfoService.del(Integer.parseInt(id))){
                //说明删除这条信息失败了，直接返回错误消息即可
                msg = "删除失败，请联系管理员！";
                break;
            }
        }
        //程序执行到这，说明删除成功
        request.setAttribute("msg", msg);
        return "forward:/prod/split.action";
    }
    
    //条件查询
    @RequestMapping("/condition.action")
    public void condition(ProductInfoVo vo,HttpSession session){
        List<ProductInfo> list = productInfoService.selectCondition(vo);
        session.setAttribute("list",list);
    }
}
