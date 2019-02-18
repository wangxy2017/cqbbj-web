import com.cqbbj.entity.Menu;
import com.cqbbj.service.IMenuService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: MenuServiceTest
 * @Description: 菜单测试(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring.xml", "classpath:config/spring-mybatis.xml"})
public class MenuServiceTest {

    @Autowired
    private IMenuService menuService;

    @Test
    public void save() {
        for (int i = 0; i < 100; i++) {
            Menu menu = new Menu();
            menu.setCreateTime(new Date());
            menu.setDeleteStatus(0);
            menu.setCompany_no("123");
            menu.setName("测试菜单" + i);
            menu.setPid(0);
            menu.setIs_disabled(0);
            menu.setSort(0);
            menuService.saveEntity(menu);
            System.out.println("保存成功：" + menu.getId());
        }
    }

    @Test
    public void update() {
        Menu menu = new Menu();
        menu.setId(1);
        menu.setName("修改菜单");
        menuService.updateEntity(menu);
        System.out.println("修改成功");
    }

    @Test
    public void delete() {
        menuService.deleteEntity(1);
        System.out.println("删除成功");
    }
}
