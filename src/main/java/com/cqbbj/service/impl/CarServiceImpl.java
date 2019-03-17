package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.dao.CarMapper;
import com.cqbbj.entity.Car;
import com.cqbbj.service.ICarService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CarServiceImpl
 * @Description: 车辆实现(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:04
 */
@Service
public class CarServiceImpl implements ICarService {

    /**
     * 车辆Mapper
     */
    @Autowired
    private CarMapper carMapper;

    @Override
    public int saveEntity(Car car) {
        return carMapper.save(car);
    }

    @Override
    public int updateEntity(Car car) {
        return carMapper.update(car);
    }

    @Override
    public void deleteEntity(Integer id) {
        carMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<Car> queryList(Car car) {
        return null;
    }

    @Override
    public PageModel<Car> queryPageList(Car car, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Car> list = carMapper.queryList(car);
        PageInfo<Car> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public Car queryById(Integer id) {
        return carMapper.queryById(id);
    }

    @Override
    public void deleteActiveBatch(String ids) {
        String[] array = ids.split(",");
        carMapper.deleteActiveBatch(array);
    }

    @Override
    public Car queryByProperties(Car car) {
        return null;
    }
}
