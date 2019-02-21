package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.CustomerMapper;
import com.cqbbj.entity.Customer;
import com.cqbbj.service.ICustomerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CustomerServiceImpl
 * @Description: 客户实现(这里用一句话描述这个类的作用)
 * @date 2019/2/19 9:58
 */
@Service
public class CustomerServiceImpl implements ICustomerService {

    /**
     * 客户Mapper
     */
    @Autowired
    private CustomerMapper customerMapper;

    @Override
    public int saveEntity(Customer customer) {
        return customerMapper.save(customer);
    }

    @Override
    public int updateEntity(Customer customer) {
        return customerMapper.update(customer);
    }

    @Override
    public void deleteEntity(Integer id) {
        customerMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {
        customerMapper.deleteActive(id);
    }

    @Override
    public List<Customer> queryList(Customer customer) {
        return null;
    }

    @Override
    public PageModel<Customer> queryPageList(Customer customer, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Customer> list = customerMapper.queryList(customer);
        PageInfo<Customer> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public Customer queryById(Integer id) {
        return null;
    }

    @Override
    public Customer queryByPhone(String phone) {
        Customer customer = new Customer();
        customer.setPhone(phone);
        return customerMapper.queryByProperties(customer);
    }
}
