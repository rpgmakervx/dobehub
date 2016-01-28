/**
 * Created by Administrator on 2015/11/15.
 */

var PIC_SIZE = 150 * 1024;
var page_index = 1;
$(function () {
    Date.prototype.format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1, //月份
            "d+": this.getDate(), //日
            "h+": this.getHours(), //小时
            "m+": this.getMinutes(), //分
            "s+": this.getSeconds(), //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds() //毫秒
        };
        if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    }
    initPage();
    //点击选择图片时下拉出现的模板
    $("#camera-chooser").on("click", function () {
        $(this).css("display","block");
        $ ('#image-board').slideDown(200)
    });
    //关闭模板时模板上滑消失
    $("#img-close-icon").on("click", function () {
        $ ('#image-board').slideUp(200, function () {
            $(this).css("display","none");
        });
    });
    //删除选中的文件和缩略图
    $("#img-remove-icon").on("click", function () {
        $("#picture").val("");
        $("#show-picture").css("display","none");
        $(".upload-image").css("display","none");
        $("#img-remove-icon").css("display","none");
    });
    //更改上传的图片时的业务逻辑
    $("#picture").on("change", function () {
        var pictureform = $("#picture")[0];
        var picturepath = pictureform.value;
        var src = window.URL.createObjectURL(pictureform.files[0]);
        var reg = /\.(jpe?g|gif|png|ico|bmp)$/i;
        if(!reg.test(picturepath)){
            $("#file-size-warning").css("color","#E84940");
            $("#file-size-warning").html("你上传的文件非图片！我要告诉管理员！");
            $("#picture").val("");
        }else if(pictureform.files[0].size>PIC_SIZE){
            $("#file-size-warning").css("color","#E84940");
            $("#file-size-warning").html("你上传的图片太大了！我要告诉管理员！");
            $("#picture").val("");
        }else{
            $("#file-size-warning").css("color","#999999");
            $("#file-size-warning").html("请选择图片文件，不要超过150k哦~~");
            $("#show-picture").css("display","inline-block");
            //设置图片地址 并显示图片
            $(".upload-image").attr("src",src);
            $(".upload-image").css("display","block");
            //显示删除按钮
            $("#img-remove-icon").css("display","block");
        }
    });

    $(".item-box").on("click", function () {
        $(".item-box").removeClass("strategy-selected");
        $(this).addClass("strategy-selected");
    });
    $(".cmt-btn").click(function(){
        var comments = $(this).parent().parent(".trend-message-foot").next(".comment-list");
        if(comments.hasClass("hidden-block")){
            comments.removeClass("hidden-block")
            comments.addClass("show-block")
        }else{
            comments.removeClass("show-block")
            comments.addClass("hidden-block")
        }
    });
    $("#announce-remove").click(function(){
        $("#announce-board").slideUp(200, function () {
            $(this).css("display","none");
        });
    });
    $("#publish-btn").click(function(){
        if($("#trend-message-body").val()!=""){
            $("#trend-form").submit();
        }else{
            alert("请填写内容！")
        }
    });
});

function generateActivity(activity){
    var dl = $("<dl></dl>");
    var dt = $("<dt class='pull-left'></dt>");
    var dd = $("<dd class='pull-left'></dd>");
    var headImg = $("<img class='user-img-rectangle' src='assets/images/user/"+activity.user.clientId+"/head.jpg' />")
    dt.append(headImg);
    var trends_message_box = $("<div class='trends-message-box blackboard'>");
    var trends_message_head = $("<div class='trend-message-head'>");
    var username_lab = $("<a href='#' class='username-lab15'></a>");
    username_lab.html(activity.user.username);
    var space = $("<span class='space-18'></span>");
    var intro = $("<span class='obscure-lab' title='"+activity.user.introduce+"'> —— "+activity.user.introduce+"</span>");
    var trends_message_body = $("<div class='trend-message-body message-board'></div>");
    var content = $("<p></p>");
    var timestamp = $("<p class='obscure-lab'></p>")
    content.html(activity.content);
    timestamp.html(judgeDate(new Date(activity.createdAt)));
    trends_message_body.append(content).append(timestamp);
    var trends_message_foot = $("<div class='trend-message-foot'></div>");
    var agree_btn = $("<span class='agree-btn'></span>");
    var agree_hook = $("<a href='#'></a>");
    var share_btn = $("<span class='share-btn'></span>");
    var share_hook = $("<a href='#'></a>");
    var comment_btn = $("<span class='comment-btn'></span>");
    var comment_hook = $("<a href='#' class='cmt-btn'></a>");
    var agree_count = $("<b class='count'></b>");
    var share_count = $("<b class='count'></b>");
    var comment_count = $("<b class='count'></b>");
    agree_count.html(activity.agreed);
    share_count.html(activity.shared);
    comment_count.html(activity.cmted);
    agree_hook.append("<i class='glyphicon glyphicon-thumbs-up'></i>").append(agree_count);
    share_hook.append("<i class='glyphicon glyphicon-share-alt'></i>").append(share_count);
    comment_hook.append("<i class='glyphicon glyphicon-comment'></i>").append(comment_count);
    agree_btn.append(agree_hook);
    share_btn.append(share_hook);
    comment_btn.append(comment_hook);
    trends_message_foot.append(agree_btn).append(share_btn).append(comment_btn);
    trends_message_head.append(username_lab).append(space).append(intro);
    trends_message_box.append(trends_message_head).append(trends_message_body).append(trends_message_foot);
    dd.append(trends_message_box);
    dl.append(dt).append(dd);
    $("#contents-body").append(dl);
}
function initPage(){
    //首页刷新所有的动态
    $.ajax({
        type:"GET",
        url:"activity/fetchAll?pageindex=1",
        dataType:"json",
        contentType:"application/json",
        success:function(data){
            var acts = data.activities;
            for(var i=0;i<acts.length;i++){
                generateActivity(acts[i]);
            }
            var more_info = $("<div class='more-info' onclick='nextPage()'></div>");
            if(acts.length==0){
                more_info.append("<span>没有更多动态</span>");
                more_info.attr("onclick","void(0)");
            }else{
                more_info.append("<a href='javascript:void(0)'>查看更多>></a>");
            }
            $("#contents-body").after(more_info);
            $(".share-btn").attr("title","转发数")
            $(".cmt-btn").attr("title","评论数")
            $(".agree-btn").attr("title","获赞数")
        }
    });
}
function nextPage(){
    page_index++;
    $.ajax({
        type:"GET",
        url:"activity/fetchAll?pageindex="+page_index,
        dataType:"json",
        contentType:"application/json",
        success:function(data){
            var acts = data.activities;
            if(acts.length==0){
                page_index--;
                $(".more-info").html("<span>没有更多动态</span>");
                $(".more-info").attr("onclick","void(0)");
            }
            for(var i=0;i<acts.length;i++){
                generateActivity(acts[i]);
            }
        }
    });
}
//计算时间并按照自定义格式化输出的方法
function judgePastDate(date){
    var now = new Date();
    var gap = (now - date);
    var monthGap = Math.floor(gap/(1000*60*60*24*30));
    var dateGap = Math.floor(gap/(1000*60*60*24));
    var hourGap = Math.floor(gap/(1000*60*60));
    var minuGap = Math.floor(gap/(1000*60));
    var secondGap = Math.floor(gap/(1000));
    if(date.getFullYear()!=now.getFullYear()&&monthGap>=12){
        return date.format("yyyy-MM-dd hh:mm:ss");
    }else if(monthGap<12&&monthGap>=1&&date.getFullYear()==now.getFullYear()){
        return parseInt(monthGap)+"个月前";
    }else if(dateGap>=7&&monthGap==0){
        return parseInt(dateGap/7)+"周前";
    }else if(dateGap<7&&dateGap>=1){
        return parseInt(dateGap)+"天前";
    }else if(hourGap<24&&hourGap>=1&&dateGap==0){
        return parseInt(hourGap)+"小时前";
    }else if(minuGap<60&&minuGap>=1&&hourGap==0){
        return parseInt(minuGap)+"分钟前";
    }else if(secondGap<60&secondGap>=0&&minuGap==0){
        return parseInt(secondGap)+"秒前";
    }else{
        err = secondGap;
        return "日期有问题";
    }
}

function judgeDate(date){
    var now = new Date();
    var dateGap = now.getDate()-date.getDate();
    if(dateGap<1){
        return date.format("hh:mm");
    }else if(dateGap==1){
        return "昨天 "+date.format("hh:mm");
    }else if(dateGap==2){
        return "前天 "+date.format("hh:mm");
    }else{
        return date.format("yyyy-MM-dd hh:mm:ss");
    }
}