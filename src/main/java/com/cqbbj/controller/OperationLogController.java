package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.DateUtils;
import com.cqbbj.core.util.ExcelUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.OperationLog;
import com.cqbbj.entity.Order;
import com.cqbbj.service.IOperationLogService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

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

    /**
     * 导出日志
     *
     * @param request
     * @param response
     * @param operationLog
     */
    @RequestMapping("/download")
    public void download(HttpServletRequest request, HttpServletResponse response, OperationLog operationLog) {
        // 打印完成订单
        List<OperationLog> list = operationLogService.queryList(operationLog);
        String fileName = "系统操作日志.xls";
        String sheetName = "系统操作日志";
        String[] title = new String[]{"编号", "操作人", "操作内容", "IP来源", "操作时间"};
        String[][] values = new String[list.size()][5];
        int i = 0;
        for (OperationLog log : list) {
            values[i][0] = String.valueOf(log.getId());
            values[i][1] = log.getName();
            values[i][2] = log.getContent();
            values[i][3] = log.getIp();
            values[i][4] = DateUtils.formatDateTime(log.getCreateTime());
            i++;
        }
        // 记录日志
        OperationLog log = createLog(request, "导出操作日志");
        operationLogService.saveEntity(log);
        try {
            ExcelUtils.downloadExcel(fileName, sheetName, title, values, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
