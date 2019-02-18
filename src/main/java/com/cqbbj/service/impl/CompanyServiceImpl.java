package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.CompanyMapper;
import com.cqbbj.entity.Company;
import com.cqbbj.service.ICompanyService;
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
 * @ClassName: CompanyServiceImpl
 * @Description: 公司业务层实现类(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:48
 */
@Service
public class CompanyServiceImpl implements ICompanyService {

    /**
     * 公司Mapper
     */
    @Autowired
    private CompanyMapper companyMapper;

    @Override
    public int saveEntity(Company company) {
        return companyMapper.save(company);
    }

    @Override
    public int updateEntity(Company company) {
        return companyMapper.update(company);
    }

    @Override
    public void deleteEntity(Integer id) {
        companyMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<Company> queryList(Company company) {
        return null;
    }

    @Override
    public PageModel<Company> queryPageList(Company company, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Company> list = companyMapper.queryList(company);
        PageInfo<Company> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public Company queryById(Integer id) {
        return null;
    }

    @Override
    public int bindMenu(String company_no, Integer[] menu_ids) {
        // 删除公司菜单关联
        companyMapper.deleteCompanyMenu(company_no);
        // 插入职位菜单关联
        if (menu_ids != null && menu_ids.length > 0) {
            Map<String, Object> params = new HashMap<>();
            params.put("company_no", company_no);
            params.put("menu_ids", menu_ids);
            companyMapper.insertCompanyMenu(params);
        }
        return 1;
    }
}
