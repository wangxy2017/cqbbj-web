package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.DivideModel;
import com.cqbbj.entity.DivideModelDetails;
import com.cqbbj.service.IDivideModelDetailsService;
import com.cqbbj.service.IDivideModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: DivideModelController
 * @Description: 提成配置(这里用一句话描述这个类的作用)
 * @date 2019/3/6 14:57
 */
@RequestMapping("/divideModel")
@Controller
public class DivideModelController extends BaseController {

    @Autowired
    private IDivideModelService divideModelService;// 提成模式

    @Autowired
    private IDivideModelDetailsService divideModelDetailsService;//提成详情

    /**
     * 提成配置页面跳转
     *
     * @return
     */
    @RequestMapping("/divideModel")
    public String divideModel() {
        return "divideModel/divideModel";
    }

    /**
     * 新增模板页面跳转
     *
     * @return
     */
    @RequestMapping("/divideModelAdd")
    public String divideModelAdd() {
        return "divideModel/divideModelAdd";
    }

    /**
     * 保存提成模式
     *
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(DivideModel divideModel, DivideModelDetails drive, DivideModelDetails move, DivideModelDetails air) {
        divideModelService.saveEntity(divideModel);
        // 保存提成详情
        divideModelDetailsService.saveEntity(drive);
        divideModelDetailsService.saveEntity(move);
        divideModelDetailsService.saveEntity(air);
        return ResultUtils.success();
    }

    /**
     * 修改提成模式
     *
     * @param divideModel
     * @param drive
     * @param move
     * @param air
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(DivideModel divideModel, DivideModelDetails drive, DivideModelDetails move, DivideModelDetails air) {
        divideModelService.updateEntity(divideModel);
        // 保存提成详情
        divideModelDetailsService.updateEntity(drive);
        divideModelDetailsService.updateEntity(move);
        divideModelDetailsService.updateEntity(air);
        return ResultUtils.success();
    }

    /**
     * 查询列表
     *
     * @param divideModel
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(DivideModel divideModel, Integer pageNum, Integer pageSize) {
        PageModel<DivideModel> pageModel = divideModelService.queryPageList(divideModel, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }

}
