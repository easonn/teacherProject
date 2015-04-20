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

						<li><a href="${ctx_path}/lessons"> <i
								class="icon-pushpin"></i> 课程
						</a></li>

						<li class="active"><a href="${ctx_path}/test/getLists"> <i
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
						<i class="icon-th-large"></i> 测评管理
					</h1>


					<div class="row">

						<div class="span9">

							<div class="widget">

								<div class="widget-header">
									<h3>测评管理</h3>
								</div>
								<!-- /widget-header -->

								<div class="widget-content">



									<div class="tabbable">
										<ul class="nav nav-tabs">
											<li><a href="test/getLists">个人题库</a></li>
											<li class="active"><a href="${ctx_path}/getPro">公共题库</a></li>
										</ul>

										<br />

										<div class="tab-content">
											<div></div>
											<div class="tab-pane active" id="2">
												<c:if test="${check==1}">
													<table class="table table-striped table-bordered">
														<thead>
															<tr>
																<th>专业名称</th>
																<th>命题人</th>
																<th>题目类型</th>
																<th>标题</th>
																<th>操作</th>
															</tr>
														</thead>

														<tbody>
															<c:forEach var="test" items="${requestScope.testList}">
																<tr>
																	<td>${test.lessonName}</td>
																	<td>${test.teacherName}</td>
																	<c:choose>
																		<c:when test="${test.testType==1}">
																			<td>选择</td>
																		</c:when>
																		<c:otherwise>
																			<td>填空</td>
																		</c:otherwise>
																	</c:choose>
																	<td>${test.testTitle}</td>
																	<td class="action-td"><a href="javascript:;"
																		class="btn btn-small btn-warning"> <i
																			class="icon-ok"></i>
																	</a> <a href="javascript:;" class="btn btn-small"> <i
																			class="icon-remove"></i>
																	</a></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>


												</c:if>
												<c:if test="${check!=1}">
													<div class="span9">
														<div class="widget">
															<div class="stat-container">
																<c:forEach var="profession" begin="0" end="3"
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
												</c:if>
											</div>
											<!-- /row -->
										</div>

									</div>


								</div>








							</div>
							<!-- /widget-content -->

						</div>
						<!-- /widget -->

					</div>
					<!-- /span9 -->

				</div>
				<!-- /row -->

			</div>
			<!-- /span9 -->


		</div>
		<!-- /row -->

	</div>
	<!-- /container -->

	</div>
	<!-- /content -->

	<jsp:include page="footer.jsp" />
	<script src="./js/jquery-1.7.2.min.js"></script>
	<script>
		
	function maodian(c){
		if(c!=1){
			c = c -1;
		}
		var t = "#faq-"+c;
		location.hash = t;
	}
	function checkPro(id) {

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
				var url = "${ctx_path}/test/getListsByLesson?lessonId=";
				$.each( data, function( key, value ) {
					html += "<li><h4>第 "+key+" 学期</h4><p>";
					$.each( value, function( index, test ) {
						html += "<a href="+url+test.lessonId+">"+test.lessonName+"</a>  ";
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
