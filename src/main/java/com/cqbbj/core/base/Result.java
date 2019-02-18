/**
 * @Description: 返回结果实体(用一句话描述该文件做什么)
 * @author wangxy
 * @date 2019/1/15 11:26
 * @version V1.0
 */
package com.cqbbj.core.base;

public class Result {
    /**
     * 状态码
     */
    private Integer code;
    /**
     * 提示信息
     */
    private String msg;
    /**
     * 数据
     */
    private Object data;

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
