package com.cqbbj.core.base;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: WXSession
 * @Description: 微信session(这里用一句话描述这个类的作用)
 * @date 2019/4/2 10:00
 */
public class WXSession {
    /**
     * key值
     */
    private String key;
    /**
     * value值
     */
    private Object value;
    /**
     * 超时时间
     */
    private long time;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
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
