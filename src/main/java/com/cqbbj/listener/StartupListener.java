package com.cqbbj.listener;

import com.cqbbj.core.util.WXSessionUtils;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: StartupListener
 * @Description: 应用启动监听(这里用一句话描述这个类的作用)
 * @date 2019/4/2 12:01
 */
@Component("startupListener")
public class StartupListener implements ApplicationListener<ContextRefreshedEvent> {
    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        if (event.getApplicationContext().getParent() == null) {
            // 启动定时任务
            Thread thread = new Thread() {
                public void run() {
                    while (true) {
                        try {
                            Thread.sleep(WXSessionUtils.DEFAULT_STEP_TIME);
                            WXSessionUtils.timeMin(WXSessionUtils.DEFAULT_STEP_TIME);
                        } catch (InterruptedException e) {
                            e.printStackTrace();
                        }
                    }
                }
            };
            thread.start();
        }
    }
}
