package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.Car;
import com.cqbbj.entity.DivideModel;
import com.cqbbj.entity.DivideModelDetails;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: DivideModelMapper
 * @Description: 提成模式Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/18 11:49
 */
@Repository
public interface DivideModelMapper extends BaseMapper<DivideModel> {
    /**
     * 保存提成详情
     *
     * @param list
     * @return
     */
    int saveDetails(List<DivideModelDetails> list);


}
