<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="header.jsp" />
</head>
<body>

	<div class="navbar navbar-fixed-top">

		<div class="navbar-inner">

			<div class="container">

				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="http://www.cuit.edu.cn">成都信息工程学院</a>

				<div class="nav-collapse">

					<ul class="nav pull-right">

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

			<h3>登陆</h3>

		</div>
		<!-- /login-header -->

		<div id="login-content" class="clearfix">

			<form action="teacher/login" method="post">
				<fieldset>
					<div class="control-group">
						<label class="control-label" for="username">账号</label>
						<div class="controls">
							<input name="teacher.teacherAccount" placeholder="" required
								type="text" class="" id="username" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="password">密码</label>
						<div class="controls">
							<input name="teacher.teacherPaassword" placeholder="" required
								type="password" class="" id="password" />
						</div>
					</div>
					<div class="form-horizontal control-group">
						<label class="control-label3" for="username"><a href=""
							onclick="changeImg();return false"> <img id="img" class="img"
								src="teacher/img" alt="" />
						</a></label>
						<div class="controls3">
							<input name="inputRandomCode" placeholder="必填项" type="text"
								class="" id="username" required />
						</div>
					</div>
				</fieldset>

				<div id="remember-me" class="pull-left">
					<font color="#FF3336" size="1"> ${msg}</font>
				</div>

				<div class="pull-right">
					<button type="submit" class="btn btn-warning btn-large">登
						陆</button>
				</div>
			</form>
		</div>
		<!-- /login-content -->


		<div id="login-extra">

			<p>
				没有账户? <a href="./register">注册.</a>
			</p>

			<p>
				忘记密码了? <a href="./forgot">找回密码.</a>
			</p>

		</div>
		<!-- /login-extra -->

	</div>
	<script>
		function changeImg() {
			window.history.go(0);
		}
	</script>
</body>
</html>
