package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.entity.Car;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: ICarService
 * @Description: 车辆业务层接口(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:02
 */
public interface ICarService extends BaseService<Car> {
    void deleteActiveBatch(String ids);
}
