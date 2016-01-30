/**
 * Created by Administrator on 2015/11/15.
 */

var PIC_SIZE = 2*1024 * 1024;
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
    initButton();
    initPage();
});
function initButton() {
    //点击选择图片时下拉出现的模板
    $("#camera-chooser").on("click", function () {
        $(this).css("display", "block");
        $('#image-board').slideDown(200)
    });
    //关闭模板时模板上滑消失
    $("#img-close-icon").on("click", function () {
        $('#image-board').slideUp(200, function () {
            $(this).css("display", "none");
        });
    });
    //删除选中的文件和缩略图
    $("#img-remove-icon").on("click", function () {
        $("#picture").val("");
        $("#show-picture").css("display", "none");
        $(".upload-image").css("display", "none");
        $("#img-remove-icon").css("display", "none");
    });
    //更改上传的图片时的业务逻辑
    $("#picture").on("change", function () {
        var pictureform = $("#picture")[0];
        var picturepath = pictureform.value;
        var src = window.URL.createObjectURL(pictureform.files[0]);
        var reg = /\.(jpeg|jpg|gif|png|ico|bmp)$/i;
        if (!reg.test(picturepath)) {
            $("#file-size-warning").css("color", "#E84940");
            $("#file-size-warning").html("你上传的文件非图片！我要告诉管理员！");
            $("#picture").val("");
        } else if (pictureform.files[0].size > PIC_SIZE) {
            $("#file-size-warning").css("color", "#E84940");
            $("#file-size-warning").html("你上传的图片太大了！我要告诉管理员！");
            $("#picture").val("");
        } else {
            $("#file-size-warning").css("color", "#999999");
            $("#file-size-warning").html("请选择图片文件，2M是最大的限制了~~");
            $("#show-picture").css("display", "inline-block");
            //设置图片地址 并显示图片
            $(".upload-image").attr("src", src);
            $(".upload-image").css("display", "block");
            //显示删除按钮
            $("#img-remove-icon").css("display", "block");
        }
    });

    $(".item-box").on("click", function () {
        $(".item-box").removeClass("strategy-selected");
        $(this).addClass("strategy-selected");
    });
    $(".announce-remove").click(function () {
        $("#announce-board").slideUp(200, function () {
            $(this).css("display", "none");
        });
    });
}
function submitAction(){
    var pictureform = $("#picture")[0]
    var formData = new FormData();
    if(pictureform.value!=""){
        formData.append("picture",pictureform.files[0]);
    }
    if ($("#trend-message-body").val()== "") {
        alert("请填写内容！")
    } else {
        formData.append("content",$("#trend-message-body").val());
        $.ajax({
            processData : false,
            contentType : false,
            data : formData,
            type:"POST",
            url:"activity/5623365215/add",
            success:function(data){
                if(data.code==404){
                    alert(data.message);
                }else{
                    act = data.activity;
                    prependActivity(data.activity);
                }
            }
        });
        $("#trend-message-body").val("");
        showModal();
    }
}
function flushCommentBtn() {
    $(".cmt-btn").unbind("click");
    $(".cmt-btn").on("click",function () {
        var comments = $(this).parent().parent(".trend-message-foot").next(".comment-list");
        var activity_id = $(this).parent().parent(".trend-message-foot")
            .next(".comment-list").attr('activity_id');
        if (comments.hasClass("hidden-block")) {
            $.ajax({
                type: "GET",
                url: "comment/fetch?activity_id=" + parseInt(activity_id),
                dataType: "json",
                contentType: "application/json",
                success: function (data) {
                    if (data.comments.length > 0) {
                        makeComment(data.comments);
                    }
                }
            });
            comments.slideDown(200,function () {
                comments.removeClass("hidden-block")
                comments.addClass("show-block");
            });
        } else {
            comments.slideUp(200, function () {
                comments.removeClass("show-block")
                comments.addClass("hidden-block");
            });
        }
    });
    $(".cmt_sub_btn").on("click",function () {
        var activity_id = $(this).parent().parent(".trend-message-foot")
            .next(".comment-list").attr('activity_id');
        $.ajax({
            type: "GET",
            url: "comment/"+ parseInt(activity_id)+"/add/{client_id}" ,
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                if(data.code==404){
                    alert(data.message);
                }else if (data.comments.length > 0) {
                    makeComment(data.comments);
                }
            }
        });
    });
}
function generateActivity(activity) {
    var dl = $("<dl></dl>");
    var dt = $("<dt class='pull-left'></dt>");
    var dd = $("<dd class='pull-left'></dd>");
    var headImg = $("<img class='user-img-rectangle' src='assets/images/user/" + activity.user.clientId + "/head.jpg' />")
    dt.append(headImg);
    //动态面板
    var trends_message_box = $("<div class='trends-message-box blackboard'>");
    //动态头
    var trends_message_head = $("<div class='trend-message-head'></div>");
    var username_lab = $("<a href='#' class='username-lab15'></a>");
    username_lab.html(activity.user.username);
    var space = $("<span class='space-18'></span>");
    var intro = $("<span class='obscure-lab' title='" + activity.user.introduce + "'> —— " + activity.user.introduce + "</span>");
    var trends_message_body = $("<div class='trend-message-body message-board'></div>");
    var content = $("<p></p>");
    var content_img = $("<img src='assets/images/activity/"+activity.user.clientId+"/"+activity.activityId+".jpg' class='activity_img' />")
    var timestamp = $("<p class='obscure-lab'></p>")
    content.html(activity.content);
    timestamp.html(judgeDate(new Date(activity.createdAt)));
    trends_message_head.append(username_lab).append(space).append(intro);
    //动态体
    trends_message_body.append(content);
    if(activity.image==1){
        trends_message_body.append(content_img);
    }
    trends_message_body.append(timestamp);
    //动态页脚
    var trends_message_foot = $("<div class='trend-message-foot'></div>");
    //赞按钮
    var agree_btn = $("<span class='agree-btn'></span>");
    //赞链接
    var agree_hook = $("<a href='javascript:void(0)'></a>");
    //分享按钮
    var share_btn = $("<span class='share-btn'></span>");
    //分享链接
    var share_hook = $("<a href='javascript:void(0)'></a>");
    //评论按钮
    var comment_btn = $("<span class='comment-btn'></span>");
    //评论链接
    var comment_hook = $("<a href='javascript:void(0)' class='cmt-btn'></a>");
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
    //评论列表
    var comment_list = $("<div class='comment-list bar-gray hidden-block' activity_id='" + activity.activityId + "'></div>");
    //评论框面板
    var comment_div = $("<div class='comment-input'></div>");
    var comment_submit_btn = $("<button class='cmt_sub_btn btn sign-in-btn left-10 btn-yellow btn-thin'></button>");
    comment_submit_btn.append("<i class='glyphicon glyphicon-pencil btn-icon'></i><span class='btn-txt'>评论</span>");
    var comment_text = $("<input type='text' class='length-8' placeholder='忍不了了，我要说几句！'/>");
    comment_div.append(comment_text).append(comment_submit_btn);
    comment_list.append(comment_div);
    trends_message_box.append(trends_message_head).append(trends_message_body)
        .append(trends_message_foot).append(comment_list);
    dd.append(trends_message_box);
    dl.append(dt).append(dd);
    $("#contents-body").append(dl);
}

function prependActivity(activity) {
    var dl = $("<dl></dl>");
    var dt = $("<dt class='pull-left'></dt>");
    var dd = $("<dd class='pull-left'></dd>");
    var headImg = $("<img class='user-img-rectangle' src='assets/images/user/" + activity.user.clientId + "/head.jpg' />")
    dt.append(headImg);
    //动态面板
    var trends_message_box = $("<div class='trends-message-box blackboard'>");
    //动态头
    var trends_message_head = $("<div class='trend-message-head'></div>");
    var username_lab = $("<a href='#' class='username-lab15'></a>");
    username_lab.html(activity.user.username);
    var space = $("<span class='space-18'></span>");
    var intro = $("<span class='obscure-lab' title='" + activity.user.introduce + "'> —— " + activity.user.introduce + "</span>");
    var trends_message_body = $("<div class='trend-message-body message-board'></div>");
    var content = $("<p></p>");
    var content_img = $("<img src='assets/images/activity/"+activity.user.clientId+"/"+activity.activityId+".jpg' class='activity_img' />")
    var timestamp = $("<p class='obscure-lab'></p>")
    content.html(activity.content);
    timestamp.html(judgeDate(new Date(activity.createdAt)));
    trends_message_head.append(username_lab).append(space).append(intro);
    //动态体
    trends_message_body.append(content);
    if(activity.image==1){
        trends_message_body.append(content_img);
    }
    trends_message_body.append(timestamp);
    //动态页脚
    var trends_message_foot = $("<div class='trend-message-foot'></div>");
    //赞按钮
    var agree_btn = $("<span class='agree-btn'></span>");
    //赞链接
    var agree_hook = $("<a href='javascript:void(0)'></a>");
    //分享按钮
    var share_btn = $("<span class='share-btn'></span>");
    //分享链接
    var share_hook = $("<a href='javascript:void(0)'></a>");
    //评论按钮
    var comment_btn = $("<span class='comment-btn'></span>");
    //评论链接
    var comment_hook = $("<a href='javascript:void(0)' class='cmt-btn'></a>");
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
    //评论列表
    var comment_list = $("<div class='comment-list bar-gray hidden-block' activity_id='" + activity.activityId + "'></div>");
    //评论框面板
    var comment_div = $("<div class='comment-input'></div>");
    var comment_submit_btn = $("<button class='cmt_sub_btn btn sign-in-btn left-10 btn-yellow btn-thin'></button>");
    comment_submit_btn.append("<i class='glyphicon glyphicon-pencil btn-icon'></i><span class='btn-txt'>评论</span>");
    var comment_text = $("<input type='text' class='length-8' placeholder='忍不了了，我要说几句！'/>");
    comment_div.append(comment_text).append(comment_submit_btn);
    comment_list.append(comment_div);
    trends_message_box.append(trends_message_head).append(trends_message_body)
        .append(trends_message_foot).append(comment_list);
    dd.append(trends_message_box);
    dl.append(dt).append(dd);
    $("#contents-body").prepend(dl);
}

function initPage() {
    //首页刷新所有的动态
    $.ajax({
        type: "GET",
        url: "activity/fetchAll?pageindex=1",
        dataType: "json",
        contentType: "application/json",
        success: function (data) {
            var acts = data.activities;
            for (var i = 0; i < acts.length; i++) {
                generateActivity(acts[i]);
            }
            var more_info = $("<div class='more-info' onclick='nextPage()'></div>");
            if (acts.length == 0) {
                more_info.append("<span>没有更多动态</span>");
                more_info.attr("onclick", "void(0)");
            } else {
                more_info.append("<a href='javascript:void(0)'>查看更多>></a>");
            }
            $("#contents-body").after(more_info);
            $(".share-btn").attr("title", "转发数");
            $(".cmt-btn").attr("title", "评论数");
            $(".agree-btn").attr("title", "获赞数");
            flushCommentBtn();
        }
    });
}
function nextPage() {
    page_index++;
    $.ajax({
        type: "GET",
        url: "activity/fetchAll?pageindex=" + page_index,
        dataType: "json",
        contentType: "application/json",
        success: function (data) {
            var acts = data.activities;
            if (acts.length == 0) {
                page_index--;
                $(".more-info").html("<span>没有更多动态</span>");
                $(".more-info").attr("onclick", "void(0)");
            }
            for (var i = 0; i < acts.length; i++) {
                generateActivity(acts[i]);
            }
            $(".share-btn").attr("title", "转发数");
            $(".cmt-btn").attr("title", "评论数");
            $(".agree-btn").attr("title", "获赞数");
            flushCommentBtn();
        }
    });
}
//计算时间并按照自定义格式化输出的方法
function judgePastDate(date) {
    var now = new Date();
    var gap = (now - date);
    var monthGap = Math.floor(gap / (1000 * 60 * 60 * 24 * 30));
    var dateGap = Math.floor(gap / (1000 * 60 * 60 * 24));
    var hourGap = Math.floor(gap / (1000 * 60 * 60));
    var minuGap = Math.floor(gap / (1000 * 60));
    var secondGap = Math.floor(gap / (1000));
    if (date.getFullYear() != now.getFullYear() && monthGap >= 12) {
        return date.format("yyyy-MM-dd hh:mm:ss");
    } else if (monthGap < 12 && monthGap >= 1 && date.getFullYear() == now.getFullYear()) {
        return parseInt(monthGap) + "个月前";
    } else if (dateGap >= 7 && monthGap == 0) {
        return parseInt(dateGap / 7) + "周前";
    } else if (dateGap < 7 && dateGap >= 1) {
        return parseInt(dateGap) + "天前";
    } else if (hourGap < 24 && hourGap >= 1 && dateGap == 0) {
        return parseInt(hourGap) + "小时前";
    } else if (minuGap < 60 && minuGap >= 1 && hourGap == 0) {
        return parseInt(minuGap) + "分钟前";
    } else if (secondGap < 60 & secondGap >= 0 && minuGap == 0) {
        return parseInt(secondGap) + "秒前";
    } else {
        return "日期有问题";
    }
}

function judgeDate(date) {
    var now = new Date();
    var dateGap = now.getDate() - date.getDate();
    if (dateGap < 1) {
        return date.format("hh:mm");
    } else if (dateGap == 1) {
        return "昨天 " + date.format("hh:mm");
    } else if (dateGap == 2) {
        return "前天 " + date.format("hh:mm");
    } else {
        return date.format("yyyy-MM-dd hh:mm:ss");
    }
}
/**
 * 生成评论内容
 * @param comment
 */
function makeComment(comment) {
    var dl = $("<dl></dl>");
    var dt = $("<dt class='pull-left'></dt>");
    dt.append("<img class='user-img-circle' src='assets/images/user/" + comment.user.client_id + "/head.jpg'/><")
    var dd = $("<dd class='pull-left'></dd>");
    var username_lab = $("<a href='javascript:void(0)' class='username-lab12'>" + comment.user.username + " :</a>");
    var span = $("<span></span>");
    span.html(comment.content);
    var timestamp = $("<p class='small-12 label-gray'>" + judgePastDate(new Date(comment.commentAt)) + "</p>");
    dd.append(username_lab).append(span).append("<p></p>").append(timestamp);
    dl.append(dt).append(dd);
    $(".comment-list").after(dl);
}
function showModal(){
    $("#addModal").modal("show");
}
function hideModal(){
    $("#addModal").modal("hide");
}