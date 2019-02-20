package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.DeptMapper;
import com.cqbbj.entity.Dept;
import com.cqbbj.service.IDeptService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: DeptServiceImpl
 * @Description: 部门业务层实现(这里用一句话描述这个类的作用)
 * @date 2019/2/18 15:21
 */
@Service
public class DeptServiceImpl implements IDeptService {

    /**
     * 部门Mapper
     */
    @Autowired
    private DeptMapper deptMapper;

    @Override
    public int saveEntity(Dept dept) {
        return deptMapper.save(dept);
    }

    @Override
    public int updateEntity(Dept dept) {
        return deptMapper.update(dept);
    }

    @Override
    public void deleteEntity(Integer id) {
        deptMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<Dept> queryList(Dept dept) {
        return null;
    }

    @Override
    public PageModel<Dept> queryPageList(Dept dept, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Dept> list = deptMapper.queryList(dept);
        PageInfo<Dept> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public Dept queryById(Integer id) {
        return null;
    }

    @Override
    public int bindMenu(Integer dept_id, Integer[] menu_ids) {
        // 清空部门菜单
        deptMapper.deleteDeptMenu(dept_id);
        // 绑定菜单
        if (menu_ids != null && menu_ids.length > 0) {
            Map<String, Object> params = new HashMap<>();
            params.put("dept_id", dept_id);
            params.put("menu_ids", menu_ids);
            deptMapper.insertDeptMenu(params);
        }
        return 1;
    }
}
