package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.MenuMapper;
import com.cqbbj.entity.Menu;
import com.cqbbj.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: MenuServiceImpl
 * @Description: 菜单业务层实现(这里用一句话描述这个类的作用)
 * @date 2019/2/18 13:57
 */
@Service
public class MenuServiceImpl implements IMenuService {
    /**
     * 菜单Mapper
     */
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public int saveEntity(Menu menu) {
        return menuMapper.save(menu);
    }

    @Override
    public int updateEntity(Menu menu) {
        return menuMapper.update(menu);
    }

    @Override
    public void deleteEntity(Integer id) {
        menuMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<Menu> queryList(Menu menu) {
        return menuMapper.queryList(menu);
    }

    @Override
    public PageModel<Menu> queryPageList(Menu menu, int pageNum, int pageSize) {
        return null;
    }

    @Override
    public Menu queryById(Integer id) {
        return null;
    }

    /**
     * 菜单排序
     *
     * @param list
     * @return
     */
    private List<Menu> sortMenus(List<Menu> list) {
        // 1.晒筛选出所有一级菜单
        List<Menu> newList = new ArrayList<>();
        for (Menu menu :
                list) {
            if (menu.getPid() == 0) {
                newList.add(menu);
            }
        }
        Collections.sort(newList);// 排序
        // 2.筛选二级菜单，并追加到父节点
        for (Menu menu :
                newList) {
            List<Menu> newList2 = new ArrayList<>();
            for (Menu menu2 :
                    list) {
                if (menu2.getPid() == menu.getId()) {
                    newList2.add(menu2);
                }
            }
            Collections.sort(newList2);// 排序
            menu.setChilds(newList2);
        }
        return newList;
    }

    @Override
    public List<Menu> queryAllMenu() {
        List<Menu> menus = menuMapper.queryList(null);
        return sortMenus(menus);
    }

    @Override
    public List<Menu> queryMenuByDept(Integer dept_id) {
        List<Menu> menus = menuMapper.queryMenuByDept(dept_id);
        return sortMenus(menus);
    }
}
