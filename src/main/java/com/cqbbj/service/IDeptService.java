package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.entity.Dept;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IDeptService
 * @Description: 部门业务层接口(这里用一句话描述这个类的作用)
 * @date 2019/2/18 15:24
 */
public interface IDeptService extends BaseService<Dept> {
    /**
     * 绑定菜单
     *
     * @param dept_id
     * @param menu_ids
     * @return
     */
    int bindMenu(Integer dept_id, Integer[] menu_ids);
}
