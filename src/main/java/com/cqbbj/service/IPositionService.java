package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.entity.Position;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IPositionService
 * @Description: 职位业务层接口(这里用一句话描述这个类的作用)
 * @date 2019/2/18 15:24
 */
public interface IPositionService extends BaseService<Position> {
    /**
     * 绑定菜单
     *
     * @param position_id
     * @param menu_ids
     * @return
     */
    int bindMenu(Integer position_id, Integer[] menu_ids);
}
