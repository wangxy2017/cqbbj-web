import com.cqbbj.core.util.BizType;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.MD5Utils;
import com.cqbbj.entity.Employee;
import com.cqbbj.service.IEmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: EmployeeServiceTest
 * @Description: 员工测试(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring.xml", "classpath:config/spring-mybatis.xml"})
public class EmployeeServiceTest {

    @Autowired
    private IEmployeeService employeeService;

    @Test
    public void save() {
        for (int i = 0; i < 100; i++) {
            Employee employee = new Employee();
            employee.setCreateTime(new Date());
            employee.setDeleteStatus(0);
            employee.setAccount("cs" + i);
            employee.setPassword(MD5Utils.MD5Encode("123456"));
            employee.setName("测试员工" + i);
            employee.setPhone("110" + i);
            employee.setSex(0);
            employee.setIs_disabled(0);
            employee.setEmp_no(CommUtils.getCode(BizType.EMPLOYEE));
            employee.setDept_id(1);
            employee.setPosition_id(1);
            employee.setMoney(0.00D);
            employeeService.saveEntity(employee);
            System.out.println("保存成功：" + employee.getId());
        }
    }

    @Test
    public void update() {
        Employee employee = new Employee();
        employee.setId(1);
        employee.setName("修改员工");
        employeeService.updateEntity(employee);
        System.out.println("修改成功");
    }

    @Test
    public void delete() {
        employeeService.deleteEntity(1);
        System.out.println("删除成功");
    }

    @Test
    public void queryPageList() {
        PageModel<Employee> pageModel = employeeService.queryPageList(null, 1, 20);
        System.out.println("查询结果:" + pageModel.getList().size());
    }
}
