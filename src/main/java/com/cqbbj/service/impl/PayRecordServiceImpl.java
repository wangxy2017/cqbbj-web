package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.PayRecordMapper;
import com.cqbbj.entity.PayRecord;
import com.cqbbj.service.IPayRecordService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: PayRecordServiceImpl
 * @Description: 支付记录实现(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:08
 */
@Service
public class PayRecordServiceImpl implements IPayRecordService {

    /**
     * 支付记录Mapper
     */
    @Autowired
    private PayRecordMapper payRecordMapper;




    @Override
    public int saveEntity(PayRecord payRecord) {
        return payRecordMapper.save(payRecord);
    }

    @Override
    public int updateEntity(PayRecord payRecord) {
        return 0;
    }

    @Override
    public void deleteEntity(Integer id) {
        payRecordMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {
        payRecordMapper.deleteActive(id);
    }

    @Override
    public List<PayRecord> queryList(PayRecord payRecord) {
        return null;
    }

    @Override
    public PageModel<PayRecord> queryPageList(PayRecord payRecord, int pageNum, int pageSize) {
        return null;
    }

    @Override
    public PageModel<PayRecord> queryPageList(PayRecord payRecord, Date startTime, Date endTime, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Map map=new HashMap();
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        map.put("order_no",payRecord.getOrder_no());
        map.put("trans_no",payRecord.getTrans_no());
        map.put("payWay",payRecord.getPayWay());
        map.put("startTime",startTime==null?null:format.format(startTime));
        //System.out.println("**************开始时间为"+ map.get("startTime"));
        map.put("endTime",endTime==null?null:format.format(endTime));
        List<PayRecord> list = payRecordMapper.queryList(map);
        PageInfo<PayRecord> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public PayRecord queryById(Integer id) {
        PayRecord payRecord=  payRecordMapper.queryById(id);
        return payRecord;
    }

    @Override
    public PayRecord queryByProperties(PayRecord payRecord) {
        return null;
    }
}
