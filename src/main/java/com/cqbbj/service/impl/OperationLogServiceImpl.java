package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.OperationLogMapper;
import com.cqbbj.entity.OperationLog;
import com.cqbbj.service.IOperationLogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: OperationLogServiceImpl
 * @Description: 操作日志业务层实现(这里用一句话描述这个类的作用)
 * @date 2019/2/19 10:20
 */
@Service
public class OperationLogServiceImpl implements IOperationLogService {

    /**
     * 操作日志Mapper
     */
    @Autowired
    private OperationLogMapper operationLogMapper;

    @Override
    public int saveEntity(OperationLog operationLog) {
        return operationLogMapper.save(operationLog);
    }

    @Override
    public int updateEntity(OperationLog operationLog) {
        return 0;
    }

    @Override
    public void deleteEntity(Integer id) {

    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<OperationLog> queryList(OperationLog operationLog) {
        return null;
    }

    @Override
    public PageModel<OperationLog> queryPageList(OperationLog operationLog, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<OperationLog> list = operationLogMapper.queryList(operationLog);
        PageInfo<OperationLog> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public OperationLog queryById(Integer id) {
        return null;
    }
}
