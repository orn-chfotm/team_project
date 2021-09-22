<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
	<style>
		.span-userid{
			position: relative;
		    display: block;
		    padding: 10px 15px;
		    line-height: 30px;
		    color: white;
		}
	</style>
</head>
<body>
	<!-- 로딩 페이지 -->
	<div id="load">
		<img src="/resources/img/Search.gif" alt="loading">
	</div>
	<!-- // 로딩페이지 -->
	<header>
		<nav class="navbar text-color">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<i class="fas fa-bars"></i>
					</button>
					<a class="navbar-brand" href="/index">On & Off</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li class="active"><a href="/index">Home</a></li>
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="/Board">모임<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="">전체게시판</a>
								<li><a href="/P">인기</a></li>
								<li><a href="/S">스터디</a></li>
								<li><a href="/E">운동</a></li>
								<li><a href="/C">클래스</a></li>
								<li><a href="/H">봉사</a></li>
							</ul>
						</li>
						<li><a href="/Location">공공시설</a></li>
						<li><a href="/Question">문의</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<c:choose> 
							<c:when test="${sessionScope.userid eq null}"> 
								<li><a href="/sign"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
								<li><a data-toggle="modal" data-target="#loginModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
							</c:when>
							<c:when test="${sessionScope.userInfo.authority eq 'ROLE_USER'}">
								<li><span class="span-userid"><b><c:out value="${sessionScope.userid}"/>님</b></span></li>
								<li><a href="/Member/logout"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
							</c:when>
							<c:when test="${sessionScope.userInfo.authority eq 'ROLE_ADMIN'}">
								<li><span class="span-userid"><b><c:out value="${sessionScope.userid}"/>님</b></span></li>
								<li><a href="/Admin/adminHome"><i class="fas fa-users-cog"></i>관리자 페이지</a></li>
								<li><a href="/Member/logout"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
							</c:when>
							<c:when test="${sessionScope.userInfo.authority eq 'ROLE_MANAGER'}">
								<li><span class="span-userid"><b><c:out value="${sessionScope.userid}"/>님</b></span></li>
								<li><a href="/Admin/adminHome"><i class="fas fa-users-cog"></i>관리자 페이지</a></li>
								<li><a href="/Member/logout"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>
		</nav>

	</header>

	<!-- Add your site or app content here -->
	<div class="background-image-container">
		<div class="container">
			<div class="row">
			</div>
		</div>
	</div>
	
	<!-- --------------------loginModal -->
	<div id="loginModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">로그인</h4>
				</div>
				<div class="modal-body">
					<form id="form-login"action="/Member/login" method="POST">
		                <div class="form-group">
		                    <label for="id">ID </label>
		                    <!-- server 로 넘어가는 prameter 명은 name="id" -->
		                    <input type="text" class="form-control" id="id" name="user_id" required>
		                </div>
		                <div class="form-group">
		                    <label for="pw">PW </label>
		                    <!-- server 로 넘어가는 prameter 명은 name="pw" -->
		                    <input type="password" class="form-control" id="pw" name="user_pw" required>
		                </div>
	                	<input style="width: 100%;" type="button" id="btn-submit" class="btn btn-success btn-width-100 btn-text" value="로그인">
		            </form>
				</div>
				<div class="modal-footer">
                	<a type="button" id="btn-sign" onclick="location.href='/sign'">회원가입</a>
				</div>
			</div>
		</div>
		<form action="/Board/popular" method="GET" id="move-form">
				<input type="hidden" name='subject' value=''>
				<input type="hidden" name='pageNum' value='1'>
				<input type="hidden" name='amount' value='10'>
		</form>
	</div>
	<!-- --------------------/loginModal -->
	<script>
	$(document).ready(function(){
		$("#btn-submit").on("click", function(e){
			e.preventDefault();
			if($("#id").val() == "" && $("#pw").val() == ""){
				alert("ID 또는 PW 를 입력해주세요.");
			}else{
				$("#form-login").submit();
			}
		});
		
		$(function(){
			var actionForm = $("#move-form");
			$(".dropdown-menu li a").on("click",function(e){
				e.preventDefault();
				var subject=$(this).attr("href").replace("/","");
				actionForm.find("input[name='subject']").val(subject);
				console.log(actionForm.find("input[name='subject']").val()+'클릭됨');
				actionForm.submit();			
			});
		});
		
		setTimeout(function() {
            $("#load").fadeOut();
        }, 1500);
	});
	</script>