package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.entity.PayRecord;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IPayRecordService
 * @Description: 支付记录业务层接口(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:02
 */
public interface IPayRecordService extends BaseService<PayRecord> {
    public PageModel<PayRecord> queryPageList(PayRecord payRecord, String startTime, String endTime, int pageNum, int pageSize);
}
