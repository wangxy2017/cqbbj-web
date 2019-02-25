package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Car;
import com.cqbbj.service.ICarService;
import com.cqbbj.service.IOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CarController
 * @Description: 车辆控制层(这里用一句话描述这个类的作用)
 * @date 2019/2/21 16:24
 */
@Controller
@RequestMapping("/car")
public class CarController extends BaseController {

    @Autowired
    private ICarService carService;// 车辆业务层
    @Autowired
    private IOperationLogService operationLogService;// 操作日志

    /**
     * 新增车辆
     *
     * @param car
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(HttpServletRequest request, Car car) {
        car.setCreateTime(new Date());
        car.setDeleteStatus(0);
        car.setCar_no(CommUtils.getCode("CR"));
        carService.saveEntity(car);
        // 记录日志
        operationLogService.saveEntity(
                createLog(request, "新增车辆：" + car.getCar_no()));
        return ResultUtils.success();
    }

    /**
     * 修改车辆信息
     *
     * @param request
     * @param car
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(HttpServletRequest request, Car car) {
        carService.updateEntity(car);
        // 记录日志
        operationLogService.saveEntity(
                createLog(request, "修改车辆信息：" + car.getCar_no()));
        return ResultUtils.success();
    }

    /**
     * 分页查询
     *
     * @param car
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(Car car, Integer pageNum, Integer pageSize) {
        PageModel<Car> pageModel = carService.queryPageList(car, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }
}