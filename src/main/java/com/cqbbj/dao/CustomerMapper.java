package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.Customer;
import org.springframework.stereotype.Repository;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CustomerMapper
 * @Description: 客户Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/18 11:49
 */
@Repository
public interface CustomerMapper extends BaseMapper<Customer> {

    void deleteActiveBatch(String[] id);
}
