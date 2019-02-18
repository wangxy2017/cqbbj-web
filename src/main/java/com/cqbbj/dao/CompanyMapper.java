package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.Company;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CompanyMapper
 * @Description: 公司Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/18 11:49
 */
@Repository
public interface CompanyMapper extends BaseMapper<Company> {

    /**
     * 插入公司菜单关联
     *
     * @param params
     * @return
     */
    int insertCompanyMenu(Map<String, Object> params);

    /**
     * 删除公司菜单关联
     *
     * @param company_no
     */
    void deleteCompanyMenu(String company_no);

}
