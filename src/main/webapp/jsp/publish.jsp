<%--
  Created by IntelliJ IDEA.
  User: xiaohiu
  Date: 18-12-10
  Time: 下午3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="../static/css/all.css">
    <link rel="stylesheet" href="../static/css/Publish.css">
    <link rel="stylesheet" href="../static/css/slider.css">
    <script src="../static/js/jquery.js"></script>
    <script src="../static/js/slider_validate.js"></script>
    <title>寄存秘密</title>
</head>

<body>
<header>
    <div class="tree"></div>
</header>
<ul class="nav">
    <li class="active"><a href="/page/index">首页</a></li>
    <li class="left-border"><a href="/page/new">最新</a></li>
    <li class="left-border"><a href="/page/hot">最热</a></li>
    <li class="left-border"><a style="color:#fff;" href="#">发表</a></li>
    <li class="left-border"><a href="/page/my">我的</a></li>
    <li class="left-border"><a href="/page/notice">公告</a></li>
</ul>
<section>
    <div class="secret_msg">
        <div class="panel_title">将我心底的秘密写出来</div>
        <div class="panel_content">
            人生没有永不泄露的秘密，吐露自己秘密并不是一件坏事，而是一种共同的分享和承担。每当有人倾听你的秘密时，你就会得到某种心灵上的安慰和内心的释放。说出你的秘密，你就会感觉到一种自在的东西流遍你的全身，让 你自由和舒适。
        </div>
        <form id="msg" action="/secret/addSecret" method="POST">
            <textarea autofocus="autofocus" required="required" name="content" placeholder="在这儿写下你的秘密吧"
                      maxlength="1000"></textarea>
            <input required="required" class="content_bq" name="content_bq" type="text" placeholder="给你的秘密加个标签吧"
                   maxlength="32">
        </form>
        <div id="slider" class="slider">
            <div class="ui-slider-wrap" style="width: 300px; height: 30px; background-color: rgb(134, 134, 131);">
                <div class="ui-slider-text ui-slider-no-select"
                     style="line-height: 30px; font-size: 14px; color: rgb(255, 255, 255);">按住滑块，拖拽验证
                </div>
                <div class="ui-slider-btn init ui-slider-no-select"
                     style="width: 30px; height: 30px; line-height: 30px;"></div>
                <div class="ui-slider-bg" style="height: 30px; background-color: rgb(51, 204, 0);"></div>
            </div>
        </div>
        <div class="submit">
            <input form="msg" value="1" name="hide" type="checkbox">匿名
            <input class="sub_button" form="msg" type="submit" value="发表" onclick="return submit_();">
        </div>
    </div>
    <div class="rompt">
        <div class="rompt_title">发布秘密注意</div>
        <div class="rompt_item">秘密标签</div>
        <div class="desc">秘密标签必须填写,最少一个标签,最多不超过3个标签,总字数不超过30个,多个标签中间用空格隔开。例如：独白 故事 家庭</div>
        <div class="rompt_item">秘密内容</div>
        <div class="desc">
            内容必须填写,且字数不少于10个字，最多1000个字。请不要发表与秘密无关的抱怨帖、调查帖、炫耀贴、广告贴…；不要随意填写个人联系方式避免恶意骚扰；内容不能涉及政治、色情等违法信息,若有触犯者,做扣分处理
        </div>
        <div class="rompt_item">秘密与个人资料</div>
        <div class="desc">秘密会显示易班用户名及秘密ID(秘密id仅作为一个编号,不是易班ID)，若不希望公开用户名可勾选匿名选项。秘密评论会记录用户名</div>
        <div class="rompt_item">我和树洞的约定</div>
        <div class="desc">
            我曾经历过一段我也不愿意经历过的事情，它总是占据了我自由而又纯净的心灵，我今天在这里向树洞诉说和忏悔，树洞与我做了一个交易。树洞替我永久的将往事封尘，但作为交换条件，我必须在以后的生活中尽量行善
        </div>
    </div>
</section>


<script>
    var result = false;
    var is_phone = 0;

    function submit_(is_phone) {
        var n = 0,
            n1 = 0;
        if ($("textarea")[0].value.length < 10) {
            $("textarea")[0].focus();
            $("textarea")[0].placeholder = "你的秘密最少由10个字组成哦~"
        } else if (!result) {
            alert("请滑动验证码验证！");
        } else {
            n = 1;
        }
        var num = $(".content_bq").val().trim().split(" ").length;
        if (num > 3) {
            alert("标签最多3个哦~");
        } else {
            $(".content_bq").val() = $(".content_bq").val().trim();
            n1 = 1;
        }
        if (n == 1 && n1 == 1) {
            return true;
        } else {
            return false;
        }
    }

    if (!IsPC()) { // pc =>true;
        result = true;
        is_phone = 1;
    } else {
        $("#slider").slider({
            width: 300, // width
            height: 30, // height
            sliderBg: "rgb(134, 134, 131)", // 滑块背景颜色
            color: "#fff", // 文字颜色
            fontSize: 14, // 文字大小
            bgColor: "#33CC00", // 背景颜色
            textMsg: "按住滑块，拖拽验证", // 提示文字
            successMsg: "验证通过!", // 验证成功提示文字
            successColor: "white", // 滑块验证成功提示文字颜色
            time: 400, // 返回时间
            callback: function (result1) { // 回调函数，true(成功),false(失败)
                result = result1;
            }
        });


    }


    function IsPC() {
        var userAgentInfo = navigator.userAgent;
        var Agents = ["Android", "iPhone",
            "SymbianOS", "Windows Phone",
            "iPad", "iPod"
        ];
        var flag = true;
        for (var v = 0; v < Agents.length; v++) {
            if (userAgentInfo.indexOf(Agents[v]) > 0) {
                flag = false;
                break;
            }
        }
        return flag;
    }
</script>
</body>

</html>