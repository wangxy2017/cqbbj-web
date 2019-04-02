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
     * 判断是否有值
     *
     * @param key
     * @return
     */
    public static int search(String key) {
        if (StringUtils.isNotBlank(key) && !sessions.isEmpty()) {
            for (int i = 0; i < sessions.size(); i++) {
                if (sessions.get(i).getKey().equals(key)) {
                    return i;
                }
            }
        }
        return -1;
    }

    /**
     * 添加数据
     *
     * @param key
     * @param value
     * @param time
     */
    public static void pushValue(String key, Object value, long time) {
        if (StringUtils.isNotBlank(key)) {
            // 如果有值，则替换
            int i = search(key);
            if (i > 0) {
                WXSession data = sessions.get(i);
                data.setValue(value);
                data.setTime(time);
            } else {
                WXSession data = new WXSession();
                data.setKey(key);
                data.setValue(value);
                data.setTime(time);
                sessions.add(data);
            }
        }
    }

    public static void pushValue(String key, Object value) {
        pushValue(key, value, DEFAULT_TIME);
    }

    /**
     * 移除数据
     *
     * @param key
     */
    public static void removeValue(String key) {
        if (StringUtils.isNotBlank(key)) {
            Iterator iterator = sessions.iterator();
            while (iterator.hasNext()) {
                WXSession data = (WXSession) iterator.next();
                if (data.getKey().equals(key)) {
                    iterator.remove();
                    break;
                }
            }
        }
    }

    /**
     * 获取数据
     *
     * @param key
     * @return
     */
    public static Object getValue(String key) {
        if (StringUtils.isNotBlank(key)) {
            Iterator iterator = sessions.iterator();
            while (iterator.hasNext()) {
                WXSession data = (WXSession) iterator.next();
                if (data.getKey().equals(key)) {
                    return data.getValue();
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
            WXSession data = (WXSession) iterator.next();
            data.timeMin(nums);
            if (data.timeStop()) {
                iterator.remove();
            }
        }
    }

    public static void timeMin() {
        timeMin(DEFAULT_STEP_TIME);
    }
}
