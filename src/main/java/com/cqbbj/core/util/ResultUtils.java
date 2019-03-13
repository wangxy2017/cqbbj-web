/**
 * @Description: 返回结果工具类(用一句话描述该文件做什么)
 * @author wangxy
 * @date 2019/1/15 12:22
 * @version V1.0
 */
package com.cqbbj.core.util;

import com.cqbbj.core.base.Result;

public class ResultUtils {

    /**
     * 返回成功状态
     *
     * @param data
     * @return
     */
    public static Result success(Object data) {
        Result result = new Result();
        result.setCode(1);
        result.setMsg("success");
        result.setData(data);
        return result;
    }

    public static Result success() {
        return success(null);
    }

    /**
     * 返回失败状态
     *
     * @param code
     * @param msg
     * @return
     */
    public static Result error(Integer code, String msg) {
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }

    public static Result error() {
        return error(-1, "error");
    }

    public static Result error(String msg) {
        return error(-1, msg);
    }
}
