package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.IntentionFollow;
import com.cqbbj.entity.IntentionOrder;
import com.cqbbj.service.IIntentionFollowService;
import com.cqbbj.service.IIntentionOrderService;
import com.cqbbj.service.IOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IntentionFollowController
 * @Description: 意向跟进控制层(这里用一句话描述这个类的作用)
 * @date 2019/2/21 16:24
 */
@Controller
@RequestMapping("/intentionFollow")
public class IntentionFollowController extends BaseController {

    @Autowired
    private IIntentionFollowService intentionFollowService;// 意向跟进业务层
    @Autowired
    private IOperationLogService operationLogService;// 操作日志
    @Autowired
    private IIntentionOrderService intentionOrderService;// 意向订单

    /**
     * 新增意向跟进
     *
     * @param intentionFollow
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(HttpServletRequest request, IntentionFollow intentionFollow, Integer inten_id) {
        IntentionFollow follow = new IntentionFollow();
        follow.setInten_no(intentionFollow.getInten_no());
        if (intentionFollowService.queryList(follow).isEmpty()) {
            // 更新跟进状态
            IntentionOrder order = new IntentionOrder();
            order.setId(inten_id);
            order.setIs_follow(1);
            intentionOrderService.updateEntity(order);
        }
        // 保存
        intentionFollow.setCreateTime(new Date());
        intentionFollow.setDeleteStatus(0);
        intentionFollowService.saveEntity(intentionFollow);
        // 记录日志
        operationLogService.saveEntity(
                createLog(request, "跟进订单：" + intentionFollow.getInten_no()));
        return ResultUtils.success();
    }
}
