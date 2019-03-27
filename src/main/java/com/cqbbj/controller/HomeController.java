package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Notice;
import com.cqbbj.entity.OperateData;
import com.cqbbj.entity.Order;
import com.cqbbj.service.IIntentionOrderService;
import com.cqbbj.service.INoticeService;
import com.cqbbj.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
    @Autowired
    private IIntentionOrderService intentionOrderService;// 意向订单
    @Autowired
    private IOrderService orderService;// 订单

    /**
     * 我的主页
     *
     * @return
     */
    @RequestMapping("/welcome")
    public String welcome() {
        return "home/welcome";
    }

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
     * 经营数据
     *
     * @return
     */
    @RequestMapping("/operateData")
    public String operateData() {
        return "home/operateData";
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

    /**
     * 查询经营数据
     *
     * @param startTime
     * @param endTime
     * @return
     */
    @RequestMapping("/queryData")
    @ResponseBody
    public Result queryData(Date startTime, Date endTime) {
        OperateData data = new OperateData();
        Map<String, Object> params = new HashMap<>();
        params.put("startTime", startTime);
        params.put("endTime", endTime);
        // 意向订单
        Map<String, Object> map = intentionOrderService.queryTotal(params);
        data.setIntention((Long) map.get("f1"));
        data.setIntentionMoney((Double) map.get("f2"));
        // 尚未派单
        params.put("status", 0);
        Map<String, Object> map1 = orderService.queryTotal(params);
        data.setUnDispatch((Long) map1.get("f1"));
        data.setUnDispatchMoney((Double) map1.get("f2"));
        // 已经派单
        params.put("status", 1);
        Map<String, Object> map2 = orderService.queryTotal(params);
        data.setDispatch((Long) map2.get("f1"));
        data.setDispatchMoney((Double) map2.get("f2"));
        // 完成订单
        params.put("status", 2);
        Map<String, Object> map3 = orderService.queryTotal(params);
        data.setDone((Long) map3.get("f1"));
        data.setDoneMoney((Double) map3.get("f2"));
        // 作废订单
        params.put("status", 3);
        Map<String, Object> map4 = orderService.queryTotal(params);
        data.setCancel((Long) map4.get("f1"));
        data.setCancelMoney((Double) map4.get("f2"));
        // 已收款
        params.put("status", 2);
        params.put("payState", 1);
        Map<String, Object> map5 = orderService.queryTotal(params);
        data.setPay((Long) map5.get("f1"));
        data.setPayMoney((Double) map5.get("f2"));
        // 未收款
        params.put("payState", 0);
        params.put("status", 2);
        Map<String, Object> map6 = orderService.queryTotal(params);
        data.setUnPay((Long) map6.get("f1"));
        data.setUnPayMoney((Double) map6.get("f2"));
        // 已经结算
        params.put("status", 2);
        params.put("is_clean", 1);
        Map<String, Object> map7 = orderService.queryTotal(params);
        data.setClean((Long) map7.get("f1"));
        data.setCleanMoney((Double) map7.get("f2"));
        // 未结算
        params.put("status", 2);
        params.put("is_clean", 0);
        Map<String, Object> map8 = orderService.queryTotal(params);
        data.setUnClean((Long) map8.get("f1"));
        data.setUnCleanMoney((Double) map8.get("f2"));
        return ResultUtils.success(data);
    }

    /**
     * 查询首页数据
     *
     * @return
     */
    @RequestMapping("/welcomeData")
    @ResponseBody
    public Result welcomeData(HttpServletRequest request) {
        Map<String, Object> data = new HashMap<>();
        // 查询最新公告
        Notice notice = noticeService.queryTopNews();
        data.put("notice", notice.getContent());
        // 查询我的任务
        Order order = new Order();
        order.setStatus(1);
        PageModel<Order> pageModel = orderService.queryMyTasks(order, 1, 4);
        data.put("task", pageModel.getTotal());
        data.put("tasks", pageModel.getList());
        return ResultUtils.success(data);
    }
}
