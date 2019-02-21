package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Menu;
import com.cqbbj.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: MenuController
 * @Description: 菜单控制器(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:55
 */
@Controller
@RequestMapping("/menu")
public class MenuController extends BaseController {

    @Autowired
    private IMenuService menuService;// 菜单业务

    /**
     * 新增菜单
     *
     * @param menu
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(Menu menu) {
        menu.setCreateTime(new Date());
        menu.setDeleteStatus(0);
        menuService.saveEntity(menu);
        return ResultUtils.success();
    }

    /**
     * 修改菜单
     *
     * @param menu
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(Menu menu) {
        menuService.updateEntity(menu);
        return ResultUtils.success();
    }

    /**
     * 删除菜单
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(Integer id) {
        menuService.deleteEntity(id);
        return ResultUtils.success();
    }

    /**
     * 查询所有菜单
     *
     * @return
     */
    @RequestMapping("/queryAllMenu")
    @ResponseBody
    public Result queryAllMenu() {
        List<Menu> menus = menuService.queryAllMenu();
        return ResultUtils.success(menus);
    }
}
