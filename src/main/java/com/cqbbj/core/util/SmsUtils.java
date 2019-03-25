package com.cqbbj.core.util;

import org.apache.commons.lang3.StringUtils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.List;
import java.util.Set;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: SmsUtils
 * @Description: 短信工具类(这里用一句话描述这个类的作用)
 * @date 2019/3/5 14:16
 */
public class SmsUtils {

    private static String username = "";// 在短信宝注册的用户名
    private static String password = "";// 在短信宝注册的密码
    private static String sign = "";// 注意测试时，也请带上公司简称或网站签名，发送正规内容短信。千万不要发送无意义的内容：例如 测一下、您好。否则可能会收不到
    private static String domain = "";// 接口地址

    /**
     * 初始化参数
     *
     * @param username
     * @param password
     * @param sign
     * @param domain
     */
    public static void config(String username, String password, String sign, String domain) {
        SmsUtils.username = username;
        SmsUtils.password = password;
        SmsUtils.sign = sign;
        SmsUtils.domain = domain;
    }

    /**
     * 批量发送
     *
     * @param phones
     * @param content
     */
    public static void sendSmsBatch(Set<String> phones, String content) {
        if (!phones.isEmpty() && StringUtils.isNotBlank(content)) {
            String text = "";
            for (String phone : phones) {
                text += phone + ",";
            }
            sendSms(text.substring(0, text.length() - 1), content);
        }
    }

    /**
     * 单条发送
     *
     * @param phone
     * @param content
     */
    public static void sendSms(String phone, String content) {
        if (StringUtils.isBlank(username) || StringUtils.isBlank(password) || StringUtils.isBlank(sign) || StringUtils.isBlank(domain)) {
            throw new RuntimeException("参数错误");
        }
        if (StringUtils.isNotBlank(phone) && StringUtils.isNotBlank(content)) {
            StringBuffer httpArg = new StringBuffer();
            httpArg.append("u=").append(username).append("&");
            httpArg.append("p=").append(md5(password)).append("&");
            httpArg.append("m=").append(phone).append("&");
            httpArg.append("c=").append(encodeUrlString("【" + sign + "】" + content, "UTF-8"));

            String result = request(domain, httpArg.toString());
            System.out.println(result);
        }

    }

    public static String request(String httpUrl, String httpArg) {
        BufferedReader reader = null;
        String result = null;
        StringBuffer sbf = new StringBuffer();
        httpUrl = httpUrl + "?" + httpArg;

        try {
            URL url = new URL(httpUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.connect();
            InputStream is = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            String strRead = reader.readLine();
            if (strRead != null) {
                sbf.append(strRead);
                while ((strRead = reader.readLine()) != null) {
                    sbf.append("\n");
                    sbf.append(strRead);
                }
            }
            reader.close();
            result = sbf.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static String md5(String plainText) {
        StringBuffer buf = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(plainText.getBytes());
            byte b[] = md.digest();
            int i;
            buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return buf.toString();
    }

    public static String encodeUrlString(String str, String charset) {
        String strret = null;
        if (str == null)
            return str;
        try {
            strret = java.net.URLEncoder.encode(str, charset);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return strret;
    }
}
