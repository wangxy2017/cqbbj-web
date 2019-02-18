/**
 * @Description: 基础Mapper(用一句话描述该文件做什么)
 * @author wangxy
 * @date 2019/1/10 14:24
 * @version V1.0
 */
package com.cqbbj.core.base;

import java.util.List;

public interface BaseMapper<T> {
    /**
     * 保存对象
     *
     * @param t
     * @return
     */
    int save(T t);

    /**
     * 修改对象
     *
     * @param t
     * @return
     */
    int update(T t);

    /**
     * 根据对象ID物理删除对象
     *
     * @param id
     */
    void delete(Integer id);

    /**
     * 根据对象ID逻辑删除对象
     *
     * @param id
     */
    void deleteActive(Integer id);

    /**
     * 条件查询对象列表
     *
     * @param t
     * @return
     */
    List<T> queryList(T t);

    /**
     * 根据对象ID查询对象
     *
     * @param id
     * @return
     */
    T queryById(Integer id);
}
