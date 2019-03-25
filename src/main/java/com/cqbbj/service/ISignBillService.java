package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.entity.OrderDivide;
import com.cqbbj.entity.SignBill;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IPayRecordService
 * @Description: 提成业务层接口(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:02
 */
public interface ISignBillService extends BaseService<SignBill> {
    PageModel<SignBill> queryPageList(SignBill signBill, Date startTime, Date finishTime, int pageNum, int pageSize);
}
