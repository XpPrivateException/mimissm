import com.hzh.dao.ProductInfoDao;
import com.hzh.service.ProductInfoService;
import com.hzh.service.ProductTypeService;
import com.hzh.service.impl.ProductInfoServiceImpl;
import com.hzh.utils.MD5Util;
import com.hzh.vo.ProductInfoVo;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

public class MyTest {
    
    @Test
    public void test1(){
        //测试MD5加密
        String m = MD5Util.getMD5("000000");
        System.out.println(m);
        System.out.println(m.length());
    }
    
    @Test
    public void test2(){
        String config = "applicationContext.xml";
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext(config);
        System.out.println(applicationContext.getBean("productTypeService"));
    }
    
    @Test
    public void test3(){
        Date date = new Date();
        System.out.println(date);
        System.out.println(date.getTime());
        System.out.println(date.toString());
    }
    
    @Test
    public void test4(){
        String config = "applicationContext.xml";
        ApplicationContext ac = new ClassPathXmlApplicationContext(config);
        ProductInfoService service = (ProductInfoService) ac.getBean("productInfoServiceImpl");
        ProductInfoVo vo = new ProductInfoVo();
        vo.setPname("米");
        vo.setTypeid(1);
        vo.setLprice(1000);
        vo.setHprice(3000);
        System.out.println(service.selectCondition(vo));
    }
}
