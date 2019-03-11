package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.CodeMapper;
import com.cqbbj.entity.Code;
import com.cqbbj.service.ICodeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class CodeServerImpl implements ICodeService {

    /**
     * 验证码Mapper
     */
    @Autowired
    private CodeMapper codeMapper;

    @Override
    public Code queryCodeByPhone(String phone) {
        return codeMapper.queryByPhone(phone);
    }



    @Override
    public void deleteEntity(Integer id) {
        codeMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {
        codeMapper.deleteActive(id);
    }

    @Override
    public int saveEntity(Code code) {

        return  codeMapper.save(code);
    }

    @Override
    public int updateEntity(Code code) {
        return codeMapper.update(code);
    }

    @Override
    public List<Code> queryList(Code code) {
        return codeMapper.queryList(code);
    }

    @Override
    public PageModel<Code> queryPageList(Code code, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Code> list = codeMapper.queryList(code);
        PageInfo<Code> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public Code queryById(Integer id) {
        return codeMapper.queryById(id);
    }
}
