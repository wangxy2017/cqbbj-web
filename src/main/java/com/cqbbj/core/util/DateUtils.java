/**
 * @Description: 时间工具类(用一句话描述该文件做什么)
 * @author wangxy
 * @date 2019/1/28 16:38
 * @version V1.0
 */
package com.cqbbj.core.util;

import java.text.SimpleDateFormat;
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

    /**
     * 时间戳转字符串年月日时分秒
     *
     * @param date
     * @return
     */
    public static String formatDateTime(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date == null ? new Date() : date);
    }

    /**
     * 时间戳转字符串年月日
     *
     * @param date
     * @return
     */
    public static String formatDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date == null ? new Date() : date);
    }
}
