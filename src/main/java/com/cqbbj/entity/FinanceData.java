package com.cqbbj.entity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: FinanceData
 * @Description: 财务统计(这里用一句话描述这个类的作用)
 * @date 2019/3/25 18:27
 */
public class FinanceData {

    /**
     * 结算订单
     */
    private int clean;
    private double cleanMoney;
    /**
     * 未结算订单
     */
    private int unClean;
    private double unCleanMoney;

    /**
     * 未收款订单
     */
    private int unPay;
    private double unPayMoney;
    /**
     * 已收款订单
     */
    private int pay;
    private double payMoney;

    public int getClean() {
        return clean;
    }

    public void setClean(int clean) {
        this.clean = clean;
    }

    public double getCleanMoney() {
        return cleanMoney;
    }

    public void setCleanMoney(double cleanMoney) {
        this.cleanMoney = cleanMoney;
    }

    public int getUnClean() {
        return unClean;
    }

    public void setUnClean(int unClean) {
        this.unClean = unClean;
    }

    public double getUnCleanMoney() {
        return unCleanMoney;
    }

    public void setUnCleanMoney(double unCleanMoney) {
        this.unCleanMoney = unCleanMoney;
    }

    public int getUnPay() {
        return unPay;
    }

    public void setUnPay(int unPay) {
        this.unPay = unPay;
    }

    public double getUnPayMoney() {
        return unPayMoney;
    }

    public void setUnPayMoney(double unPayMoney) {
        this.unPayMoney = unPayMoney;
    }

    public int getPay() {
        return pay;
    }

    public void setPay(int pay) {
        this.pay = pay;
    }

    public double getPayMoney() {
        return payMoney;
    }

    public void setPayMoney(double payMoney) {
        this.payMoney = payMoney;
    }
}
