package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.entity.Company;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: ICompanyService
 * @Description: 公司业务层接口(这里用一句话描述这个类的作用)
 * @date 2019/2/18 13:56
 */
public interface ICompanyService extends BaseService<Company> {
    /**
     * 绑定菜单
     *
     * @param company_no
     * @param menu_ids
     * @return
     */
    int bindMenu(String company_no, Integer[] menu_ids);
}
