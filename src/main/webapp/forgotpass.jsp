<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<jsp:include page="header.jsp" />

<body>

	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="./">Adminia Admin</a>

				<div class="nav-collapse">

					<ul class="nav pull-right">

						<li class=""><a href="javascript:;"><i
								class="icon-chevron-left"></i> Back to Homepage</a></li>
					</ul>

				</div>
				<!-- /nav-collapse -->

			</div>
			<!-- /container -->

		</div>
		<!-- /navbar-inner -->

	</div>
	<!-- /navbar -->


	<div id="login-container">


		<div id="login-header">

			<h3>密码找回</h3>

		</div>
		<!-- /login-header -->

		<div id="login-content" class="clearfix">

			<form action="./teacher/forgotpass" method="post">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="username">邮箱</label>
						<div class="controls">
							<input name="teacher.teacherEmail" type="email" class=""
								id="username" required placeholder="必填项" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">姓名</label>
						<div class="controls">
							<input name="teacher.teacherName" type="text" class=""
								id="password" required placeholder="必填项" />
						</div>
					</div>
				</fieldset>
				<div id="remember-me" class="pull-left">
					<font color="${color}" size="1"> ${msg}</font><a href="./login">返回</a>
				</div>
				<div class="pull-right">
					<button type="submit" class="btn btn-warning btn-large">确
						认</button>
				</div>
			</form>

		</div>
		<!-- /login-content -->


		<!-- /login-extra -->

	</div>
	<!-- /login-wrapper -->


</body>
</html>
