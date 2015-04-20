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
											<li class="active"><a href="#1" data-toggle="tab">个人题库</a>
											</li>
											<li><a href="${ctx_path}/getPro">公共题库</a></li>
										</ul>

										<br />

										<div class="tab-content">
											<div class="tab-pane active" id="1">

												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>专业名称</th>
															<th>课程名称</th>
															<th>命题人</th>
															<th>题目类型</th>
															<th>标题</th>
															<th>操作</th>
														</tr>
													</thead>

													<tbody>
														<c:forEach var="test" items="${requestScope.testList}">
															<tr>
																<td>${test.proName}</td>
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
																<td class="action-td"><a href="${ctx_path}/test/get?testId=${test.testId}"
																	class="btn btn-small btn-primary"> <i
																		class="">JPush</i>
																</a> <a href="test/del?testId=${test.testId}"
																	onclick="return confirmd()" class="btn btn-small btn-danger">
																		<i class="">delete</i>
																</a></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>

												<!-- /widget-content -->

											</div>
											<div class="tab-pane" id="2"></div>

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
	</body>
<script type="text/javascript">
	function confirmd() {
		var msg = "您真的确定要删除吗？请确认！";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
</html>
