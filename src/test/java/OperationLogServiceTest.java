import com.cqbbj.entity.OperationLog;
import com.cqbbj.service.IOperationLogService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: OperationLogServiceTest
 * @Description: 操作日志测试(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:01
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring.xml", "classpath:config/spring-mybatis.xml"})
public class OperationLogServiceTest {

    @Autowired
    private IOperationLogService operationLogService;

    @Test
    public void save() {
        for (int i = 0; i < 1000; i++) {
            OperationLog log = new OperationLog();
            log.setCreateTime(new Date());
            log.setDeleteStatus(0);
            log.setName("王小源");
            log.setContent("测试" + i);
            log.setIp("127.0.0.1");
            operationLogService.saveEntity(log);
            System.out.println("保存成功：" + log.getId());
        }
    }
}
