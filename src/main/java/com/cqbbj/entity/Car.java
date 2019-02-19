package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: Car
 * @Description: 车辆实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/19 12:07
 */
public class Car extends BaseEntity {

    /**
     * 公司编号
     */
    private String company_no;
    /**
     * 车牌号
     */
    private String license;
    /**
     * 品牌型号
     */
    private String brand;
    /**
     * 发动机号
     */
    private String engine;
    /**
     * 车架号
     */
    private String vin;
    /**
     * 保险到期
     */
    private Date insurance_date;
    /**
     * 年审到期
     */
    private Date examined_date;
    /**
     * 车辆类型 0：大货车 1：小货车 2：轿车
     */
    private Integer carType;
    /**
     * 采购日期
     */
    private Date purchase_date;
    /**
     * 车辆状态 0：正常 1：锁定 2：报废
     */
    private Integer status;
    /**
     * 司机编号
     */
    private String emp_no;
    /**
     * 车辆编号
     */
    private String car_no;

    public String getCompany_no() {
        return company_no;
    }

    public void setCompany_no(String company_no) {
        this.company_no = company_no;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public Date getInsurance_date() {
        return insurance_date;
    }

    public void setInsurance_date(Date insurance_date) {
        this.insurance_date = insurance_date;
    }

    public Date getExamined_date() {
        return examined_date;
    }

    public void setExamined_date(Date examined_date) {
        this.examined_date = examined_date;
    }

    public Integer getCarType() {
        return carType;
    }

    public void setCarType(Integer carType) {
        this.carType = carType;
    }

    public Date getPurchase_date() {
        return purchase_date;
    }

    public void setPurchase_date(Date purchase_date) {
        this.purchase_date = purchase_date;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public String getCar_no() {
        return car_no;
    }

    public void setCar_no(String car_no) {
        this.car_no = car_no;
    }
}
