package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.Position;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: PositionMapper
 * @Description: 职位Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/18 11:49
 */
@Repository
public interface PositionMapper extends BaseMapper<Position> {

    /**
     * 插入职位菜单关联
     *
     * @param params
     * @return
     */
    int insertPositionMenu(Map<String, Object> params);

    /**
     * 删除职位菜单关联
     *
     * @param position_id
     */
    void deletePositionMenu(Integer position_id);
}
