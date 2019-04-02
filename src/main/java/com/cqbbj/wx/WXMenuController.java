package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Menu;
import com.cqbbj.service.IMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/wx/menu")
public class WXMenuController extends BaseController {

    @Autowired
    private IMenuService menuService;// 菜单

    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(HttpServletRequest request) {
        List<Menu> list = menuService.queryWXMenuByDept(getWXEmpUser(request).getDept_id());
        return ResultUtils.success(list);
    }
}
