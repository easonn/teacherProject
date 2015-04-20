<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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

						<li class="active"><a href="${ctx_path}/index"> <i
								class="icon-home"></i> 主页
						</a></li>

						<li><a href="${ctx_path}/lessons"> <i
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
						<i class="icon-home"></i> 主 页
					</h1>

					<div class="stat-container">

						<div class="stat-holder">
							<div class="stat">
								<span>564</span> Completed Sales
							</div>
							<!-- /stat -->
						</div>
						<!-- /stat-holder -->

						<div class="stat-holder">
							<div class="stat">
								<span>423</span> Pending Sales
							</div>
							<!-- /stat -->
						</div>
						<!-- /stat-holder -->

						<div class="stat-holder">
							<div class="stat">
								<span>96</span> Returned Sales
							</div>
							<!-- /stat -->
						</div>
						<!-- /stat-holder -->

						<div class="stat-holder">
							<div class="stat">
								<span>2</span> Chargebacks
							</div>
							<!-- /stat -->
						</div>
						<!-- /stat-holder -->

					</div>
					<!-- /stat-container -->

					<div class="widget">

						<div class="widget-header">
							<i class="icon-signal"></i>
							<h3>Area Chart</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">
							<div id="bar-chart" class="chart-holder"></div>
							<!-- /bar-chart -->
						</div>
						<!-- /widget-content -->

					</div>
					<!-- /widget -->



					<div class="widget widget-table">

						<div class="widget-header">
							<i class="icon-th-list"></i>
							<h3>Table</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">

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
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
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
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
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
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
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
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
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
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
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
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
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
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
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
											class="btn btn-small btn-warning"> <i class="icon-ok"></i>
										</a> <a href="javascript:;" class="btn btn-small"> <i
												class="icon-remove"></i>
										</a></td>
									</tr>
								</tbody>
							</table>

						</div>
						<!-- /widget-content -->

					</div>
					<!-- /widget -->




					<div class="row">

						<div class="span5">

							<div class="widget">

								<div class="widget-header">
									<h3>5 Column</h3>
								</div>
								<!-- /widget-header -->

								<div class="widget-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</p>
								</div>
								<!-- /widget-content -->

							</div>
							<!-- /widget -->

						</div>
						<!-- /span5 -->

						<div class="span4">

							<div class="widget">

								<div class="widget-header">
									<h3>4 Column</h3>
								</div>
								<!-- /widget-header -->

								<div class="widget-content">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur.</p>
								</div>
								<!-- /widget-content -->

							</div>
							<!-- /widget -->
						</div>
						<!-- /span4 -->

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
</html>
