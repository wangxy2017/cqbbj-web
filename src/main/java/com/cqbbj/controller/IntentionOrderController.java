package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.*;
import com.cqbbj.service.IIntentionFollowService;
import com.cqbbj.service.IIntentionOrderService;
import com.cqbbj.service.IOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IntentionOrderController
 * @Description: 意向订单控制层(这里用一句话描述这个类的作用)
 * @date 2019/2/21 16:24
 */
@Controller
@RequestMapping("/intentionOrder")
public class IntentionOrderController extends BaseController {

    @Autowired
    private IIntentionOrderService intentionOrderService;// 意向订单业务层
    @Autowired
    private IIntentionFollowService intentionFollowService;// 跟进订单
    @Autowired
    private IOperationLogService operationLogService;// 操作日志

    /**
     * 意向订单页面
     *
     * @param
     * @param
     * @return
     */
    @RequestMapping("/intentionOrder")
    public String IntentionOrder() {
        return "/intentionOrder/intentionOrder";
    }

    /**
     * 意向订单详情
     *
     * @return
     */
    @RequestMapping("/orderView")
    public String orderView() {
        return "/intentionOrder/intentionOrderView";
    }

    /**
     * 意向订单新增页面
     *
     * @param
     * @param
     * @return
     */
    @RequestMapping("/intentionOrderAdd")
    public String intentionOrderAdd() {
        return "/intentionOrder/intentionOrderAdd";
    }

    /**
     * 意向订单修改页面
     *
     * @param
     * @param
     * @return
     */
    @RequestMapping("/intentionOrderUpdate")
    public String IntentionOrderUpdate() {
        return "/intentionOrder/intentionOrderUpdate";
    }

    /**
     * 根据ID查询意向订单信息
     *
     * @param
     * @param
     * @return
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Result queryById(Integer id) {
        IntentionOrder intentionOrder = intentionOrderService.queryById(id);
        return ResultUtils.success(intentionOrder);
    }

    /**
     * 新增意向订单
     *
     * @param intentionOrder
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(HttpServletRequest request, IntentionOrder intentionOrder) {
        intentionOrder.setCreateTime(new Date());
        intentionOrder.setDeleteStatus(0);
        intentionOrder.setIs_follow(0);
        intentionOrder.setInten_no(CommUtils.getCode("IO"));
        intentionOrderService.saveEntity(intentionOrder);
        // 记录日志
        operationLogService.saveEntity(
                createLog(request, "新增意向订单：" + intentionOrder.getInten_no()));
        return ResultUtils.success();
    }

    /**
     * 修改意向订单信息
     *
     * @param request
     * @param intentionOrder
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(HttpServletRequest request, IntentionOrder intentionOrder) {
        intentionOrderService.updateEntity(intentionOrder);
        // 记录日志
        operationLogService.saveEntity(
                createLog(request, "修改意向订单信息：" + intentionOrder.getInten_no()));
        return ResultUtils.success();
    }

    /**
     * 分页查询
     *
     * @param intentionOrder
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(IntentionOrder intentionOrder, Integer pageNum, Integer pageSize) {
        PageModel<IntentionOrder> pageModel = intentionOrderService.queryPageList(intentionOrder, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }

    /**
     * 作废订单
     *
     * @param request
     * @param intentionOrder
     * @return
     */
    @RequestMapping("/cancel")
    @ResponseBody
    public Result cancel(HttpServletRequest request, IntentionOrder intentionOrder) {
        // 作废订单
        intentionOrder.setStatus(3);
        intentionOrderService.updateEntity(intentionOrder);
        // 记录日志
        OperationLog log = createLog(request, "作废订单" + intentionOrder.getInten_no());
        operationLogService.saveEntity(log);
        return ResultUtils.success();
    }

    /**
     * 查询详情
     *
     * @param id
     * @return
     */
    @RequestMapping("/orderDetail")
    @ResponseBody
    public Result orderDetail(Integer id) {
        IntentionOrder order = intentionOrderService.queryById(id);
        // 查询跟进详情
        IntentionFollow follow = new IntentionFollow();
        follow.setInten_no(order.getInten_no());
        order.setFollows(intentionFollowService.queryList(follow));
        return ResultUtils.success(order);
    }
}
