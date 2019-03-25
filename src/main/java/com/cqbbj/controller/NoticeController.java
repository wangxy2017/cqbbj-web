package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Notice;
import com.cqbbj.entity.OperationLog;
import com.cqbbj.service.INoticeService;
import com.cqbbj.service.IOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: NoticeController
 * @Description: 公告控制层(这里用一句话描述这个类的作用)
 * @date 2019/2/21 16:24
 */
@Controller
@RequestMapping("/notice")
public class NoticeController extends BaseController {

    @Autowired
    private INoticeService noticeService;// 公告业务层
    @Autowired
    private IOperationLogService operationLogService;// 操作日志

    /**
     * 公告页面
     *
     * @param
     * @param
     * @return
     */
    @RequestMapping("/notice")
    public String notice() {
        return "/notice/notice";
    }

    /**
     * 公告新增页面
     *
     * @param
     * @param
     * @return
     */
    @RequestMapping("/noticeAdd")
    public String noticeAdd() {
        return "/notice/noticeAdd";
    }

    /**
     * 公告修改页面
     *
     * @param
     * @param
     * @return
     */
    @RequestMapping("/noticeUpdate")
    public String noticeUpdate() {
        return "/notice/noticeUpdate";
    }

    /**
     * 根据ID查询公告信息
     *
     * @param
     * @param
     * @return
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Result queryById(Integer id) {
        Notice notice = noticeService.queryById(id);
        return ResultUtils.success(notice);
    }

    /**
     * 新增公告
     *
     * @param notice
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(HttpServletRequest request, Notice notice) {
        notice.setStatus(0);
        notice.setEmp_no(getLoginUser(request).getEmp_no());
        noticeService.saveEntity(notice);
        // 记录日志
        operationLogService.saveEntity(
                createLog(request, "发布公告：" + notice.getTitle()));
        return ResultUtils.success();
    }

    /**
     * 修改公告信息
     *
     * @param request
     * @param notice
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(HttpServletRequest request, Notice notice) {
        noticeService.updateEntity(notice);
        // 记录日志
        operationLogService.saveEntity(
                createLog(request, "修改公告信息：" + notice.getTitle()));
        return ResultUtils.success();
    }

    /**
     * 分页查询
     *
     * @param notice
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(Notice notice, Integer pageNum, Integer pageSize) {
        PageModel<Notice> pageModel = noticeService.queryPageList(notice, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }

    /**
     * 物理删除
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(Integer id) {
        noticeService.deleteEntity(id);
        return ResultUtils.success();
    }

    /**
     * 推送公告
     *
     * @param id
     * @return
     */
    @RequestMapping("/push")
    @ResponseBody
    public Result push(HttpServletRequest request, Integer id) {
        Notice notice = noticeService.queryById(id);
        if (notice != null) {
            log.debug("推送公告");
            // 更新状态
            notice.setStatus(1);
            noticeService.updateEntity(notice);
            // 记录日志
            OperationLog log = createLog(request, "推送公告" + notice.getTitle());
            operationLogService.saveEntity(log);
            return ResultUtils.success();
        }
        return ResultUtils.error();
    }
}
