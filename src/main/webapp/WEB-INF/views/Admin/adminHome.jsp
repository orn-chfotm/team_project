<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
      <meta charset="utf-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      <meta name="description" content="" />
      <meta name="author" content="" />
      <title>Admin page</title>
      <!-- Load Favicon-->
	<link href="assets/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
	<!-- Load Material Icons from Google Fonts-->
	<link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp" rel="stylesheet" />
	<!-- Load Simple DataTables Stylesheet-->
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<!-- Roboto and Roboto Mono fonts from Google Fonts-->
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500" rel="stylesheet" />
	<!-- Load main stylesheet-->
	<link href="https://material-admin-pro.startbootstrap.com/css/styles.css" rel="stylesheet" />
<style>
body, html {
	height: 100%;
}

.wrap {
	margin-top: 210px;
	min-height: 100%;
	position: relative;
	padding-bottom: 19px;
}

.content-box {
	padding: 30px 30px;
	border: 1px solid #ebecef;
	border-radius: 6px;
}
</style>
</head>
<body class="nav-fixed bg-light">
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/Admin/adminHome">관리자페이지</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
					style="-bs-scroll-height: 100px;">
					<li class="nav-item">
						<a class="navbar-brand" href="/index">홈페이지</a>
					</li>
					<li class="nav-item"><a href="/Admin/adminHome"
						class="nav-link">Main</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Admin/adminUser">회원 관리</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Admin/adminManager">관리자 관리</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Layout content-->
	<div id="layoutDrawer_content" class="content-box">
		<!-- Main page content-->
		<main>
			<!-- Main dashboard content-->
			<div class="container-xl p-5">
				<div class="row justify-content-between align-items-center mb-5">
					<div class="col flex-shrink-0 mb-5 mb-md-0">
						<h1 class="display-4 mb-0">Admin page</h1>
						<div class="text-muted">Members &amp; Meeting summary</div>
					</div>
				</div>
				<!-- Colored status cards-->
				<div class="row gx-5">
					<div class="col-xxl-3 col-md-6 mb-5">
						<div class="card card-raised border-start border-primary border-4">
							<div class="card-body px-4">
								<div
									class="d-flex justify-content-between align-items-center mb-2">
									<div class="me-2">
										<div class="display-5">
											<c:out value="${type.study}" />
										</div>
										<div class="card-text"><b>스터디 모임</b></div>
									</div>
									<div class="icon-circle bg-primary text-white">
										<i class="material-icons">book</i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xxl-3 col-md-6 mb-5">
						<div class="card card-raised border-start border-warning border-4">
							<div class="card-body px-4">
								<div class="d-flex justify-content-between align-items-center mb-2">
									<div class="me-2">
										<div class="display-5">
											<c:out value="${type.sports}" />
										</div>
										<div class="card-text"><b>운동 모임</b></div>
									</div>
									<div class="icon-circle bg-warning text-white">
										<i class="material-icons">fitness_center</i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xxl-3 col-md-6 mb-5">
						<div
							class="card card-raised border-start border-secondary border-4">
							<div class="card-body px-4">
								<div
									class="d-flex justify-content-between align-items-center mb-2">
									<div class="me-2">
										<div class="display-5">
											<c:out value="${type.volunteer}" />
										</div>
										<div class="card-text"><b>봉사 모임</b></div>
									</div>
									<div class="icon-circle bg-secondary text-white">
										<i class="material-icons">people</i>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xxl-3 col-md-6 mb-5">
						<div class="card card-raised border-start border-info border-4">
							<div class="card-body px-4">
								<div
									class="d-flex justify-content-between align-items-center mb-2">
									<div class="me-2">
										<div class="display-5">
											<c:out value="${type.classes}" /> 
										</div>
										<div class="card-text"><b>클래스 모임</b></div>
									</div>
									<div class="icon-circle bg-info text-white">
										<i class="material-icons">directions_run</i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row gx-5">
					<!-- Revenue breakdown chart example-->
					<div class="col-lg-8 mb-5">
						<div class="card card-raised h-100">
							<div class="card-header bg-transparent px-4">
								<div class="d-flex justify-content-between align-items-center">
									<div class="me-4">
										<h2 class="card-title mb-0"><b>회원 성별 비율 그래프</b></h2>
										<div class="card-subtitle">전체 인원</div>
									</div>
								</div>
							</div>
							<div class="card-body p-4">
								<div class="row gx-4">
									<div class="col-12 col-xxl-2">
										<div
											class="d-flex flex-column flex-md-row flex-xxl-column align-items-center align-items-xl-start justify-content-between">
											<div class="mb-4 text-center text-md-start">
												<div class="text-xs font-monospace text-muted mb-1"><b>총 회원 수</b></div>
												<div class="display-5 fw-500">
													<c:out value="${gender.total}" />
												</div>
											</div>
											<div class="mb-4 text-center text-md-start">
												<div class="text-xs font-monospace text-muted mb-1"><b>남성 회원 수</b></div>
												<div class="display-5 fw-500">
													<c:out value="${gender.boy}" />
												</div>
											</div>
											<div class="mb-4 text-center text-md-start">
												<div class="text-xs font-monospace text-muted mb-1"><b>여성 회원 수</b></div>
												<div class="display-5 fw-500">
													<c:out value="${gender.girl}" />
												</div>
											</div>
										</div>
									</div>
									<div class="col-12 col-xxl-10">
										<canvas id="myChart" width="400" height="400"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Segments pie chart example-->
					<div class="col-lg-4 mb-5">
						<div class="card card-raised h-100">
							<div class="card-header bg-transparent px-4">
								<div class="d-flex justify-content-between align-items-center">
									<div class="me-4">
										<h2 class="card-title mb-0">모임 생성 비율</h2>
										<div class="card-subtitle">전체 모임</div>
									</div>
								</div>
							</div>
							<div class="card-body p-4">
								<div
									class="d-flex h-100 w-100 align-items-center justify-content-center">
									<div class="w-100" style="max-width: 20rem">
										<canvas id="myChart2" width="300" height="400"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
	<footer class="footer mt-auto py-3 bg-dark">
		<div class="container">
			<span class="text-muted">Place sticky footer content here.</span>
		</div>
	</footer>
</body>
<!-- Load Bootstrap JS bundle-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- Load global scripts-->
        <script type="module" src="js/material.js"></script>
        <script src="js/scripts.js"></script>
        <!--  Load Chart.js via CDN-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.0-beta.10/chart.min.js" crossorigin="anonymous"></script>
        <!--  Load Chart.js customized defaults-->
        <script src="js/charts/chart-defaults.js"></script>
        <!--  Load chart demos for this page-->
        <script src="js/charts/demos/chart-pie-demo.js"></script>
        <script src="js/charts/demos/dashboard-chart-bar-grouped-demo.js"></script>
        <!-- Load Simple DataTables Scripts-->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
       

        <script src="https://assets.startbootstrap.com/js/sb-customizer.js"></script>
        <sb-customizer project="material-admin-pro"></sb-customizer>
    	<script defer src="https://static.cloudflareinsights.com/beacon.min.js" data-cf-beacon='{"rayId":"6852fa6eee65ae4f","token":"6e2c2575ac8f44ed824cef7899ba8463","version":"2021.8.1","si":10}'></script>
    	<!-- gender chart -->
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script> 
		<script src="https://cdn.jsdelivr.net/gh/emn178/chartjs-plugin-labels/src/chartjs-plugin-labels.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/0.2.0/Chart.min.js"></script>
<script>
		var data = {
			labels : [ "남자", "여자" ],
			datasets : [{
				fillColor : "rgba(150,200,250,0.5)",
				highlightFill : "rgba(150,200,250,0.75)",
				data : [ <c:out value="${gender.girl}"/>, <c:out value="${gender.boy}"/> ],
				}],
			};
			
		var step = 1;
		var max = <c:out value="${gender.total}"/>;
		var start = 0;
		var ctx = document.getElementById('myChart').getContext('2d');
		var myBarChart = new Chart(ctx).Bar(data, {
			scaleOverride : true,
			scaleSteps : Math.ceil((max - start) / step),
			scaleStepWidth : step,
			scaleStartValue : start
		});

		var data = {
				labels : [ "스터디", "운동", "봉사", "클래스" ],
				datasets : [{
					fillColor : "rgba(150,200,250,0.5)",
					highlightFill : "rgba(150,200,250,0.75)",
					data : [ <c:out value="${type.study}"/>, <c:out value="${type.sports}"/>,<c:out value="${type.volunteer}"/>,<c:out value="${type.classes}"/> ],
					}],
				};
				
		var step = 1;
		var max = <c:out value="${type.total}"/>;
		var start = 0;
		var ctx = document.getElementById('myChart2').getContext('2d');
		var myBarChart = new Chart(ctx).Bar(data, {
			scaleOverride : true,
			scaleSteps : Math.ceil((max - start) / step),
			scaleStepWidth : step,
			scaleStartValue : start
		});
		</script>

</html>