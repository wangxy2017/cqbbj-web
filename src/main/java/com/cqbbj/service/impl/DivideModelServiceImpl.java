package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.DivideModelMapper;
import com.cqbbj.entity.DivideModel;
import com.cqbbj.service.IDivideModelService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: DivideModelServiceImpl
 * @Description: 提成模式实现(这里用一句话描述这个类的作用)
 * @date 2019/3/6 14:49
 */
@Service
public class DivideModelServiceImpl implements IDivideModelService {

    /**
     * 提成模式Mapper
     */
    @Autowired
    private DivideModelMapper divideModelMapper;

    @Override
    public int saveEntity(DivideModel divideModel) {
        return divideModelMapper.save(divideModel);
    }

    @Override
    public int updateEntity(DivideModel divideModel) {
        return divideModelMapper.update(divideModel);
    }

    @Override
    public void deleteEntity(Integer id) {
        divideModelMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<DivideModel> queryList(DivideModel divideModel) {
        return null;
    }

    @Override
    public PageModel<DivideModel> queryPageList(DivideModel divideModel, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<DivideModel> list = divideModelMapper.queryList(divideModel);
        PageInfo<DivideModel> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public DivideModel queryById(Integer id) {
        return null;
    }
}
