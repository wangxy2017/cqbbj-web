package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.MessageLogMapper;
import com.cqbbj.entity.MessageLog;
import com.cqbbj.service.IMessageLogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: MessageLogServiceImpl
 * @Description: 短信日志业务实现(这里用一句话描述这个类的作用)
 * @date 2019/2/19 10:22
 */
@Service
public class MessageLogServiceImpl implements IMessageLogService {

    /**
     * 短信日志Mapper
     */
    @Autowired
    private MessageLogMapper messageLogMapper;

    @Override
    public int saveEntity(MessageLog messageLog) {
        return messageLogMapper.save(messageLog);
    }

    @Override
    public int updateEntity(MessageLog messageLog) {
        return 0;
    }

    @Override
    public void deleteEntity(Integer id) {

    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<MessageLog> queryList(MessageLog messageLog) {
        return null;
    }

    @Override
    public PageModel<MessageLog> queryPageList(MessageLog messageLog, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<MessageLog> list = messageLogMapper.queryList(messageLog);
        PageInfo<MessageLog> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public MessageLog queryById(Integer id) {
        return null;
    }

    @Override
    public MessageLog queryByProperties(MessageLog messageLog) {
        return null;
    }
}
