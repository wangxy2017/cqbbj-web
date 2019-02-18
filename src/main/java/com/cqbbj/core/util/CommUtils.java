package com.cqbbj.core.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 通用工具类
 */
public class CommUtils {
    /**
     * 自动生成随机code
     * 生成规则：业务类型（首字母大写2位） + 当前时间(毫秒级) + 4位随机数
     *
     * @param type 业务类型
     * @return
     */
    public static String getCode(String type) {
        if (type == null || type.equals("")) {
            return type;
        }
        // 获取毫秒级当前时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
        String time = df.format(new Date());
        String[] split = time.split("-|:");
        StringBuffer sb = new StringBuffer();
        for (String str :
                split) {
            sb.append(str);
        }
        String code1 = sb.toString().replace(" ", "");
        // 四位随机数，不足用0补齐
        String number = (int) (Math.random() * 1000) + "";
        String code2 = "";
        if (number.length() < 4) {
            for (int i = 0; i < 4 - number.length(); i++) {
                code2 = code2 + "0";
            }
            code2 = code2 + number;
        } else {
            code2 = number;
        }
        return type + code1 + code2;
    }

    /**
     * 字符串转整数数组
     *
     * @param data
     * @return
     */
    public static Integer[] toIntegerArray(String data) {
        if (data == null || data.trim().length() == 0) {
            return new Integer[0];
        }
        String[] split = data.split(",");
        // 遍历空值个数
        int count = 0;
        for (int i = 0; i < split.length; i++) {
            if ("".equals(split[i].trim())) {
                count++;
            }
        }
        // 转整形数组
        Integer[] temp = new Integer[split.length - count];
        int index = 0;
        for (int i = 0; i < split.length; i++) {
            if (!"".equals(split[i].trim())) {
                temp[index] = Integer.valueOf(split[i].trim());
                index++;
            }
        }
        return temp;
    }

    /**
     * 获取指定长度的随机数
     *
     * @param length
     * @return
     */
    public static String getRandomNumber(int length) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < length; i++) {
            sb.append((int) (Math.random() * 10));
        }
        return sb.toString();
    }
}
