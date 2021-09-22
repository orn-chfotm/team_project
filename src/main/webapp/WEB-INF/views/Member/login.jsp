<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>Login</title>
	<style>
	    body, html{
	        height: 100%;
	    }
	    .height-100{
	        height: 100%;
	        display: flex;
	        align-items: center;
	        justify-content: center;
	    }
	    .box{
	        width: 300px;
	        padding: 10px;
	        border: 1px solid gray;
	        border-radius: 10px;
	    }
	</style>
</head>
<body>
   <!--  <div class="container-fluid height-100">
        <div class="row box">
        	<h2 class="text-center text-primary">로그인</h2>
            <form action="/Member/login" method="POST">
                <div class="form-group">
                    <label for="id">ID </label>
                    server 로 넘어가는 prameter 명은 name="id"
                    <input type="text" class="form-control" id="id" name="user_id" required>
                </div>
                <div class="form-group">
                    <label for="pw">PW </label>
                    server 로 넘어가는 prameter 명은 name="pw"
                    <input type="text" class="form-control" id="pw" name="user_pw" required>
                </div>
                <div class="text-center">
                    <input type="submit" class="btn btn-success" value="로그인">
                    <input type="button" class="btn btn-info" onclick="location.href='sign'" value="회원가입">
                    <input type="button" class="btn btn-warning" onclick="location.href='/admin'" value="관리자">
                </div>
            </form>
        </div>
    </div> -->
    <!-- Modal -->
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
		                    <input type="text" class="form-control" id="pw" name="user_pw" required>
		                </div>
		                <div class="text-center">
		                    <input type="submit" class="btn btn-success" value="로그인">
		                    <input type="button" class="btn btn-info" onclick="location.href='sign'" value="회원가입">
		                    <input type="button" class="btn btn-warning" onclick="location.href='/admin'" value="관리자">
		                </div>
		            </form>
				</div>
				<div class="modal-footer">
					<input type="submit" id="btn-submit" class="btn btn-success" value="로그인">
                    <input type="button" id="btn-sign" class="btn btn-info" onclick="location.href='/sign'" value="회원가입">
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		var message = "<c:out value='${message}'/>";
		if (message != "") {
			alert(message);
		}
		
		$("#btn-submit").on("click", function(e){
			$("#form-login").sumbit();
		});
	});
</script>
</html>