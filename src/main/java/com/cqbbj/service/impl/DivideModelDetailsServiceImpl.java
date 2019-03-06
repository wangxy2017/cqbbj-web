package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.DivideModelDetailsMapper;
import com.cqbbj.entity.DivideModelDetails;
import com.cqbbj.service.IDivideModelDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: DivideModelDetailsServiceImpl
 * @Description: 提成详情实现(这里用一句话描述这个类的作用)
 * @date 2019/3/6 14:53
 */
@Service
public class DivideModelDetailsServiceImpl implements IDivideModelDetailsService {

    /**
     * 提成详情Mapper
     */
    @Autowired
    private DivideModelDetailsMapper divideModelDetailsMapper;

    @Override
    public int saveEntity(DivideModelDetails divideModelDetails) {
        return divideModelDetailsMapper.save(divideModelDetails);
    }

    @Override
    public int updateEntity(DivideModelDetails divideModelDetails) {
        return divideModelDetailsMapper.update(divideModelDetails);
    }

    @Override
    public void deleteEntity(Integer id) {
        divideModelDetailsMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<DivideModelDetails> queryList(DivideModelDetails divideModelDetails) {
        return null;
    }

    @Override
    public PageModel<DivideModelDetails> queryPageList(DivideModelDetails divideModelDetails, int pageNum, int pageSize) {
        return null;
    }

    @Override
    public DivideModelDetails queryById(Integer id) {
        return null;
    }
}
