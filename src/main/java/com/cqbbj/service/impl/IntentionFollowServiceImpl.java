package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.IntentionFollowMapper;
import com.cqbbj.entity.IntentionFollow;
import com.cqbbj.service.IIntentionFollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IntentionFollowServiceImpl
 * @Description: 跟进记录实现类(这里用一句话描述这个类的作用)
 * @date 2019/3/10 21:55
 */
@Service
public class IntentionFollowServiceImpl implements IIntentionFollowService {

    @Autowired
    private IntentionFollowMapper intentionFollowMapper;

    @Override
    public int saveEntity(IntentionFollow intentionFollow) {
        return intentionFollowMapper.save(intentionFollow);
    }

    @Override
    public int updateEntity(IntentionFollow intentionFollow) {
        return 0;
    }

    @Override
    public void deleteEntity(Integer id) {
        intentionFollowMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<IntentionFollow> queryList(IntentionFollow intentionFollow) {
        return intentionFollowMapper.queryList(intentionFollow);
    }

    @Override
    public PageModel<IntentionFollow> queryPageList(IntentionFollow intentionFollow, int pageNum, int pageSize) {
        return null;
    }

    @Override
    public IntentionFollow queryById(Integer id) {
        return intentionFollowMapper.queryById(id);
    }
}
