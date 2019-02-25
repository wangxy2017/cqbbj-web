package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.Dept;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: DeptMapper
 * @Description: 部门Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/18 11:49
 */
@Repository
public interface DeptMapper extends BaseMapper<Dept> {

    /**
     * 删除部门菜单
     *
     * @param dept_id
     */
    void deleteDeptMenu(Integer dept_id);

    /**
     * 插入部门菜单
     *
     * @param params
     * @return
     */
    int insertDeptMenu(Map<String, Object> params);

    /**
     * 查询已绑定的菜单
     *
     * @param id 角色ID
     * @return
     */
    List<Integer> queryBindMenu(Integer id);
}
