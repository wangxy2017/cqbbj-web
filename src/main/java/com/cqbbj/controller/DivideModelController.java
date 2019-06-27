package com.cqbbj.controller;

import com.alibaba.fastjson.JSON;
import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.util.BizType;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.DivideModel;
import com.cqbbj.entity.DivideModelDetails;
import com.cqbbj.service.IDivideModelDetailsService;
import com.cqbbj.service.IDivideModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

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
    public Result save(DivideModel divideModel, String drive, String move, String air) {
        divideModel.setIs_disabled(0);
        divideModel.setModel_no(CommUtils.getCode(BizType.DIVIDE_MODEL));
        divideModel.setCreateTime(new Date());
        divideModel.setDeleteStatus(0);
        divideModelService.saveEntity(divideModel);
        // 保存提成详情
        if (!"{}".equals(drive)) {
            DivideModelDetails driveDMD = JSON.parseObject(drive, DivideModelDetails.class);
            driveDMD.setCreateTime(new Date());
            driveDMD.setDeleteStatus(0);
            driveDMD.setModel_no(divideModel.getModel_no());
            divideModelDetailsService.saveEntity(driveDMD);
        }
        if (!"{}".equals(move)) {
            DivideModelDetails moveDMD = JSON.parseObject(move, DivideModelDetails.class);
            moveDMD.setCreateTime(new Date());
            moveDMD.setDeleteStatus(0);
            moveDMD.setModel_no(divideModel.getModel_no());
            divideModelDetailsService.saveEntity(moveDMD);
        }
        if (!"{}".equals(air)) {
            DivideModelDetails airDMD = JSON.parseObject(air, DivideModelDetails.class);
            airDMD.setCreateTime(new Date());
            airDMD.setDeleteStatus(0);
            airDMD.setModel_no(divideModel.getModel_no());
            divideModelDetailsService.saveEntity(airDMD);
        }
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
    public Result update(DivideModel divideModel, String drive, String move, String air) {
        divideModelService.updateEntity(divideModel);
        // 保存提成详情
        divideModelDetailsService.updateEntity(JSON.parseObject(drive, DivideModelDetails.class));
        divideModelDetailsService.updateEntity(JSON.parseObject(move, DivideModelDetails.class));
        divideModelDetailsService.updateEntity(JSON.parseObject(air, DivideModelDetails.class));
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
    /**
     * 查询列表
     *
     * @param divideModel
     * @return
     */
    @RequestMapping("/queryList")
    @ResponseBody
    public Result queryPageList(DivideModel divideModel) {
        List<DivideModel> list = divideModelService.queryList(divideModel);
        return ResultUtils.success(list);
    }

    /**
     * 查询模板详情
     */
    @RequestMapping("/queryByModel_no")
    @ResponseBody
    public Result queryByModel_no(String model_no){
        DivideModelDetails divideModelDetails=new DivideModelDetails();
        divideModelDetails.setModel_no(model_no);
        DivideModelDetails divideModelDetails1= divideModelDetailsService.queryByProperties(divideModelDetails);
        return ResultUtils.success(divideModelDetails1);
    }
    /**
     * 删除模板
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(Integer id) {
        divideModelService.deleteEntity(id);
        return ResultUtils.success();
    }

}
