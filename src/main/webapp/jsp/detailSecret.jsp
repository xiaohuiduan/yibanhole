<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xiaohiu
  Date: 18-12-10
  Time: 下午10:45
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
    <link rel="stylesheet" href="../static/css/lookSecretMsg.css">
    <link rel="stylesheet" href="../static/css/circle.css">
    <script src="../static/js/circle.js"></script>
    <title>秘密详细信息</title>
    <style>

    </style></head>

<body>
<header>
    <div class="tree"> </div>
</header>
<ul class="nav">
    <li class="active"><a href="/page/index">首页</a></li>
    <li class="left-border"><a href="/page/new">最新</a></li>
    <li class="left-border"><a href="/page/hot">最热</a></li>
    <li class="left-border"><a href="/page/publish">发表</a></li>
    <li class="left-border"><a href="/page/my">我的</a></li>
    <li class="left-border"><a href="/page/notice">公告</a></li>
</ul>
<section>
    <div class="panel_title">查看秘密详细信息</div>
    <div class="secret_">
        <div class="secret_title">${secret.label}</div>
        <div class="secret_msg">
            <%--<p>状态：<span>正在审核中</span></p>--%>
            <p>编号：<span>${secret.secretId}</span></p>
            <p>时间：<span>${secret.secretDate}</span></p>
            <p>发表者：<span>${secret.promulgator}</span></p>
        </div>
    </div>
    <div>
        <div class="secret_content">${secret.secretContent}</div>
    </div>
    <div class="components">
        <label id="top">顶(<span>${secret.likeNum}</span>)</label>
        <label id="analyse">情感分析</label>
    </div>

    <div class="data_box">
        <div class="box_title"><h3><small>情感分类:<span class="classify"></span></small></h3></div>
        <div class="wrap clearfix" id="wrap">
            <svg id="svg1" version="1.1" xmlns="http://www.w3.org/2000/svg">
                <defs id="mydefs">
                    <linearGradient id="lightGreenGradient" x1="0%" y1="0%" x2="100%" y2="0%">
                        <stop offset="0%" stop-color="#38c19d" stop-opacity="0.2"></stop>
                        <stop offset="100%" stop-color="#38c19d" stop-opacity="0.5"></stop>
                    </linearGradient>
                    <linearGradient id="greenDeepGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                        <stop offset="0%" stop-color="#38c19d" stop-opacity="0.5"></stop>
                        <stop offset="100%" stop-color="#38c19d" stop-opacity="1"></stop>
                    </linearGradient>
                    <linearGradient id="greenLightRedGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                        <stop offset="0%" stop-color="#38c19d" stop-opacity="1"></stop>
                        <stop offset="100%" stop-color="#ff0000" stop-opacity="0.5"></stop>
                    </linearGradient>
                    <linearGradient id="LightRedGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                        <stop offset="0%" stop-color="#ff0000" stop-opacity="0.5"></stop>
                        <stop offset="100%" stop-color="#ff0000" stop-opacity="1"></stop>
                    </linearGradient>
                </defs>
            </svg>
            <svg id="svg2" version="1.1" xmlns="http://www.w3.org/2000/svg">
            </svg>
            <svg id="svg3" version="1.1" xmlns="http://www.w3.org/2000/svg">
            </svg>
        </div>
    </div>


    <div class="panel_title review_title">评论(<span>${secret.comments.size()}</span>)</div>

    <c:if test="${secret.comments.size() > 0}">
        <c:forEach items="${secret.comments}" var="comment">
            <div class="review">
                <div class="review_user">
                    <label class="username">用户名：<span >${comment.commentName}</span></label>
                    <label class="addtime">时间： <span >${comment.commentDate}</span></label>
                </div>
                <div class="review_content"><p>${comment.commentContent}</p></div>
            </div>
        </c:forEach>
    </c:if>

    <c:if test="${secret.comments.size() <= 0}">
        <div class="review">
            <div class="review_content"> 还没有评论呢~ </div>
        </div>
    </c:if>


    <div class="publish">
        <input class="text" type="text" placeholder="发表你的意见" maxlength="100">
        <input id="upload_review" class="button" type="button" value="评论">
    </div>
</section>

<script>
    var input_ =  document.getElementsByClassName("text")[0];
    document.getElementById("upload_review").onclick = function(){
        if(input_.value.trim()=="" || input_.value.trim()==null){
            alert("评论内容不能为空");
            return 0;
        }
        var xhr = new XMLHttpRequest();
        xhr.open("POST","/secret/comment",true);
        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xhr.send("id=${secret.secretId}"+"&review_text="+input_.value.trim());
        xhr.onreadystatechange = function(){
            if(xhr.readyState==4 && xhr.status==200){
                var data = xhr.responseText;
                if(data.trim()=="true"){
                    alert("评论成功");
                    window.location.reload();
                    input_.value=null;
                }else{
                    alert("操作失败");
                    input_.value=null;
                }

            }
        }
    }

    document.getElementById("top").onclick = function(){
        var xhr = new XMLHttpRequest();
        xhr.open("POST","/secret/like",true);
        xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
        xhr.send("id="+${secret.secretId});
        var top = this.firstElementChild;
        xhr.onreadystatechange = function(){

            if(xhr.readyState==4 && xhr.status==200){
                var data = xhr.responseText;

                if(data.trim()=="true"){
                    top.innerText =Number(top.innerText)+1;
                }else if(data.trim()=="false_1"){
                    alert("你已经赞过啦！");
                }else if(data.trim()=="false"){
                    alert("操作失败");
                }

            }
        }
    }

    var file_num = 0;
    var is_hide = 1;
    document.getElementById("analyse").onclick = function(){
        if(is_hide%2==1){
            document.getElementsByClassName("data_box")[0].style.display="block";
            is_hide++;
        }else{
            document.getElementsByClassName("data_box")[0].style.display="none";
            is_hide++;
        }
        var data =  ${secret.analyseMap};
        if(data!= null){

            if(data.sentiment ==0){
                document.getElementsByClassName("classify")[0].innerText="消极类";
            }else if(data.sentiment ==1){
                document.getElementsByClassName("classify")[0].innerText="平常类";
            }else if(data.sentiment ==2){
                document.getElementsByClassName("classify")[0].innerText="积极类";
            }


            if(file_num==0){
                var speed=1/30*Math.PI;
                var Q=data.confidence*2*Math.PI;
                var Q2=data.positive_prob*2*Math.PI;
                var Q3=data.negative_prob*2*Math.PI;
                var time=20;
                createQuaCircle("svg1");
                doAnimation(Q,"svg1",speed,time);
                showText("svg1","可信度("+(Number(data.confidence)*100).toFixed(2)+"%)","18");
                doAnimation(Q2,"svg2",speed,time);
                showText("svg2","积极概率("+(Number(data.positive_prob)*100).toFixed(2)+"%)","18");
                doAnimation(Q3,"svg3",speed,time);
                showText("svg3","消极概率("+(Number(data.negative_prob)*100).toFixed(2)+"%)","18");
                //doAnimation(Q4,"svg4",speed,time);
                //showText("svg4","大腿围","18");
                //创建1/4半圆
                file_num ++;
                set_font_size();
            }
        }else{
            document.getElementsByClassName("wrap")[0].innerHTML="";
        }
    }


    function set_font_size(){
        if(document.body.clientWidth<600){
            var text = document.getElementsByTagName("text");
            for(var i =0 ;i<text.length;i++){
                text[i].setAttribute("font-size","7");
            }
        }
    }

</script>

</body></html>
