function doAnimation(Q,id,speed,time){
	  var oSvg=document.getElementById(id);
	  var oSvgWidth=parseInt((oSvg.curentStyle?oSvg.curentStyle:window.getComputedStyle(oSvg,null)).width);
	  oSvg.setAttribute("height",oSvgWidth);
	  //创建use元素的组合
	  var bgCircleG=document.createElementNS("http://www.w3.org/2000/svg","g");
	  bgCircleG.setAttribute("transform","translate("+0.5*oSvgWidth+","+0.5*oSvgWidth+")");
	  createGradientBg(bgCircleG,oSvg,oSvgWidth);
	  var currentAngle=0;
	  var rotateRirection;  //旋转的方向如果Q<=Math.PI rotateRirection 为1 大的弧度，如果Q>Math.PI rotateRirection为0 小的弧度
	  if (Q<=0) {
		//大圆
		var smallCircle=document.createElementNS("http://www.w3.org/2000/svg","circle");
		smallCircle.setAttribute("cx",0);
		smallCircle.setAttribute("cy",0);
		smallCircle.setAttribute("r",0.3*oSvgWidth+1);
		smallCircle.setAttribute("fill","#e5e5e5");
		bgCircleG.appendChild(smallCircle);
		//小圆
		drawSmallCircle(id,bgCircleG,oSvgWidth);
	  }
	  else if (Q>0&&Q<=2*Math.PI) {
		rotateRirection=judgeRirection(currentAngle);
		currentAngle+=speed;
		var tId=null;
		annimationCircle(id,bgCircleG,currentAngle,oSvgWidth,rotateRirection);
		tId=setInterval(function(){
				if (currentAngle<=Q) {
					rotateRirection=judgeRirection(currentAngle);
					annimationCircle(id,bgCircleG,currentAngle,oSvgWidth,rotateRirection);
					currentAngle+=speed;
					if (currentAngle>=Q) {
						currentAngle=Q;
						if (Q>Math.PI) {
						rotateRirection=judgeRirection(currentAngle);
						}
						annimationCircle(id,bgCircleG,currentAngle,oSvgWidth,rotateRirection);
						clearTimeout(tId);

					};
				}
				else {
					currentAngle=Q;
					rotateRirection=judgeRirection(currentAngle);
					annimationCircle(id,bgCircleG,currentAngle,oSvgWidth,rotateRirection);
					clearTimeout(tId);
			
			}
		},time);
	  }
	  else if(Q>2*Math.PI){
		drawSmallCircle(id,bgCircleG,oSvgWidth);
	  }
	  
}
function createQuaCircle(id){
		var oSvg=document.getElementById(id);
		var oSvgWidth=parseInt((oSvg.curentStyle?oSvg.curentStyle:window.getComputedStyle(oSvg,null)).width);
		var cr1=cr2=0.5*oSvgWidth;
		var oPathElement=document.createElementNS("http://www.w3.org/2000/svg","path");
		var d="M0,0"+" L 0,"+-0.3*oSvgWidth+" A"+0.3*oSvgWidth+","+0.3*oSvgWidth+" 0 0,1 "+0.3*oSvgWidth+",0 z";
		oPathElement.id="halfCircle";
		oPathElement.setAttribute("d",d);
		var omydefs=document.getElementById("mydefs");
		omydefs.appendChild(oPathElement);
}
	function createGradientBg(bgCircleG,oSvg){
		
		//创建第一个use元素
		var bgCircle1=document.createElementNS("http://www.w3.org/2000/svg","use");
		bgCircle1.setAttribute("fill","url(#lightGreenGradient)");
		bgCircle1.setAttributeNS("http://www.w3.org/1999/xlink","xlink:href","#halfCircle");
		//创建第2个use元素并且旋转90度
		var bgCircle2=document.createElementNS("http://www.w3.org/2000/svg","use");
		bgCircle2.setAttributeNS("http://www.w3.org/1999/xlink","xlink:href","#halfCircle");
		bgCircle2.setAttribute("fill","url(#greenDeepGradient)");
		bgCircle2.setAttribute("transform","rotate(90)");
		//创建第3个use元素并且旋转180度
		var bgCircle3=document.createElementNS("http://www.w3.org/2000/svg","use");
		bgCircle3.setAttributeNS("http://www.w3.org/1999/xlink","xlink:href","#halfCircle");
		bgCircle3.setAttribute("fill","url(#greenLightRedGradient)");
		bgCircle3.setAttribute("transform","rotate(180)");
		//创建第4个use元素并且旋转270度
		var bgCircle4=document.createElementNS("http://www.w3.org/2000/svg","use");
		bgCircle4.setAttributeNS("http://www.w3.org/1999/xlink","xlink:href","#halfCircle");
		bgCircle4.setAttribute("fill","url(#LightRedGradient)");
		bgCircle4.setAttribute("transform","rotate(270)");
		//将use元素追加到组合中
		bgCircleG.appendChild(bgCircle1);
		bgCircleG.appendChild(bgCircle2);
		bgCircleG.appendChild(bgCircle3);
		bgCircleG.appendChild(bgCircle4);
		oSvg.appendChild(bgCircleG);
		}
	  //动态圆遮挡边用灰色填充
function annimationCircle(id,bgCircleG,Q,oSvgWidth,rotateRirection){
		if (oPathElement2=document.getElementById("half"+id)) {
			bgCircleG.removeChild(oPathElement2);
		};
		var oPathElement2=document.createElementNS("http://www.w3.org/2000/svg","path");
		var d="M0,0"+" L"+(0.3*oSvgWidth)*Math.sin(Q)+","+(-(0.3*oSvgWidth)*Math.cos(Q))+" A"+(0.3*oSvgWidth)+","+(0.3*oSvgWidth)+" 0 "+rotateRirection+",1 "+"0 "+(-0.3*oSvgWidth)+" z";
		oPathElement2.id="half"+id;
		oPathElement2.setAttribute("d",d); 
		oPathElement2.setAttribute("stroke","#e5e5e5");
		oPathElement2.setAttribute("fill","#e5e5e5");
		bgCircleG.appendChild(oPathElement2);
		drawSmallCircle(id,bgCircleG,oSvgWidth);
  }
	// 圆弧中比较小的圆用白色填充
function drawSmallCircle(id,bgCircleG,oSvgWidth){
		if (smallCircle2=document.getElementById("smallCircle"+id)) {
			bgCircleG.removeChild(smallCircle2);
		};
		var smallCircle=document.createElementNS("http://www.w3.org/2000/svg","circle");
		smallCircle.id="smallCircle"+id;
		smallCircle.setAttribute("cx",0);
		smallCircle.setAttribute("cy",0);
		smallCircle.setAttribute("r",0.25*oSvgWidth+1);
		smallCircle.setAttribute("stroke","#FFF");
		smallCircle.setAttribute("stroke-width","4");
		smallCircle.setAttribute("fill","#FFF");
		bgCircleG.appendChild(smallCircle);
}
  //rotateRirection 旋转的方向如果<=Math.PI rotateRirection 为1 大的弧度，如果>Math.PI rotateRirection为0 小的弧度
function judgeRirection(angle){
		if (angle<=Math.PI) {
				rotateRirection=1;
		}
		else {
				rotateRirection=0;
		}
		return rotateRirection;
}
function showText(id,value,fontSize){
	var oSvg=document.getElementById(id);
	var oSvgWidth=parseInt((oSvg.curentStyle?oSvg.curentStyle:window.getComputedStyle(oSvg,null)).width);
	if (oSvgWidth<480) {
		fontSize=0.8*parseInt(fontSize);
	};
	var otext=document.createElementNS("http://www.w3.org/2000/svg","text");
	var oTspan=document.createElementNS("http://www.w3.org/2000/svg","tspan");
	otext.setAttribute("x",parseInt(0.5*oSvgWidth));
	otext.setAttribute("y",parseInt(0.5*oSvgWidth));
	otext.setAttribute("font-size",fontSize);
	otext.setAttribute("z-index",99999);
	otext.setAttribute("font-weight","500");
	otext.setAttribute("font-family","微软雅黑");
	otext.setAttribute("text-anchor","middle");
	otext.setAttribute("dominant-baseline","middle");
	otext.setAttribute("fill","#38c19d");
	var oTextCon=document.createTextNode(value);
	otext.appendChild(oTextCon);
	oSvg.appendChild(otext);
}