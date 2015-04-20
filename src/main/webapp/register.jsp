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

			<h3>注册</h3>

		</div>
		<!-- /login-header -->

		<div id="login-content" class="clearfix">

			<form class="form-horizontal" action="./teacher/save" method="post">
				<fieldset>
					<div class="control-group">
						<label class="control-label2" for="username">账号</label>
						<div class="controls2">
							<input name="teacher.teacherAccount" placeholder="必填项"
								type="text" class="" id="username" required />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label2" for="username">密码</label>
						<div class="controls2">
							<input name="teacher.teacherPaassword" placeholder="必填项"
								type="password" class="" id="pwd1" required
								onchange="checkPasswords()" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label2" for="username">确认密码</label>
						<div class="controls2">
							<input type="password" placeholder="必填项" class="" id="pwd2"
								required onchange="checkPasswords()" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label2" for="username">姓名</label>
						<div class="controls2">
							<input name="teacher.teacherName" placeholder="必填项,实名"
								type="text" class="" id="username" required />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label2" for="username">邮箱</label>
						<div class="controls2">
							<input name="teacher.teacherEmail" type="email" class=""
								id="username" placeholder="必填项" required />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label2" for="username">学院</label>
						<div class="controls2">
							<select name="teacher.teacherDem">
								<option value="1:信息安全工程学院">信息安全工程学院</option>
								<option value="2:软件工程学院">软件工程学院</option>
								<option value="3:计算机学院">计算机学院</option>
							</select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label2" for="username">电话</label>
						<div class="controls2">
							<input name="teacher.teacherPhone" type="text" class=""
								id="username" />
						</div>
					</div>

				</fieldset>
				<div id="remember-me" class="pull-left">
					<font color="#FF3336" size="1"> ${msg}</font>
					<a href="./login">返回</a>
				</div>
				<div class="pull-right">
					<button type="submit" class="btn btn-warning btn-large">注
						册</button>
					<button type="reset" class="btn btn-large" type="reset">重
						置</button>
				</div>
			</form>

		</div>
		<!-- /login-content -->


		<div id="login-extra"></div>
		<!-- /login-extra -->

	</div>
	<!-- /login-wrapper -->

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
