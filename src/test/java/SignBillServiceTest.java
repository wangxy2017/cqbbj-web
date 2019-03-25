import com.cqbbj.core.util.ConstantUtils;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.entity.SignBill;
import com.cqbbj.service.ISignBillService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: SignBillServiceTest
 * @Description: 欠条测试(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring.xml", "classpath:config/spring-mybatis.xml"})
public class SignBillServiceTest {

    @Autowired
    private ISignBillService signBillService;

    @Test
    public void save() {
        for (int i = 0; i < 1000; i++) {
            SignBill signBill = new SignBill();
            signBill.setName("张三" + i);
            signBill.setPhone("18883669894");
            signBill.setStart("重庆市石桥铺南方花园C-" + i + "区");
            signBill.setEnd("重庆市美茵河谷A" + i + "区");
            signBill.setContent(i + "个电视柜");
            signBill.setBeginTime(new Date());
            signBill.setPrice(1000D);
            signBill.setEndTime(new Date());
            signBill.setReceiveMoney(1000D);
            signBill.setEmp_no("EP201903042023137020919");
            signBill.setStatus(1);
            signBill.setOrder_no("DT201903101543537460528");
            signBill.setCustomer_no("CO201903101548241810463");
            signBill.setBill_no(CommUtils.getCode(ConstantUtils.SIGN_BILL));
            signBillService.saveEntity(signBill);
            System.out.println("保存成功：" + signBill.getId());
        }
    }
}
