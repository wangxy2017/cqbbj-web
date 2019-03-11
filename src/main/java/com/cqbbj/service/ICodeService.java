package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.entity.Car;
import com.cqbbj.entity.Code;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: ICarService
 * @Description: 编码层接口(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:02
 */
public interface ICodeService extends BaseService<Code> {
    /**
     * 根据手机号查询
     *
     * @param phone
     * @return
     */
    Code queryCodeByPhone(String phone);
}
