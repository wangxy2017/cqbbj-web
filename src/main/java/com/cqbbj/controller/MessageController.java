package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.BaseEntity;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.MessageLog;
import com.cqbbj.service.IMessageLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: MessageController
 * @Description: 短信管理(这里用一句话描述这个类的作用)
 * @date 2019/3/20 15:53
 */
@Controller
@RequestMapping("/message")
public class MessageController extends BaseController {

    @Autowired
    private IMessageLogService messageLogService;// 短信日志

    /**
     * 短信日志界面跳转
     *
     * @return
     */
    @RequestMapping("/messageLog")
    public String messageLog() {
        return "message/messageLog";
    }

    /**
     * 短信日志列表
     *
     * @param messageLog
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(MessageLog messageLog, Integer pageNum, Integer pageSize) {
        PageModel<MessageLog> pageModel = messageLogService.queryPageList(messageLog, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }
}
