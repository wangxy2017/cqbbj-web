import com.cqbbj.core.util.BizType;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.entity.OrderDivide;
import com.cqbbj.service.IOrderDivideService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: OrderDivideServiceTest
 * @Description: 提成统计测试(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring.xml", "classpath:config/spring-mybatis.xml"})
public class OrderDivideServiceTest {

    @Autowired
    private IOrderDivideService orderDivideService;

    @Test
    public void save() {
        for (int i = 0; i < 1000; i++) {
            OrderDivide orderDivide = new OrderDivide();
            orderDivide.setCreateTime(new Date());
            orderDivide.setDeleteStatus(0);
            orderDivide.setEmp_no("EP201903042023137020919");
            orderDivide.setOrder_no("DT201903100953124600009");
            orderDivide.setOrder_price(100);
            orderDivide.setType("工时提成");
            orderDivide.setMoney(15);
            orderDivide.setClean_time(new Date());
            orderDivide.setOperator_no("EP201903051725529700609");
            orderDivide.setDivide_no(CommUtils.getCode(BizType.ORDER_DIVIDE));
            orderDivideService.saveEntity(orderDivide);
            System.out.println("保存成功：" + orderDivide.getId());
        }
    }
}
