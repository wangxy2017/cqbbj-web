package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.CompanyConfigMapper;
import com.cqbbj.entity.CompanyConfig;
import com.cqbbj.service.ICompanyConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CompanyConfigServiceImpl
 * @Description: 公司配置实现(这里用一句话描述这个类的作用)
 * @date 2019/2/19 17:26
 */
@Service
public class CompanyConfigServiceImpl implements ICompanyConfigService {

    /**
     * 公司配置Mapper
     */
    @Autowired
    private CompanyConfigMapper companyConfigMapper;

    @Override
    public int saveEntity(CompanyConfig companyConfig) {
        return companyConfigMapper.save(companyConfig);
    }

    @Override
    public int updateEntity(CompanyConfig companyConfig) {
        return companyConfigMapper.update(companyConfig);
    }

    @Override
    public void deleteEntity(Integer id) {

    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<CompanyConfig> queryList(CompanyConfig companyConfig) {
        return null;
    }

    @Override
    public PageModel<CompanyConfig> queryPageList(CompanyConfig companyConfig, int pageNum, int pageSize) {
        return null;
    }

    @Override
    public CompanyConfig queryById(Integer id) {
        return null;
    }
}
