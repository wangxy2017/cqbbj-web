import com.cqbbj.entity.Salary;
import com.cqbbj.service.ISalaryService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: SalaryServiceTest
 * @Description: 工资测试(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring.xml", "classpath:config/spring-mybatis.xml"})
public class SalaryServiceTest {

    @Autowired
    private ISalaryService salaryService;

    @Test
    public void save() {
        for (int i = 0; i < 1000; i++) {
            Salary salary = new Salary();
            salary.setEmp_no("EP201903051725529700609");
            salary.setBase_money(10000D);
            salary.setProfit_money(30000D);
            salary.setOther_money(-35000D);
            salary.setReal_money(5000D);
            salary.setRemark("测试" + i);
            salary.setYear(2019);
            salary.setMonth(5);
            salary.setSalary_no("SA");
            salaryService.saveEntity(salary);
            System.out.println("保存成功：" + salary.getId());
        }
    }
}
