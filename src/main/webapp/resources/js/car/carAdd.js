layui.use('form', function(){
    var form = layui.form;
    var layer = layui.layer;
    var laydate = layui.laydate;

    //监听提交
    form.on('submit(formDemo)', function(data){
        layer.msg(JSON.stringify(data.field));
        return false;
    });
});