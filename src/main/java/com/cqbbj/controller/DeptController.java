package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Dept;
import com.cqbbj.entity.Menu;
import com.cqbbj.service.IDeptService;
import com.cqbbj.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: DeptController
 * @Description: 部门控制器(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:55
 */
@Controller
@RequestMapping("/dept")
public class DeptController extends BaseController {

    @Autowired
    private IDeptService deptService;// 部门业务

    @Autowired
    private IMenuService menuService;// 菜单业务

    /**
     * 跳转部门管理界面
     *
     * @return
     */
    @RequestMapping("/dept")
    public String dept() {
        log.debug("跳转dept页面");
        return "dept/dept";
    }

    /**
     * 部门绑定菜单页面跳转
     *
     * @return
     */
    @RequestMapping("/deptBindMenu")
    public String deptBindMenu() {
        log.debug("跳转deptBindMenu页面");
        return "dept/deptBindMenu";
    }

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

    /**
     * 查询绑定的菜单
     *
     * @param id
     * @return
     */
    @RequestMapping("/queryBindMenu")
    @ResponseBody
    public Result queryBindMenu(Integer id) {
        if (id == null) {
            return ResultUtils.error();
        }
        // 查询已经绑定的菜单
        List<Integer> menu_ids = deptService.queryBindMenu(id);
        // 查询所有菜单
        List<Menu> menus = menuService.queryAllMenu();
        Map<String, Object> data = new HashMap<>();
        data.put("menu_ids", menu_ids);
        data.put("menus", menus);
        return ResultUtils.success(data);
    }
}
