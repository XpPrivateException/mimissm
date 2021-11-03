package com.hzh.listener;

import com.hzh.domain.ProductType;
import com.hzh.service.ProductTypeService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

public class ProductTypeListener implements ServletContextListener {
    
    //依赖注入会导致空指针
    //@Autowired
    private ProductTypeService productTypeService;
    
    //在初始化该类时，进行赋值实现自动注入
    public ProductTypeListener() {
        String config = "applicationContext.xml";
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext(config);
        productTypeService = (ProductTypeService) applicationContext.getBean("productTypeService");
    }
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
       ///获取商品类别，存入全局作用域
        List<ProductType> typeList = productTypeService.getAll();
        sce.getServletContext().setAttribute("typeList",typeList);
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
