<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
									<h3>测评管理</h3>
								</div>
								<!-- /widget-header -->

								<div class="widget-content">



									<div class="tabbable">
										<ul class="nav nav-tabs">
											<li class="active"><a href="#1" data-toggle="tab">测评添加</a>
											</li>
											<li><a href="#2" data-toggle="tab">测评信息</a></li>
										</ul>

										<br />

										<div class="tab-content">
											<div class="tab-pane active" id="1">
												<form action="./test/save" id="edit-profile"
													class="form-horizontal" method="post">

													<fieldset>

														<div class="row">
															<div class="span4">
																专业名称： <input class="input-medium disabled" type="text"
																	value="${profession}" name="testModel.proName" readonly
																	id=""><br> <br> 学科名称： <input
																	class="input-medium disabled" type="text"
																	value="${lesson.lessonName}"
																	name="testModel.lessonName" readonly id="username">
																<input class="" name="testModel.lessonId" type="hidden"
																	value="${lesson.lessonId }" required> <br>
																<br> 开始时间： <input class="input-large" name=""
																	type="datetime-local" class="" id="username"><br>
																<br> 标题： <input type="text" id="username"
																	name="testModel.testTitle" class="input-large"
																	placeholder="必填项" required /><br> <br> 内容：
																<textarea name="testModel.testInfo" placeholder="必填项"
																	class="" required> </textarea>
																<br> <br>
															</div>
															<div class="span4">
																测评类型： <select class="input-medium"
																	name="testModel.testType">
																	<option value="1">选择题</option>
																</select> <br> <br> 截止时间： <input class="input-large"
																	type="datetime-local" class="" id="username"><br>
																<br> 选项A： <input class="input-medium"
																	name="testModel.optionA" placeholder="正确答案" type="text"
																	class="" id="username" required><br> <br>
																选项B： <input class="input-medium"
																	name="testModel.optionB" placeholder="必填项" type="text"
																	class="" id="username" required><br> <br>
																选项C： <input class="input-medium"
																	name="testModel.optionC" placeholder="必填项" type="text"
																	class="" id="username" required><br> <br>
																选项D： <input class="input-medium"
																	name="testModel.optionD" placeholder="必填项" type="text"
																	class="" id="username" required><br> <br>

															</div>
														</div>

														<font color="#FF3336" size="1"> ${msg}</font> <br />


														<div class="form-actions">
															<button type="submit" class="btn btn-primary">提交</button>
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
