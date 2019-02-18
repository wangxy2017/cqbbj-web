package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.Employee;
import org.springframework.stereotype.Repository;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: EmployeeMapper
 * @Description: 员工Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/18 17:04
 */
@Repository
public interface EmployeeMapper extends BaseMapper<Employee> {
}
