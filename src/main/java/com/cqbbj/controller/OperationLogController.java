package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.OperationLog;
import com.cqbbj.service.IOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: OperationLogController
 * @Description: 操作日志控制层(这里用一句话描述这个类的作用)
 * @date 2019/3/4 16:08
 */
@RequestMapping("/operationLog")
@Controller
public class OperationLogController extends BaseController {

    @Autowired
    private IOperationLogService operationLogService;// 操作日志

    /**
     * 操作日志页面跳转
     *
     * @return
     */
    @RequestMapping("/operationLog")
    public String operationLog() {
        return "operationLog/operationLog";
    }

    /**
     * 查询操作日志
     *
     * @param operationLog
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(OperationLog operationLog, Integer pageNum, Integer pageSize) {
        PageModel<OperationLog> pageModel = operationLogService.queryPageList(operationLog, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }
}
