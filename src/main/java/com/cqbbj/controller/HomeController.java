package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Notice;
import com.cqbbj.service.INoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: HomeController
 * @Description: 系统主页(这里用一句话描述这个类的作用)
 * @date 2019/3/25 14:50
 */
@Controller
@RequestMapping("/home")
public class HomeController extends BaseController {

    @Autowired
    private INoticeService noticeService;// 系统公告

    /**
     * 系统公告
     *
     * @return
     */
    @RequestMapping("/noticePage")
    public String noticePage() {
        return "home/noticePage";
    }

    /**
     * 查询系统公告
     *
     * @return
     */
    @RequestMapping("/queryNotices")
    @ResponseBody
    public Result queryNotices() {
        Notice notice = new Notice();
        notice.setStatus(1);
        PageModel<Notice> pageModel = noticeService.queryPageList(notice, 1, 20);
        return ResultUtils.success(pageModel.getList());
    }
}
