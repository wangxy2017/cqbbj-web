var main = new Vue({
    el: "#main",
    data: {

        orders:{}
    },
    methods: {

        unComplete:function(){
            $.ajax({
                url:"/wx/myTask/queryTaskList",
                data:{status:1 ,pageNum:1,
                    pageSize:4},
                dataType:"JSON",
                type:"POST",
                success:function(result){
                    console.log(result);
                    main.orders=result.data.list;
            },error:function(){
                    toastr.error("数据异常");
                }
            })
        },
        complete:function(){
            $.ajax({
                url:"/wx/myTask/queryTaskList",
                data:{status:2 ,pageNum:1,
                    pageSize:4},
                dataType:"JSON",
                type:"post",
                success:function(result){
                    console.log(result);
                    main.orders=result.data.list;
                },error:function(){
                    toastr.error("数据异常");
                }
            })
        },

        view:function (id) {
            setTimeout(function () {
                window.location.href = "/wx/order/orderDetail?id="+id;
            },100)

        },
        open:function (event) {
            // console.log("123");
            var el=event.currentTarget;
            $(el).children('.display').toggle(500).css('display');
        },
    },
    mounted: function () {
        /**
         * tab切换函数
         */
            $(".title .col-sm-5").click(function () {
                $(this).addClass("boder_bottom").siblings().removeClass("boder_bottom");
                var c = document.getElementsByClassName("complete");
                var i =$(this).attr('data-show');
                c = i;
                if(i!=0){
                    $(".complete").hide();
                    $(".unfinished").show();
                }else {
                    $(".complete").show();
                    $(".unfinished").hide();
                }

            });


            this.$http.post("/wx/myTask/queryTaskList",{
                status:1,
                pageNum:1,
                pageSize:4
            },{emulateJSON:true}).then(function (res) {
                console.log(res.body);
                this.orders=res.body.data.list;
            },function () {
                toastr.error("数据异常");
            })
    }
});