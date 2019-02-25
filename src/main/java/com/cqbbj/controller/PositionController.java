package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Position;
import com.cqbbj.service.IPositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: positionController
 * @Description: 职位控制器(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:55
 */
@Controller
@RequestMapping("/position")
public class PositionController extends BaseController {

    @Autowired
    private IPositionService positionService;// 职位业务

    /**
     * 跳转职位管理界面
     *
     * @return
     */
    @RequestMapping("/position")
    public String position() {
        log.debug("跳转position页面");
        return "position/position";
    }

    /**
     * 新增职位
     *
     * @param position
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(Position position) {
        position.setCreateTime(new Date());
        position.setDeleteStatus(0);
        position.setIs_disabled(0);
        positionService.saveEntity(position);
        return ResultUtils.success();
    }

    /**
     * 修改职位
     *
     * @param position
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(Position position) {
        positionService.updateEntity(position);
        return ResultUtils.success();
    }

    /**
     * 删除职位
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(Integer id) {
        positionService.deleteEntity(id);
        return ResultUtils.success();
    }

    /**
     * 查询职位列表
     *
     * @param position
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(Position position, Integer pageNum, Integer pageSize) {
        PageModel<Position> pageModel = positionService.queryPageList(position, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }

    /**
     * 查询职位
     *
     * @param position
     * @return
     */
    @RequestMapping("/queryList")
    @ResponseBody
    public Result queryList(Position position) {
        List<Position> list = positionService.queryList(position);
        return ResultUtils.success(list);
    }
}
