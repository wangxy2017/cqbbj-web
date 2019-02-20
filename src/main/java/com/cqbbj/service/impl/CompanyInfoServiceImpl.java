package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.CompanyInfoMapper;
import com.cqbbj.entity.CompanyInfo;
import com.cqbbj.service.ICompanyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CompanyInfoServiceImpl
 * @Description: 公司信息实现(这里用一句话描述这个类的作用)
 * @date 2019/2/20 10:37
 */
@Service
public class CompanyInfoServiceImpl implements ICompanyInfoService {

    /**
     * 公司信息Mapper
     */
    @Autowired
    private CompanyInfoMapper companyInfoMapper;

    @Override
    public int saveEntity(CompanyInfo companyInfo) {
        return companyInfoMapper.save(companyInfo);
    }

    @Override
    public int updateEntity(CompanyInfo companyInfo) {
        return companyInfoMapper.update(companyInfo);
    }

    @Override
    public void deleteEntity(Integer id) {

    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<CompanyInfo> queryList(CompanyInfo companyInfo) {
        return null;
    }

    @Override
    public PageModel<CompanyInfo> queryPageList(CompanyInfo companyInfo, int pageNum, int pageSize) {
        return null;
    }

    @Override
    public CompanyInfo queryById(Integer id) {
        return companyInfoMapper.queryById(id);
    }
}
