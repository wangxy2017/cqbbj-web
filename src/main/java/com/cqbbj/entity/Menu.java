package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: Menu
 * @Description: 菜单实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/18 11:35
 */
public class Menu extends BaseEntity implements Comparable<Menu> {

    /**
     * 菜单名称
     */
    private String name;
    /**
     * 跳转路径
     */
    private String url;
    /**
     * 菜单图标
     */
    private String icon;
    /**
     * 父ID
     */
    private Integer pid;
    /**
     * 是否禁用 0：启用 1：禁用
     */
    private Integer is_disabled;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 子集
     */
    private List<Menu> childs;

    /**
     * 菜单类型 0：PC 1：微信 2：APP
     */
    private Integer type;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getIs_disabled() {
        return is_disabled;
    }

    public void setIs_disabled(Integer is_disabled) {
        this.is_disabled = is_disabled;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public List<Menu> getChilds() {
        return childs;
    }

    public void setChilds(List<Menu> childs) {
        this.childs = childs;
    }

    @Override
    public int compareTo(Menu menu) {
        return (this.sort < menu.getSort()) ? -1 : ((this.sort == menu.getSort()) ? 0 : 1);
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
