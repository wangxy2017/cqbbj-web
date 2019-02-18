/**
 * @Description: 时间工具类(用一句话描述该文件做什么)
 * @author wangxy
 * @date 2019/1/28 16:38
 * @version V1.0
 */
package com.cqbbj.core.util;

import java.util.Date;

public class DateUtils {

    /**
     * 计算数分钟后的时间
     *
     * @param min
     * @return
     */
    public static Date getAfterDateByMin(int min) {
        return new Date(System.currentTimeMillis() + min * 60 * 1000);
    }
}
