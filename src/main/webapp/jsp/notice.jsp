<%--
  Created by IntelliJ IDEA.
  User: xiaohiu
  Date: 18-12-9
  Time: 下午9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en"><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="../static/css/all.css">
    <link rel="stylesheet" href="../static/css/notice.css">
    <script src="../static/js/jquery.js"></script>
    <title>小秘密公告</title>
    <style>

    </style></head>

<body>
<header>
    <div class="tree"></div>
</header>
<ul class="nav">
    <li class="active"><a href="/page/index">首页</a></li>
    <li class="left-border"><a href="/page/new">最新</a></li>
    <li class="left-border"><a href="/page/hot">最热</a></li>
    <li class="left-border"><a href="/page/publish">发表</a></li>
    <li class="left-border"><a href="/page/my">我的</a></li>
    <li class="left-border"><a style="color:#fff;" href="#">公告</a></li>
</ul>
<section>
    <div class="system_notice_box">
        <div class="system_notice_title">秘密树洞公告</div>
        <div class="system_notice">
            <div class="msg_title"><span>系统消息</span><span class="is_open">收起</span></div>
            <div class="msg_content">湖南师范大学易班小秘密树洞开通了！在这里写下专属你的秘密          <span class="time">(2018-12-14 18:56:00)</span></div>
        </div>
        <div class="about_title">关于秘密树洞</div>
        <div class="about_box">
            <p></p>
            <p>树洞的前端源码来自于贵州大学科技学院易班工作站。设计者在他的网页中说：【或许，在我们一群人的付出下，ta(也就是这个网站)或许能成为一个对我们来说有意义、对大众来说有价值的网站。或许，在我们一群人的付出下，ta或许能 成为一个对我们来说有意义、对大众来说有价值的网站。】
            </p>
            <p>我们总有一些话想说，却不知该怎么去说。也许，在这里你能够找到一个倾诉的地方，我们会守护你的秘密</p>

        </div>
        <div class="suggest_title">咨询/建议</div>
        <div class="suggest_box">
            <p>秘密树洞网建成于2018年12月，我们将会一直走下去</p>
            <p>如果你有任何问题，或者有着更好的建议，可以去撩一撩我们的小熊哦（づ￣3￣）づ╭❤～</p>
            <%--<div class="qun"><span>树洞讨论群</span>--%>
                <%--<div class="img"><img src=""></div>--%>
            <%--</div>--%>
            <%--<div class="qun"><span>author</span>--%>
                <%--<div class="img"><img src=""></div>--%>
            <%--</div>--%>
            <div class="qun"><span>小熊QQ</span>
                <div class="img"><img src="%E5%B0%8F%E7%A7%98%E5%AF%86%E5%85%AC%E5%91%8A_files/kf.jpg"></div>
            </div>
        </div>
    </div>
</section>

<script>
    $(function(){
        for(var i =0 ;i <$(".is_open").length;i++){
            $(".is_open")[i].index = i;
        }
        $(".is_open").click(function (){

            $($(".msg_content")[this.index]).slideToggle("normal");
        });
    });
</script>
</body></html>