import com.cqbbj.service.IIntentionOrderService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IntentionOrderServiceTest
 * @Description: 意向订单测试(这里用一句话描述这个类的作用)
 * @date 2019/3/26 14:03
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring.xml", "classpath:config/spring-mybatis.xml"})
public class IntentionOrderServiceTest {

    @Autowired
    private IIntentionOrderService intentionOrderService;

    @Test
    public void queryTotal(){
        Map<String, Object> map = intentionOrderService.queryTotal(null);
        System.out.println(map.size());
    }
}
