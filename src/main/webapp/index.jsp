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
					<div class="widget">

						<div class="widget-header">
							<i class="icon-signal"></i>
							<h3>数据统计</h3>
						</div>
						<!-- /widget-header -->

						<div class="widget-content">
							<div id="container"
								style="width: 850px; height: 500px; margin: 0 auto"></div>
						</div>
						<!-- /widget-content -->

					</div>
					<!-- /widget -->




					<!-- /widget -->




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
	$(function() {
		$('#container').highcharts({
			chart : {},
			title : {
				text : ''
			},
			//x轴
			xAxis : {
				categories : [${sessionScope.scoreName}]
			},
			tooltip : {
				formatter : function() {
					var s;
					if (this.point.name) { // the pie chart                   
						s = '' + this.point.name + ': ' + this.y + ' fruits';
					} else {
						s = '' + this.x + ': ' + this.y;
					}
					return s;
				}
			},
			labels : {
				items : [ {
					html : '学生近期作业正确率',
					style : {
						left : '40px',
						top : '8px',
						color : 'black'
					}
				} ]
			},
			series : [ {
				type : 'column',
				name : '正确率',
				data : [${sessionScope.scoreAvg}]
			}, {
				type : 'column',
				name : '作答人数',
				data : [ ${sessionScope.scoreNumber} ]
			} ]
		});
	});
</script>
</html>
