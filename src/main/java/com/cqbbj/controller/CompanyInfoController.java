package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.CompanyInfo;
import com.cqbbj.service.ICompanyInfoService;
import com.cqbbj.service.IOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CompanyInfoController
 * @Description: 商户配置(这里用一句话描述这个类的作用)
 * @date 2019/2/21 10:40
 */
@Controller
@RequestMapping("/company")
public class CompanyInfoController extends BaseController {

    @Autowired
    private ICompanyInfoService companyInfoService;// 商户配置

    @Autowired
    private IOperationLogService operationLogService;// 操作日志

    /**
     * 商户配置页面跳转
     *
     * @return
     */
    @RequestMapping("/companyInfo")
    public String companyInfo() {
        return "company/companyInfo";
    }

    /**
     * 修改商户配置
     *
     * @param companyInfo
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    private Result update(HttpServletRequest request, CompanyInfo companyInfo) {
        companyInfoService.updateEntity(companyInfo);
        // 记录日志
        operationLogService.saveEntity(createPCLog(request, "修改商户配置"));
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
    @RequestMapping("/queryInfo")
    @ResponseBody
    private Result queryInfo() {
        CompanyInfo companyInfo = companyInfoService.queryById(1);
        return ResultUtils.success(companyInfo);
    }
}
