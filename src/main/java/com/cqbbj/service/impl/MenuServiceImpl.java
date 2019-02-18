package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.MenuMapper;
import com.cqbbj.entity.Menu;
import com.cqbbj.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return null;
    }

    @Override
    public PageModel<Menu> queryPageList(Menu menu, int pageNum, int pageSize) {
        return null;
    }

    @Override
    public Menu queryById(Integer id) {
        return null;
    }
}
