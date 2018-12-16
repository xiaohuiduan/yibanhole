<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xiaohiu
  Date: 18-12-10
  Time: 下午10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="Author" content="">
    <meta name="Keywords" content="">
    <meta name="Description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" href="../static/css/all.css">
    <link rel="stylesheet" href="../static/css/hot_new.css">
    <script src="../static/js/jquery.js"></script>
    <title>最新的秘密</title>
    <style>
    </style>
</head>
<body>
<header>
    <div class="tree"></div>
</header>
<ul class="nav">
    <li class="active"><a href="/page/index">首页</a></li>
    <li class="left-border"><a style="color:#fff;" href="#">最新</a></li>
    <li class="left-border"><a href="/page/hot">最热</a></li>
    <li class="left-border"><a href="/page/publish">发表</a></li>
    <li class="left-border"><a href="/page/my">我的</a></li>
    <li class="left-border"><a href="/page/notice">公告</a></li>
</ul>
<section>
    <div class="right_box">

        <c:forEach items="${newSecrets}" var="newSecret">
        <div>
            <div class="secret_item">
                <div class="user_info">
                    <label class="user_name">${newSecret.promulgator}</label>
                    <label class="time">${newSecret.secretDate}</label>
                </div>

                <div class="secret_content">
                        <c:if test="${newSecret.secretContent.length()>110}">
                            ${newSecret.secretContent.substring(0,110)}...
                        </c:if>
                    <c:if test="${newSecret.secretContent.length()<=110}">
                        ${newSecret.secretContent}
                    </c:if>

                    <a class="detailed" href="/secret/detail?id=${newSecret.secretId}">详细&gt;&gt;</a>
                </div>
                <div class="secret_bq">${newSecret.label}</div>
                <div class="bottom_info">
                    <div class="review"><a href="javascript:void(0);">评论(<span>${newSecret.comments.size()}</span>)</a>
                    </div>
                    <div class="top_num">
                        <label><a class="upload_top"
                                  name="${newSecret.secretId}">顶(<span>${newSecret.likeNum}</span>)</a></label>
                    </div>
                </div>
            </div>

            <c:if test="${newSecret.comments.size()<=0}">
                <div class="review_section">
                    <div class="not_review"><p>还没有评论哦</p></div>
                </div>
            </c:if>

            <c:if test="${newSecret.comments.size()>0}">
                <div class="review_section">
                    <c:forEach items="${newSecret.comments}" var="comment">
                        <div class="review_box">

                            <div class="review_user">
                                <label class="username"><span>${comment.commentName}</span></label>
                                <label class="addtime"> <span>${comment.commentDate}</span></label>
                            </div>
                            <div class="review_content"><p>${comment.commentContent}</p></div>
                        </div>
                    </c:forEach>
                </div>

            </c:if>
            </c:forEach>
        </div>

        <ul class="pager">
            <li><a onclick="prev()">上一页</a></li>
            <li><a onclick="next()">下一页</a></li>
        </ul>


    </div>

</section>

<script type="text/javascript">
    $(function () {
        for (var i = 0; i < $(".review").length; i++) {
            $(".review")[i].index = i;
        }
        $(".review").click(function () {

            $($(".review_section")[this.index]).slideToggle("normal");
        });


    });
    var page = 1;
    var count = 32;

    function prev() {
        if (!${page.hasPreviousPage}) {
            alert("已经是第一页啦");
            return false;
        } else {
            page = page - 1;
            window.location = "/page/new?page=" + page;
        }
    };

    function next() {
        if (!${page.hasNextPage}) {
            alert("已经是最后一页啦");
            return false;
        } else {
            page = page + 1;
            window.location = "/page/new?page=" + page;
        }
    }

    $(".upload_top").click(function () {
        var top = this.firstElementChild;
        console.log(top);
        var id = this.name;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/secret/like", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.send("id=" + id);

        xhr.onreadystatechange = function () {

            if (xhr.readyState == 4 && xhr.status == 200) {
                var data = xhr.responseText;
                if (data.trim() == "true") {
                    top.innerText = Number(top.innerText) + 1;
                } else if (data.trim() == "false_1") {
                    alert("你已经赞过啦！");
                } else if (data.trim() == "false") {
                    alert("操作失败");
                }

            }
        }
    });
</script>
</body>
</html>
