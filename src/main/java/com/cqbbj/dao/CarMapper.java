package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.Car;
import org.springframework.stereotype.Repository;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CarMapper
 * @Description: 车辆Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/18 11:49
 */
@Repository
public interface CarMapper extends BaseMapper<Car> {
    void deleteActiveBatch(String[] id);
}
