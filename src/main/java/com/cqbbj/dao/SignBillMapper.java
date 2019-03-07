package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.OrderDivide;
import com.cqbbj.entity.SignBill;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: PayRecordMapper
 * @Description: 签单管理Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/18 11:49
 */
@Repository
public interface SignBillMapper extends BaseMapper<SignBill> {


    List<SignBill> queryList(Map map);



}
