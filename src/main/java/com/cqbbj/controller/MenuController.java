package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Menu;
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
     * 菜单管理页面跳转
     *
     * @return
     */
    @RequestMapping("/menu")
    public String menu() {
        log.debug("跳转menu页面");
        return "menu/menu";
    }

    /**
     * 新增菜单页面跳转
     *
     * @return
     */
    @RequestMapping("/menuAdd")
    public String menuAdd() {
        log.debug("跳转menuAdd页面");
        return "menu/menuAdd";
    }

    /**
     * 修改菜单页面跳转
     *
     * @return
     */
    @RequestMapping("/menuUpdate")
    public String menuUpdate() {
        log.debug("跳转menuUpdate页面");
        return "menu/menuUpdate";
    }


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
     * 批量删除
     *
     * @param ids
     * @return
     */
    @RequestMapping("/deleteBatch")
    @ResponseBody
    public Result deleteBatch(String ids) {
        for (Integer id : CommUtils.toIntegerArray(ids)) {
            menuService.deleteEntity(id);
        }
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

    /**
     * 根据ID查询菜单
     *
     * @param id
     * @return
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Result queryById(Integer id) {
        Menu menu = menuService.queryById(id);
        // 查询所有父级菜单
        Menu memu1 = new Menu();
        memu1.setPid(0);
        List<Menu> menus = menuService.queryList(memu1);
        Map<String, Object> data = new HashMap<>();
        data.put("menu", menu);
        data.put("menus", menus);
        return ResultUtils.success(data);
    }

    /**
     * 查询菜单列表
     *
     * @param menu
     * @return
     */
    @RequestMapping("/queryList")
    @ResponseBody
    public Result queryList(Menu menu) {
        List<Menu> list = menuService.queryList(menu);
        return ResultUtils.success(list);
    }
}
