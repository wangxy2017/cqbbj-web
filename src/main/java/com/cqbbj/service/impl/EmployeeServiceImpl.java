package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.EmployeeMapper;
import com.cqbbj.entity.Dept;
import com.cqbbj.entity.Employee;
import com.cqbbj.service.IEmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: EmployeeServiceImpl
 * @Description: 员工实现(这里用一句话描述这个类的作用)
 * @date 2019/2/18 17:14
 */
@Service
public class EmployeeServiceImpl implements IEmployeeService {

    /**
     * 员工Mapper
     */
    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public int saveEntity(Employee employee) {
        return employeeMapper.save(employee);
    }

    @Override
    public int updateEntity(Employee employee) {
        return employeeMapper.update(employee);
    }

    @Override
    public void deleteEntity(Integer id) {
        employeeMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {
        employeeMapper.deleteActive(id);
    }

    @Override
    public List<Employee> queryList(Employee employee) {
        return employeeMapper.queryList(employee);
    }

    @Override
    public PageModel<Employee> queryPageList(Employee employee, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Employee> list = employeeMapper.queryList(employee);
        PageInfo<Employee> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public Employee queryById(Integer id) {
        return employeeMapper.queryById(id);
    }

    @Override
    public List<Employee> queryByAccount(String account) {
        Employee employee = new Employee();
        employee.setAccount(account);
        List<Employee> list = employeeMapper.queryList(employee);
        return list;
    }

    @Override
    public Employee queryByProperties(Employee employee) {
        return null;
    }
}
