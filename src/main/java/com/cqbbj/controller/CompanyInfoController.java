package com.cqbbj.controller;

import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.CompanyInfo;
import com.cqbbj.service.ICompanyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CompanyInfoController
 * @Description: 商户配置(这里用一句话描述这个类的作用)
 * @date 2019/2/21 10:40
 */
@Controller
@RequestMapping("/company")
public class CompanyInfoController {

    @Autowired
    private ICompanyInfoService companyInfoService;// 商户配置

    /**
     * 修改商户配置
     *
     * @param companyInfo
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    private Result update(CompanyInfo companyInfo) {
        companyInfoService.updateEntity(companyInfo);
        return ResultUtils.success();
    }

    /**
     * 新增商户配置
     *
     * @param companyInfo
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    private Result save(CompanyInfo companyInfo) {
        companyInfoService.saveEntity(companyInfo);
        return ResultUtils.success();
    }

    /**
     * 查询商户配置信息
     *
     * @return
     */
    @RequestMapping("/companyInfo")
    @ResponseBody
    private Result companyInfo() {
        CompanyInfo companyInfo = companyInfoService.queryById(1);
        return ResultUtils.success(companyInfo);
    }
}
