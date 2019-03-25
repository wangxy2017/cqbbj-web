package com.cqbbj.entity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: OrderData
 * @Description: 订单统计(这里用一句话描述这个类的作用)
 * @date 2019/3/25 18:27
 */
public class OrderData {

    /**
     * 订单录入
     */
    private int intention;
    private double intentionMoney;
    /**
     * 尚未派单
     */
    private int unDispatch;
    private double unDispatchMoney;
    /**
     * 已派订单
     */
    private int dispatch;
    private double dispatchMoney;
    /**
     * 完成订单
     */
    private int done;
    private double doneMoney;
    /**
     * 作废订单
     */
    private int cancel;
    private double cancelMoney;

    public int getIntention() {
        return intention;
    }

    public void setIntention(int intention) {
        this.intention = intention;
    }

    public double getIntentionMoney() {
        return intentionMoney;
    }

    public void setIntentionMoney(double intentionMoney) {
        this.intentionMoney = intentionMoney;
    }

    public int getUnDispatch() {
        return unDispatch;
    }

    public void setUnDispatch(int unDispatch) {
        this.unDispatch = unDispatch;
    }

    public double getUnDispatchMoney() {
        return unDispatchMoney;
    }

    public void setUnDispatchMoney(double unDispatchMoney) {
        this.unDispatchMoney = unDispatchMoney;
    }

    public int getDispatch() {
        return dispatch;
    }

    public void setDispatch(int dispatch) {
        this.dispatch = dispatch;
    }

    public double getDispatchMoney() {
        return dispatchMoney;
    }

    public void setDispatchMoney(double dispatchMoney) {
        this.dispatchMoney = dispatchMoney;
    }

    public int getDone() {
        return done;
    }

    public void setDone(int done) {
        this.done = done;
    }

    public double getDoneMoney() {
        return doneMoney;
    }

    public void setDoneMoney(double doneMoney) {
        this.doneMoney = doneMoney;
    }

    public int getCancel() {
        return cancel;
    }

    public void setCancel(int cancel) {
        this.cancel = cancel;
    }

    public double getCancelMoney() {
        return cancelMoney;
    }

    public void setCancelMoney(double cancelMoney) {
        this.cancelMoney = cancelMoney;
    }
}
