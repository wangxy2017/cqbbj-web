import com.cqbbj.core.util.CommUtils;
import com.cqbbj.entity.Order;
import com.cqbbj.service.IOrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: OrderServiceTest
 * @Description: 订单测试(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring.xml", "classpath:config/spring-mybatis.xml"})
public class OrderServiceTest {

    @Autowired
    private IOrderService orderService;

    @Test
    public void save() {
        for (int i = 0; i < 100; i++) {
            Order order = new Order();
            order.setName("张三");
            order.setPhone("18883669894");
            order.setStart("武当山" + i);
            order.setEnd("峨眉山" + i);
            order.setPrice(1000.00D);
            order.setBeginTime(new Date());
            order.setContent("武当" + i + "侠");
            order.setIs_notice(1);
            order.setStartMap("123" + i);
            order.setEndMap("213" + i);

            order.setCreateTime(new Date());
            order.setDeleteStatus(0);
            order.setCompany_no("sdfsdfsdf");
            order.setStatus(0);
            order.setOrder_no(CommUtils.getCode("DT"));

            orderService.saveEntity(order);
            System.out.println("保存成功：" + order.getId());
        }
    }

    @Test
    public void update() {
        Order Order = new Order();
        Order.setId(1);
        Order.setName("修改订单");
        orderService.updateEntity(Order);
        System.out.println("修改成功");
    }

    @Test
    public void delete() {
        orderService.deleteEntity(1);
        System.out.println("删除成功");
    }

    @Test
    public void deleteActive() {
        orderService.deleteEntityActive(2);
        System.out.println("逻辑删除成功");
    }
}
