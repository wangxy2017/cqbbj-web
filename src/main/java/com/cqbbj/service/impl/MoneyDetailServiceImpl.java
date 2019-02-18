package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.MoneyDetailMapper;
import com.cqbbj.entity.MoneyDetail;
import com.cqbbj.service.IMoneyDetailService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: MoneyDetailServiceImpl
 * @Description: 收支明细实现类(这里用一句话描述这个类的作用)
 * @date 2019/2/18 19:40
 */
@Service
public class MoneyDetailServiceImpl implements IMoneyDetailService {

    /**
     * 收支明细Mapper
     */
    @Autowired
    private MoneyDetailMapper moneyDetailMapper;

    @Override
    public int saveEntity(MoneyDetail moneyDetail) {
        return moneyDetailMapper.save(moneyDetail);
    }

    @Override
    public int updateEntity(MoneyDetail moneyDetail) {
        return 0;
    }

    @Override
    public void deleteEntity(Integer id) {

    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<MoneyDetail> queryList(MoneyDetail moneyDetail) {
        return null;
    }

    @Override
    public PageModel<MoneyDetail> queryPageList(MoneyDetail moneyDetail, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<MoneyDetail> list = moneyDetailMapper.queryList(moneyDetail);
        PageInfo<MoneyDetail> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public MoneyDetail queryById(Integer id) {
        return null;
    }
}
