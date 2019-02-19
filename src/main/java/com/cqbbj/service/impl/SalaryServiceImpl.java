package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.SalaryMapper;
import com.cqbbj.entity.Salary;
import com.cqbbj.service.ISalaryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: SalaryServiceImpl
 * @Description: 工资业务实现(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:06
 */
@Service
public class SalaryServiceImpl implements ISalaryService {

    /**
     * 工资Mapper
     */
    @Autowired
    private SalaryMapper salaryMapper;

    @Override
    public int saveEntity(Salary salary) {
        return salaryMapper.save(salary);
    }

    @Override
    public int updateEntity(Salary salary) {
        return salaryMapper.update(salary);
    }

    @Override
    public void deleteEntity(Integer id) {
        salaryMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<Salary> queryList(Salary salary) {
        return null;
    }

    @Override
    public PageModel<Salary> queryPageList(Salary salary, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Salary> list = salaryMapper.queryList(salary);
        PageInfo<Salary> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public Salary queryById(Integer id) {
        return null;
    }
}
