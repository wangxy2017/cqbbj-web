package com.cqbbj.core.util;

import com.cqbbj.core.base.WXSession;

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
     * session数据
     */
    private static ArrayList<WXSession> sessions = new ArrayList<>();

    /**
     * 获取session
     *
     * @param userKey
     * @return
     */
    public static WXSession getSession(String userKey) {
        // 判断参数
        if (userKey == null || userKey.equals("")) {
            throw new RuntimeException("userKey参数错误");
        }
        WXSession session = null;
        Iterator iterator = sessions.iterator();
        while (iterator.hasNext()) {
            WXSession s = (WXSession) iterator.next();
            if (session.getUserKey().equals(userKey)) {
                session = s;
                break;
            }
        }
        if (session == null) {
            WXSession newSession = new WXSession();
            newSession.setUserKey(userKey);
            newSession.setOutTime(DEFAULT_TIME);
            sessions.add(newSession);
        }
        return session;
    }

    /**
     * 移除session
     *
     * @param userKey
     */
    public static void delSession(String userKey) {
        // 判断参数
        if (userKey == null || userKey.equals("")) {
            throw new RuntimeException("userKey参数错误");
        }
        Iterator iterator = sessions.iterator();
        while (iterator.hasNext()) {
            WXSession session = (WXSession) iterator.next();
            if (session.getUserKey().equals(userKey)) {
                iterator.remove();
            }
        }
    }

    /**
     * session 计时
     */
    public static void timeMin(long time) {
        Iterator iterator = sessions.iterator();
        while (iterator.hasNext()) {
            WXSession session = (WXSession) iterator.next();
            session.setOutTime(session.getOutTime() - time);
            if (session.getOutTime() <= 0) {
                iterator.remove();
            }
        }
    }
}
