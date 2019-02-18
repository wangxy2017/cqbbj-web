import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.entity.Company;
import com.cqbbj.service.ICompanyService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CompanyServiceTest
 * @Description: 公司测试(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring.xml", "classpath:config/spring-mybatis.xml"})
public class CompanyServiceTest {

    @Autowired
    private ICompanyService companyService;

    @Test
    public void save() {
        for (int i = 0; i < 100; i++) {
            Company company = new Company();
            company.setCreateTime(new Date());
            company.setDeleteStatus(0);
            company.setCompany_no(CommUtils.getCode("CO"));
            company.setName("测试公司" + i);
            company.setAddress("北京中关村" + i);
            company.setTelephone("110" + i);
            company.setCredit_code("11111111111111111");
            company.setIs_disabled(0);
            companyService.saveEntity(company);
            System.out.println("保存成功：" + company.getId());
        }
    }

    @Test
    public void update() {
        Company company = new Company();
        company.setId(1);
        company.setName("修改公司");
        companyService.updateEntity(company);
        System.out.println("修改成功");
    }

    @Test
    public void delete() {
        companyService.deleteEntity(1);
        System.out.println("删除成功");
    }

    @Test
    public void queryPageList() {
        PageModel<Company> pageModel = companyService.queryPageList(null, 0, 10);
        System.out.println(pageModel.getList().size());
    }
}
