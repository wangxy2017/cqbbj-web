package com.cqbbj.entity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: OperateData
 * @Description: 经营数据(这里用一句话描述这个类的作用)
 * @date 2019/3/26 14:13
 */
public class OperateData {
    /**
     * 订单录入
     */
    private Long intention;
    private Double intentionMoney;
    /**
     * 尚未派单
     */
    private Long unDispatch;
    private Double unDispatchMoney;
    /**
     * 已派订单
     */
    private Long dispatch;
    private Double dispatchMoney;
    /**
     * 完成订单
     */
    private Long done;
    private Double doneMoney;
    /**
     * 作废订单
     */
    private Long cancel;
    private Double cancelMoney;
    /**
     * 结算订单
     */
    private Long clean;
    private Double cleanMoney;
    /**
     * 未结算订单
     */
    private Long unClean;
    private Double unCleanMoney;

    /**
     * 未收款订单
     */
    private Long unPay;
    private Double unPayMoney;
    /**
     * 已收款订单
     */
    private Long pay;
    private Double payMoney;

    public Long getIntention() {
        return intention;
    }

    public void setIntention(Long intention) {
        this.intention = intention;
    }

    public Double getIntentionMoney() {
        return intentionMoney;
    }

    public void setIntentionMoney(Double intentionMoney) {
        this.intentionMoney = intentionMoney;
    }

    public Long getUnDispatch() {
        return unDispatch;
    }

    public void setUnDispatch(Long unDispatch) {
        this.unDispatch = unDispatch;
    }

    public Double getUnDispatchMoney() {
        return unDispatchMoney;
    }

    public void setUnDispatchMoney(Double unDispatchMoney) {
        this.unDispatchMoney = unDispatchMoney;
    }

    public Long getDispatch() {
        return dispatch;
    }

    public void setDispatch(Long dispatch) {
        this.dispatch = dispatch;
    }

    public Double getDispatchMoney() {
        return dispatchMoney;
    }

    public void setDispatchMoney(Double dispatchMoney) {
        this.dispatchMoney = dispatchMoney;
    }

    public Long getDone() {
        return done;
    }

    public void setDone(Long done) {
        this.done = done;
    }

    public Double getDoneMoney() {
        return doneMoney;
    }

    public void setDoneMoney(Double doneMoney) {
        this.doneMoney = doneMoney;
    }

    public Long getCancel() {
        return cancel;
    }

    public void setCancel(Long cancel) {
        this.cancel = cancel;
    }

    public Double getCancelMoney() {
        return cancelMoney;
    }

    public void setCancelMoney(Double cancelMoney) {
        this.cancelMoney = cancelMoney;
    }

    public Long getClean() {
        return clean;
    }

    public void setClean(Long clean) {
        this.clean = clean;
    }

    public Double getCleanMoney() {
        return cleanMoney;
    }

    public void setCleanMoney(Double cleanMoney) {
        this.cleanMoney = cleanMoney;
    }

    public Long getUnClean() {
        return unClean;
    }

    public void setUnClean(Long unClean) {
        this.unClean = unClean;
    }

    public Double getUnCleanMoney() {
        return unCleanMoney;
    }

    public void setUnCleanMoney(Double unCleanMoney) {
        this.unCleanMoney = unCleanMoney;
    }

    public Long getUnPay() {
        return unPay;
    }

    public void setUnPay(Long unPay) {
        this.unPay = unPay;
    }

    public Double getUnPayMoney() {
        return unPayMoney;
    }

    public void setUnPayMoney(Double unPayMoney) {
        this.unPayMoney = unPayMoney;
    }

    public Long getPay() {
        return pay;
    }

    public void setPay(Long pay) {
        this.pay = pay;
    }

    public Double getPayMoney() {
        return payMoney;
    }

    public void setPayMoney(Double payMoney) {
        this.payMoney = payMoney;
    }
}
