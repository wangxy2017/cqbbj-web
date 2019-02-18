import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.entity.MoneyDetail;
import com.cqbbj.service.IMoneyDetailService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: MoneyDetailServiceTest
 * @Description: 收支明细测试(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring.xml", "classpath:config/spring-mybatis.xml"})
public class MoneyDetailServiceTest {

    @Autowired
    private IMoneyDetailService moneyDetailService;

    @Test
    public void save() {
        for (int i = 0; i < 1000; i++) {
            MoneyDetail moneyDetail = new MoneyDetail();
            moneyDetail.setCreateTime(new Date());
            moneyDetail.setDeleteStatus(0);
            moneyDetail.setCompany_no("123");
            moneyDetail.setEmp_no("sdf");
            moneyDetail.setType(0);
            moneyDetail.setMoney(100.00D);
            moneyDetail.setRemark("测试数据" + i);
            moneyDetailService.saveEntity(moneyDetail);
            System.out.println("保存成功：" + moneyDetail.getId());
        }
    }

    @Test
    public void queryPageList() {
        PageModel<MoneyDetail> pageModel = moneyDetailService.queryPageList(null, 1, 30);
        System.out.println("查询结果:" + pageModel.getList().size());
    }
}
