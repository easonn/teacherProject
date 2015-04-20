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

						<li><a href="${ctx_path}/lessons"> <i
								class="icon-pushpin"></i> 课程
						</a></li>

						<li><a href="${ctx_path}/test/getLists"> <i
								class="icon-th-large"></i> 测评管理 <span
								class="label label-warning pull-right">5</span>
						</a></li>

						<li class="active"><a href="${ctx_path}/account"> <i
								class="icon-user"></i> 个人信息
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
									<h3>基本信息</h3>
								</div>
								<!-- /widget-header -->

								<div class="widget-content">



									<div class="tabbable">
										<ul class="nav nav-tabs">
											<li class="active"><a href="#1" data-toggle="tab">基本信息修改</a>
											</li>
											<li><a href="#2" data-toggle="tab">密码修改</a></li>
										</ul>

										<br />

										<div class="tab-content">
											<div class="tab-pane active" id="1">
												<form action="./teacher/edit" id="edit-profile"
													class="form-horizontal" method="post">
													<fieldset>

														<div class="control-group">
															<label class="control-label" for="username">姓名</label>
															<div class="controls">
																<input type="text" class="input-medium disabled"
																	id="username" name="teacher.teacherName"
																	value="${teacher.teacherName}" readonly /> <input
																	type="hidden" name="teacher.teacherId"
																	value="${teacher.teacherId}" />
															</div>
															<!-- /controls -->
														</div>
														<!-- /control-group -->


														<div class="control-group">
															<label class="control-label" for="email">邮箱</label>
															<div class="controls">
																<input type="email" class="input-large"
																	name="teacher.teacherEmail" id="email"
																	value="${teacher.teacherEmail }" placeholder=""
																	required />
															</div>
															<!-- /controls -->
														</div>
														<div class="control-group">
															<label class="control-label" for="email">电话</label>
															<div class="controls">
																<input type="text" value="${ teacher.teacherPhone}"
																	name="teacher.teacherPhone" class="input-large"
																	id="email" value="" />
															</div>
															<!-- /controls -->
														</div>
														<!-- /control-group -->

														<div class="control-group">
															<label class="control-label" for="password1">密码</label>
															<div class="controls">
																<input type="password" name="teacher.teacherPaassword"
																	class="input-medium" id="password1" placeholder=""
																	required />
															</div>
															<!-- /controls -->
														</div>
														<!-- /control-group -->

														<font color="#FF3336" size="1"> ${msg}</font> <br />


														<div class="form-actions">
															<button type="submit" class="btn btn-primary">保存</button>
														</div>
														<!-- /form-actions -->
													</fieldset>
												</form>
											</div>

											<div class="tab-pane" id="2">
												<form id="edit-profile2" class="form-horizontal"
													action="./teacher/editpass" method="post">
													<fieldset>
														<div class="control-group">
															<label class="control-label" for="accountusername">旧密码</label>
															<div class="controls">
																<input type="password" class="input-large"
																	id="accountusername" name="teacher.teacherPaassword"
																	placeholder="" required /> <input type="hidden"
																	name="teacher.teacherId" value="${teacher.teacherId}" />
															</div>
														</div>
														<br />
														<div class="control-group">
															<label class="control-label" for="emailserver">新密码</label>
															<div class="controls">
																<input type="password" class="input-large" name="pwd1"
																	id="pwd1" placeholder="" required
																	onchange="checkPasswords()" />
															</div>
														</div>
														<div class="control-group">
															<label class="control-label" for="accountpassword">重复密码</label>
															<div class="controls">
																<input type="password" class="input-large" id="pwd2"
																	placeholder="" required onchange="checkPasswords()" />
															</div>
														</div>

														<br />

														<div class="form-actions">
															<button type="submit" class="btn btn-primary">保存</button>
														</div>
													</fieldset>
												</form>
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
		function checkPasswords() {
			var passl = document.getElementById("pwd1");
			var pass2 = document.getElementById("pwd2");
			if (passl.value != pass2.value)
				passl.setCustomValidity("两次密码必须输入一致！");
			else
				passl.setCustomValidity('');
		}

		function check() {
			document.getElementById('ok').disabled = 'disabled';
		}
	</script>

</body>
</html>
