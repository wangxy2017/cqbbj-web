package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.Code;
import com.cqbbj.entity.Salary;
import org.springframework.stereotype.Repository;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: SalaryMapper
 * @Description: 编码Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/18 11:49
 */
@Repository
public interface CodeMapper extends BaseMapper<Code> {

    /**
     * 根据手机号查询验证码
     *
     * @param phone
     * @return
     */
    Code queryByPhone(String phone);
}
