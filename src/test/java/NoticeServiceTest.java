import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.ConstantUtils;
import com.cqbbj.core.util.MD5Utils;
import com.cqbbj.entity.Notice;
import com.cqbbj.service.INoticeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: NoticeServiceTest
 * @Description: 公告测试(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring.xml", "classpath:config/spring-mybatis.xml"})
public class NoticeServiceTest {

    @Autowired
    private INoticeService noticeService;

    @Test
    public void save() {
        for (int i = 0; i < 100; i++) {
            Notice notice = new Notice();
            notice.setCreateTime(new Date());
            notice.setDeleteStatus(0);
            notice.setTitle("测试公告" + i);
            notice.setContent("测试内容===================" + i);
            notice.setStatus(0);
            notice.setEmp_no("EP201903051725529700609");
            noticeService.saveEntity(notice);
            System.out.println("保存成功：" + notice.getId());
        }
    }
}
