package com.cqbbj.core.base;

import java.util.HashMap;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: WXSession
 * @Description: 微信session(这里用一句话描述这个类的作用)
 * @date 2019/4/2 10:00
 */
public class WXSession extends HashMap<String, Object> {
    /**
     * 获取用户对应session
     */
    private String userKey;
    /**
     * 超时时间
     */
    private long time;

    public String getUserKey() {
        return userKey;
    }

    public void setUserKey(String userKey) {
        this.userKey = userKey;
    }

    public long getTime() {
        return time;
    }

    public void setTime(long time) {
        this.time = time;
    }

    /**
     * 计时器
     */
    public void timeMin(long nums) {
        time = time - nums;
    }

    /**
     * 判断计时器是否停止
     *
     * @return
     */
    public boolean timeStop() {
        return time <= 0;
    }
}
