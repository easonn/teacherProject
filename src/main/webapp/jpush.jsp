<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="header.jsp" />
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
						<i class="icon-th-large"></i> User Account
					</h1>


					<div class="row">

						<div class="span9">

							<div class="widget">

								<div class="widget-header">
									<h3>推送</h3>
								</div>
								<!-- /widget-header -->

								<div class="widget-content">



									<div class="tabbable">

										<br />

										<div class="tab-content">
											<div class="tab-pane active" id="1">
												<form action="./test/pushCloud" id="edit-profile"
													class="form-horizontal" method="post">

													<fieldset>
														<div>
															专业名称： <input class="input-medium disabled" type="text"
																value="${test.proName}" readonly id=""><br>
															<br> 学科名称： <input class="input-medium disabled"
																type="text" value="${test.lessonName}" readonly
																id="username"><br /> <br />
														</div>
														<div class="row">
															<div class="span4">
																<c:forEach var="testModel"
																	items="${sessionScope.testModelList}"
																	varStatus="status">
																	题目${status.count }： <input type="text" id="username"
																		readonly value="${testModel.testTitle}"
																		class="input-large" placeholder="必填项" required />
																	<br>
																	<br>
																</c:forEach>
															</div>
															<div class="span4">
																班级：<input class="input-medium" placeholder="必填项"
																	name="stuClass" type="text" class="" id="stuClass"
																	required><br> <br /> <a
																	href="./test/getLists">继续选题</a>
																<button type="submit" class="btn btn-primary">确认</button>
															</div>
														</div>


														<!-- /form-actions -->
													</fieldset>
												</form>
											</div>

											<div class="tab-pane" id="2">

												<table class="table table-striped table-bordered">
													<thead>
														<tr>
															<th>#</th>
															<th>First Name</th>
															<th>Last Name</th>
															<th>Username</th>
															<th>Company</th>
															<th>&nbsp;</th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<td>1</td>
															<td>Michael</td>
															<td>Jordan</td>
															<td>@mjordan</td>
															<td>Chicago Bulls</td>
															<td class="action-td"><a href="javascript:;"
																class="btn btn-small btn-warning"> <i
																	class="icon-ok"></i>
															</a> <a href="javascript:;" class="btn btn-small"> <i
																	class="icon-remove"></i>
															</a></td>
														</tr>
														<tr>
															<td>2</td>
															<td>Magic</td>
															<td>Johnson</td>
															<td>@mjohnson</td>
															<td>Los Angeles Lakers</td>
															<td class="action-td"><a href="javascript:;"
																class="btn btn-small btn-warning"> <i
																	class="icon-ok"></i>
															</a> <a href="javascript:;" class="btn btn-small"> <i
																	class="icon-remove"></i>
															</a></td>
														</tr>
														<tr>
															<td>3</td>
															<td>Charles</td>
															<td>Barkley</td>
															<td>@cbarkley</td>
															<td>Phoenix Suns</td>
															<td class="action-td"><a href="javascript:;"
																class="btn btn-small btn-warning"> <i
																	class="icon-ok"></i>
															</a> <a href="javascript:;" class="btn btn-small"> <i
																	class="icon-remove"></i>
															</a></td>
														</tr>
														<tr>
															<td>4</td>
															<td>Karl</td>
															<td>Malone</td>
															<td>@kmalone</td>
															<td>Utah Jazz</td>
															<td class="action-td"><a href="javascript:;"
																class="btn btn-small btn-warning"> <i
																	class="icon-ok"></i>
															</a> <a href="javascript:;" class="btn btn-small"> <i
																	class="icon-remove"></i>
															</a></td>
														</tr>
														<tr>
															<td>5</td>
															<td>David</td>
															<td>Robinson</td>
															<td>@drobinson</td>
															<td>San Antonio Spurs</td>
															<td class="action-td"><a href="javascript:;"
																class="btn btn-small btn-warning"> <i
																	class="icon-ok"></i>
															</a> <a href="javascript:;" class="btn btn-small"> <i
																	class="icon-remove"></i>
															</a></td>
														</tr>
														<tr>
															<td>6</td>
															<td>Reggie</td>
															<td>Miller</td>
															<td>@rmiller</td>
															<td>Indiana Pacers</td>
															<td class="action-td"><a href="javascript:;"
																class="btn btn-small btn-warning"> <i
																	class="icon-ok"></i>
															</a> <a href="javascript:;" class="btn btn-small"> <i
																	class="icon-remove"></i>
															</a></td>
														</tr>
														<tr>
															<td>7</td>
															<td>Clyde</td>
															<td>Drexler</td>
															<td>@cdrexler</td>
															<td>Portland Trail Blazers</td>
															<td class="action-td"><a href="javascript:;"
																class="btn btn-small btn-warning"> <i
																	class="icon-ok"></i>
															</a> <a href="javascript:;" class="btn btn-small"> <i
																	class="icon-remove"></i>
															</a></td>
														</tr>
														<tr>
															<td>8</td>
															<td>Hakeem</td>
															<td>Olajuwon</td>
															<td>@holajuwon</td>
															<td>Houston Rockets</td>
															<td class="action-td"><a href="javascript:;"
																class="btn btn-small btn-warning"> <i
																	class="icon-ok"></i>
															</a> <a href="javascript:;" class="btn btn-small"> <i
																	class="icon-remove"></i>
															</a></td>
														</tr>
													</tbody>
												</table>

												<!-- /widget-content -->

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
	<script>
		
	</script>

</body>
</html>
