package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.entity.Menu;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IMenuService
 * @Description: 菜单业务层接口(这里用一句话描述这个类的作用)
 * @date 2019/2/18 13:56
 */
public interface IMenuService extends BaseService<Menu> {
    /**
     * 查询所有菜单
     *
     * @return
     */
    List<Menu> queryAllMenu();

    /**
     * 查询部门菜单
     *
     * @param dept_id
     * @return
     */
    List<Menu> queryMenuByDept(Integer dept_id);

}
