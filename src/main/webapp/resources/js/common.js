/**
 * 格式化日期时分秒
 * @param timeStamp
 * @returns {string}
 */
function formatDateTime(timeStamp) {
    if (typeof timeStamp == "undefined" || timeStamp == "") {
        return "";
    }
    var date = new Date(timeStamp);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    var h = date.getHours();
    h = h < 10 ? ('0' + h) : h;
    var minute = date.getMinutes();
    var second = date.getSeconds();
    minute = minute < 10 ? ('0' + minute) : minute;
    second = second < 10 ? ('0' + second) : second;
    return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second;
}

/**
 * 格式化日期
 * @param timeStamp
 * @returns {string}
 */
function formatDate(timeStamp) {
    if (typeof timeStamp == "undefined" || timeStamp == "") {
        return "";
    }
    var date = new Date(timeStamp);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    return y + '-' + m + '-' + d;
}

/**
 * 获取当前日期
 * @returns {string}
 */
function currentDate() {
    var date = new Date();

    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();

    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (day >= 0 && day <= 9) {
        day = "0" + day;
    }
    return year + "-" + month + "-" + day;
}

/**
 * 计算日期
 * @param date
 * @param num
 * @returns {string}
 */
function addDay(date, num) {
    var times = date.getTime() + num * 24 * 60 * 60 * 1000;
    return formatDate(times);
}

/**
 * 验证空对象
 * @param obj
 * @returns {boolean}
 */
function isEmptyObject(obj) {
    for (var key in obj) {
        return false
    }
    ;
    return true
}

/**
 * 验证为空
 * @param obj
 * @returns {boolean}
 */
function isEmpty(obj) {
    return typeof obj == "undefined" || obj == null || obj == "" || obj == "null";
}

/**
 * 返回整数
 * @param value
 * @returns {number}
 */
function returnInt(value) {
    return isEmpty(value) ? 0 : value;
}

/**
 * 返回小数
 * @param value
 * @returns {number}
 */
function returnDouble(value) {
    return isEmpty(value) ? 0.00 : value;
}