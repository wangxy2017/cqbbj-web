package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.NoticeMapper;
import com.cqbbj.entity.Car;
import com.cqbbj.entity.Notice;
import com.cqbbj.service.INoticeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: NoticeServiceImpl
 * @Description: 公告实现(这里用一句话描述这个类的作用)
 * @date 2019/3/20 21:22
 */
@Service
public class NoticeServiceImpl implements INoticeService {

    /**
     * 公告Mapper
     */
    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public int saveEntity(Notice notice) {
        return noticeMapper.save(notice);
    }

    @Override
    public int updateEntity(Notice notice) {
        return noticeMapper.update(notice);
    }

    @Override
    public void deleteEntity(Integer id) {
        noticeMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<Notice> queryList(Notice notice) {
        return noticeMapper.queryList(notice);
    }

    @Override
    public PageModel<Notice> queryPageList(Notice notice, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Notice> list = noticeMapper.queryList(notice);
        PageInfo<Notice> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public Notice queryById(Integer id) {
        return noticeMapper.queryById(id);
    }

    @Override
    public Notice queryByProperties(Notice notice) {
        return null;
    }
}
