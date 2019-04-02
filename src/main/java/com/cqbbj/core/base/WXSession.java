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
    private long outTime;

    public String getUserKey() {
        return userKey;
    }

    public void setUserKey(String userKey) {
        this.userKey = userKey;
    }

    public long getOutTime() {
        return outTime;
    }

    public void setOutTime(long outTime) {
        this.outTime = outTime;
    }

    /**
     * session 计时器
     */
    public void timeMin(long time) {
        outTime = outTime - time;
    }

    /**
     * 判断计时器是否停止
     *
     * @return
     */
    public boolean timeStop() {
        return outTime <= 0;
    }
}
