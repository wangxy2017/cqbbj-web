package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.entity.Customer;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: ICustomerService
 * @Description: 客户业务层(这里用一句话描述这个类的作用)
 * @date 2019/2/19 9:57
 */
public interface ICustomerService extends BaseService<Customer> {
    /**
     * 根据手机号查询
     *
     * @param phone
     * @return
     */
    Customer queryByPhone(String phone);

    /**
     * 批量删除
     * @param id
     */
    void deleteEntityBatch(String ids);
}
