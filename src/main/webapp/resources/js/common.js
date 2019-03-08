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
};

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
};

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
};