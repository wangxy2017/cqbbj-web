package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.Menu;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: MenuMapper
 * @Description: 菜单Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/18 11:49
 */
@Repository
public interface MenuMapper extends BaseMapper<Menu> {

    /**
     * 根据部门ID查询菜单
     * @param dept_id
     * @return
     */
    List<Menu> queryPCMenuByDept(Integer dept_id);

    /**
     * 根据部门ID查询菜单
     * @param dept_id
     * @return
     */
    List<Menu> queryWXMenuByDept(Integer dept_id);
}
