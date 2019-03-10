package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.entity.Dept;
import com.cqbbj.entity.Employee;
import com.cqbbj.entity.MoneyDetail;

import javax.servlet.http.HttpServletRequest;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IMoneyDetailService
 * @Description: 收支明细业务层接口(这里用一句话描述这个类的作用)
 * @date 2019/2/18 15:24
 */
public interface IMoneyDetailService extends BaseService<MoneyDetail> {
    PageModel<MoneyDetail> queryPageList(Employee employee, MoneyDetail moneyDetail, int pageNum, int pageSize);
}
