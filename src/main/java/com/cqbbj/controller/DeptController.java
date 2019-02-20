package com.cqbbj.controller;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Dept;
import com.cqbbj.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: DeptController
 * @Description: 部门控制器(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:55
 */
@Controller
@RequestMapping("/dept")
public class DeptController {

    @Autowired
    private IDeptService deptService;// 部门业务

    /**
     * 新增部门
     *
     * @param dept
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(Dept dept) {
        dept.setCreateTime(new Date());
        dept.setDeleteStatus(0);
        dept.setIs_disabled(0);
        deptService.saveEntity(dept);
        return ResultUtils.success();
    }

    /**
     * 修改部门
     *
     * @param dept
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(Dept dept) {
        deptService.updateEntity(dept);
        return ResultUtils.success();
    }

    /**
     * 删除部门
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(Integer id) {
        deptService.deleteEntity(id);
        return ResultUtils.success();
    }

    /**
     * 查询部门列表
     *
     * @param dept
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(Dept dept, Integer pageNum, Integer pageSize) {
        PageModel<Dept> pageModel = deptService.queryPageList(dept, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }

    /**
     * 绑定菜单
     *
     * @return
     */
    @RequestMapping("/bindMenu")
    @ResponseBody
    public Result bindMenu(Integer dept_id, String menu_ids) {
        Integer[] ids = CommUtils.toIntegerArray(menu_ids);
        deptService.bindMenu(dept_id, ids);
        return ResultUtils.success();
    }
}
