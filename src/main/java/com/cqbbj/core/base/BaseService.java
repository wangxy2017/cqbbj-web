/**
 * @Description: 基础服务层(用一句话描述该文件做什么)
 * @author wangxy
 * @date 2019/1/14 10:07
 * @version V1.0
 */
package com.cqbbj.core.base;

import java.util.List;

public interface BaseService<T> {
    /**
     * 保存对象
     *
     * @param t
     * @return
     */
    int saveEntity(T t);

    /**
     * 修改对象
     *
     * @param t
     * @return
     */
    int updateEntity(T t);

    /**
     * 根据对象ID物理删除对象
     *
     * @param id
     */
    void deleteEntity(Integer id);

    /**
     * 根据对象ID逻辑删除对象
     *
     * @param id
     */
    void deleteEntityActive(Integer id);

    /**
     * 条件查询对象列表
     *
     * @param t
     * @return
     */
    List<T> queryList(T t);

    /**
     * 分页条件查询对象列表
     *
     * @param t
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageModel<T> queryPageList(T t, int pageNum, int pageSize);

    /**
     * 根据ID查询对象
     *
     * @param id
     * @return
     */
    T queryById(Integer id);

    /**
     * 根据对象属性查询对象
     *
     * @param t
     * @return
     */
    T queryByProperties(T t);
}
