package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.PositionMapper;
import com.cqbbj.entity.Position;
import com.cqbbj.service.IPositionService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: PositionServiceImpl
 * @Description: 职位实现类(这里用一句话描述这个类的作用)
 * @date 2019/2/18 15:42
 */
@Service
public class PositionServiceImpl implements IPositionService {

    /**
     * 职位Mapper
     */
    @Autowired
    private PositionMapper positionMapper;

    @Override
    public int saveEntity(Position position) {
        return positionMapper.save(position);
    }

    @Override
    public int updateEntity(Position position) {
        return positionMapper.update(position);
    }

    @Override
    public void deleteEntity(Integer id) {
        positionMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<Position> queryList(Position position) {
        return positionMapper.queryList(position);
    }

    @Override
    public PageModel<Position> queryPageList(Position position, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Position> list = positionMapper.queryList(position);
        PageInfo<Position> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public Position queryById(Integer id) {
        return null;
    }

    @Override
    public Position queryByProperties(Position position) {
        return null;
    }
}
