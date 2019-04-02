package com.cqbbj.core.util;

import com.cqbbj.core.base.WXSession;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: WXSessionUtils
 * @Description: 微信SessionList(这里用一句话描述这个类的作用)
 * @date 2019/4/2 10:10
 */
public class WXSessionUtils {
    /**
     * 默认失效时间
     */
    public static final long DEFAULT_TIME = 30 * 60 * 1000;
    /**
     * 默认递减时间(一分钟)
     */
    public static final long DEFAULT_STEP_TIME = 60 * 1000;
    /**
     * session数据
     */
    private static ArrayList<WXSession> sessions = new ArrayList<>();

    /**
     * 根据userKey
     *
     * @param userKey
     * @return
     */
    public static WXSession getSession(String userKey) {
        if (StringUtils.isNotBlank(userKey) && !sessions.isEmpty()) {
            Iterator iterator = sessions.iterator();
            while (iterator.hasNext()) {
                WXSession session = (WXSession) iterator.next();
                if (session.getUserKey().equals(userKey)) {
                    return session;
                }
            }
        }
        return null;
    }

    /**
     * 设置超时数据并移除
     */
    public static void timeMin(long nums) {
        Iterator iterator = sessions.iterator();
        while (iterator.hasNext()) {
            WXSession session = (WXSession) iterator.next();
            session.timeMin(nums);
            if (session.timeStop()) {
                iterator.remove();
            }
        }
    }
}
