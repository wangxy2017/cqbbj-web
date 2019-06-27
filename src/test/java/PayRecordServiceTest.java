import com.cqbbj.core.util.BizType;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.entity.PayRecord;
import com.cqbbj.service.IPayRecordService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: PayRecordServiceTest
 * @Description: 员工测试(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring.xml", "classpath:config/spring-mybatis.xml"})
public class PayRecordServiceTest {

    @Autowired
    private IPayRecordService payRecordService;

    @Test
    public void save() {
        for (int i = 0; i < 1000; i++) {
            PayRecord payRecord = new PayRecord();
            payRecord.setOrder_no(CommUtils.getCode(BizType.ORDER));
            payRecord.setCust_no("CO201903081645060770237");
            payRecord.setPayWay(1);
            payRecord.setPayMoney(100.00D);
            payRecord.setPayTime(new Date());
            payRecord.setRecord_no(CommUtils.getCode(BizType.PAY_RECORD));
            payRecord.setTrans_no(CommUtils.getCode("TS"));
            payRecord.setEmp_no("EP201903051725529700609");
            payRecordService.saveEntity(payRecord);
            System.out.println("保存成功：" + payRecord.getId());
        }
    }
}
