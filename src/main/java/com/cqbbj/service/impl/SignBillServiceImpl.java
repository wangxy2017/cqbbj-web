package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.SignBillMapper;
import com.cqbbj.entity.SignBill;
import com.cqbbj.service.ISignBillService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SignBillServiceImpl implements ISignBillService {
    @Autowired
    private SignBillMapper signBillMapper;

    @Override
    public PageModel<SignBill> queryPageList(SignBill signBill, Date startTime, Date finishTime, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Map map = new HashMap();
        map.put("name",signBill.getName());
        map.put("order_no",signBill.getOrder_no());
        map.put("status",signBill.getStatus());
        map.put("startTime",startTime);
        map.put("finishTime",finishTime);
        List<SignBill> list=signBillMapper.queryList(map);
        PageInfo<SignBill> pageInfo = new PageInfo<>(list);

        return new PageModel(pageInfo);
    }

    @Override
    public int saveEntity(SignBill signBill) {
        return signBillMapper.save(signBill);
    }

    @Override
    public int updateEntity(SignBill signBill) {
        return 0;
    }

    @Override
    public void deleteEntity(Integer id) {

    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<SignBill> queryList(SignBill signBill) {
        return null;
    }

    @Override
    public PageModel<SignBill> queryPageList(SignBill signBill, int pageNum, int pageSize) {
        return null;
    }

    @Override
    public SignBill queryById(Integer id) {
        return null;
    }
}
