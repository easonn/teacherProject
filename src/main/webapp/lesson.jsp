<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="header.jsp" />
</head>
<body>
	<jsp:include page="navbar-fixed-top.jsp" />
	<div id="content">

		<div class="container">

			<div class="row">

				<div class="span3">

					<jsp:include page="account-container.jsp" />
					<ul id="main-nav" class="nav nav-tabs nav-stacked">

						<li><a href="${ctx_path}/index"> <i class="icon-home"></i>
								主页
						</a></li>

						<li class="active"><a href="${ctx_path}/lessons"> <i
								class="icon-pushpin"></i> 课程
						</a></li>

						<li><a href="${ctx_path}/test/getLists"> <i
								class="icon-th-large"></i> 测评管理 <span
								class="label label-warning pull-right">5</span>
						</a></li>

						<li><a href="${ctx_path}/account"> <i class="icon-user"></i>
								个人信息
						</a></li>

						<li><a href="${ctx_path}/login"> <i class="icon-lock"></i>
								登 陆
						</a></li>

					</ul>



					<hr />
					<div class="sidebar-extra">
						<h3>学校新闻</h3>
						<p>${cuitInfo }</p>
					</div>
					<!-- .sidebar-extra -->

					<br />

				</div>
				<!-- /span3 -->



				<div class="span9">

					<h1 class="page-title">
						<i class="icon-pushpin"></i> 课程选择
					</h1>

					<div class="widget">
						<div class="stat-container">
							<c:forEach var="profession" begin="0" end="3"
								items="${requestScope.professionList}">
								<div class="stat-holder">
									<a href=""
										onclick="checkPro(${profession.professionId},'${profession.professionName}');return false">
										<div class="stat">
											<span>${profession.professionName}</span>

										</div> <!-- /stat -->
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="stat-container">
							<c:forEach var="profession" begin="4" end="7"
								items="${requestScope.professionList}">
								<div class="stat-holder">
									<a href=""
										onclick="checkPro(${profession.professionId});return false">
										<div class="stat">
											<span>${profession.professionName}</span>
										</div> <!-- /stat -->
									</a>
								</div>
							</c:forEach>
						</div>
						<div class="widget-content">

							<h3>搜索...</h3>

							<ol id="title" class="faq-list">
							</ol>
							<!-- /widget-content -->

						</div>
						<!-- /widget -->



					</div>
					<!-- /span9 -->


				</div>
				<!-- /row -->

			</div>
			<!-- /container -->

		</div>
		<!-- /content -->
		<jsp:include page="footer.jsp" />



		<!-- Le javascript
================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->
		<script src="./js/jquery-1.7.2.min.js"></script>
		<script>
		
	function maodian(c){
		if(c!=1){
			c = c -1;
		}
		var t = "#faq-"+c;
		location.hash = t;
	}
	function checkPro(id,name) {
		var proName = name;
		$('.widget-content .faq-container').remove();
		var url = "${ctx_path}/lesson/getList";
		$.ajax({ 
			url: url, 
			data:{    
				professionId : id 
	   		},
	   		cache: false,    
	   	    dataType: "json",
	   	    success:function(data) {    
				<!--alert(data);-->
				var html = "";
				var url = "${ctx_path}/lesson/get?lessonId=";
				$.each( data, function( key, value ) {
					html += "<li><h4>第 "+key+" 学期</h4><p>";
					$.each( value, function( index, test ) {
						html += "<a href="+url+test.lessonId+"&proName="+proName+">"+test.lessonName+"</a>  ";
						})
					});
					html += "</p></li>"
				<!--alert(html);-->
					$('#title').append(html);
					$('.faq-list').goFaq();
					$('.faq-container').after("<ol id='title' class='faq-list'></ol>");
	   	      },    
	   	      error : function() {    
	   	           // view("异常！");    
	   	           alert("异常！");    
	   	      }
	   	 });  
	} 

	</script>
		<script src="${ctx_path}/js/faq.js"></script>
</body>
</html>
