<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- header -->
<jsp:include page="../includes/head.jsp" />
<style>
	#input-box {
		text-align: right;
		padding: 10px;
	}
	
	#button-a {
		background-color: #1b58bb;
		color: white;
		text-align: right;
		position: relative;
		left: 1000px;
	}
	
	 h4{
    	text-align: left;
    	padding-left: 5%;
    }
    
    .paddingTop-10{
    	padding-top: 1%;
    }
    
    .panel-box{
    	height: auto;
    	position: relative;
    }
	
	#content-box{
    	height: auto; 
    	margin: 10px; 
    	text-align: left; 
    	padding-left: 5%; 
    	padding-top:0%; 
    	font-size: 25px;
    	position: relative;
    }
    
    img{
    	position:relative;
    	width: 100%; 
    	height: 300px;
    }
   	.uploadResult ul{
		list-style:none;
		padding: 0%;
	}
	
	#radio {
		padding-left: 0%;
	}
	
	#location {
		float: left;
	}
	
	#input-box {
		height: 200px;
		width: 100%;
		text-align: left;
		padding-left: 0%;
		padding-right: 4%;
	}
</style>
<jsp:include page="../includes/header.jsp" />

<!-- 인기 게시판 -->
<div class="wrap">
	<div class="content-box container">
		<div class="row">
		<form role="form" method="post" action="/Board/update">
			<!-- 간략한 내용-->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-box panel-default" id="input-box">
						<h4>
							<b>title</b> <input type="text" class="form-control"
								name="meet_title" value='<c:out value="${update.meet_title}"/>'>
						</h4>
						<h4>
							<b>type</b> 
							<div id="radio">
								<input type="radio" id="type" name="meet_type" value="공부">
								<label for="type">공부</label>
								<input type="radio" id="type" name="meet_type" value="운동">
			 					<label for="type">운동</label>
								<input type="radio" id="type" name="meet_type" value="클래스">
								<label for="type">클래스</label>
								<input type="radio" id="type" name="meet_type" value="봉사">
			 					<label for="type">봉사</label>
							</div>
						</h4>
						<h4>
							<b>location</b> 
							<div>
								<select name="meet_location" id="location">
									<option value="">--시 / 도--</option>
									<option value="서울특별시">서울</option>
									<option value="경기도">경기</option>
									<option value="인천광역시">인천</option>
									<option value="전라북도">전북</option>
									<option value="전라남도">전남</option>
									<option value="충청북도">충북</option>
									<option value="충청남도">충남</option>
								</select>
							</div>
						</h4>
					</div>
				</div>
			</div>
			<div class="row" style="height: 200px;">
				<div class="col-lg-12">
					<div class="panel panel-box panel-default">
						<div class="panel-heading">
							<div class="uploadDiv">
								<input type="file" name="uploadFile" multiple>
							</div>
							<div class="uploadResult">
								<ul>
								</ul>
							</div>
							<div id="content-box">
								<textarea rows="10" name="meet_content" class="form-control" style="resize: none;"><c:out value="${update.meet_content}"></c:out></textarea>
							</div>
						</div>
						<div class="panel-body paddingTop-10">
						</div>
					</div>
				</div>
			</div>
			<input type="hidden" value='<c:out value="${update.meet_num}" />' name="meet_num">
			<input type="submit" style="margin-top:310px;" class="btn btn-success" value="수정" id="btnUpdate">
		</form>
	</div>
	<!-- 인기 게시판 ----------------------------------------------------------------------------------------------------------->
	</div>
</div>
<!-- footer -->
<jsp:include page="../includes/footer.jsp" />
<script type="text/javascript">
	$(function() {
		var formObj = $("form[role='form']");
		
		$("#btnUpdate").on("click", function(e) {
			e.preventDefault();
			console.log("submit clicked");
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj) {
				var jobj = $(obj);
				// console.dir(obj);
				
				str += "<input type='hidden' name='attach_list[" + i + "].file_name' value='"+ jobj.data("filename") +"'>";
				str += "<input type='hidden' name='attach_list[" + i + "].uuid' value='"+ jobj.data("uuid") +"'>";
				str += "<input type='hidden' name='attach_list[" + i + "].upload_path' value='"+ jobj.data("path") +"'>";
				str += "<input type='hidden' name='attach_list[" + i + "].file_type' value='"+ jobj.data("filetype") +"'>";
						
				console.log(jobj.data("filename"));
				console.log(jobj.data("uuid"));
				console.log(jobj.data("path"));
				console.log(jobj.data("type"));
				
				console.log()
				
			});
				// console.log(jobj.data("type"));
				console.log(str);
			formObj.append(str).submit();
		});
		
		var bno = '<c:out value="${update.meet_num}" />';
		$
				.getJSON(
						"/Board/getAttachList",
						{
							no : bno
						},
						function(arr) {

							var str = "";

							$(arr)
									.each(
											function(i, attach) {
												if (attach.file_type) {
													var fileCallPath = encodeURIComponent(attach.upload_path
															+ "/"
															+ attach.uuid
															+ "_"
															+ attach.file_name);

													str += "<li data-path='" + attach.upload_path + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.file_name + "' data-filetype='" + attach.file_type + "'>";
													str += " 	<div>";
													str += " 		<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'>";
													str += " 			<i class='fa fa-times'></i>";
													str += " 		</button><br>";
													str += " 		<img src='/Board/display?fileName=" + fileCallPath + "'>";
													str += " 		";
													str += " 	</div>";
													str += "</li>";
												} else {
													str_control += '<li data-target="#myCarousel" data-slide-to="0" class="active"></li>';
													var fileCallPath = encodeURIComponent(attach.upload_path
															+ "/"
															+ attach.uuid
															+ "_"
															+ attach.file_name);
													str_inner += " 	<div class='active' data-path='" + attach.upload_path + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.file_name + "' data-filetype='" + attach.file_type + "'>";
													str_inner += " 		<span>"
															+ attach.file_name
															+ "</span><br/>";
													str_inner += " 		<img src='https://dummyimage.com/450x300/dee2e6/6c757d.jpg' style='width:100%; height:300px'>";
													str_inner += " 	</div>";
												}
											});
							$(".uploadResult ul").html(str);
						});

		// 파일 확장자나 크기의 사전 처리 함수
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); // 압축 파일 지정
		var maxSize = 5242880; // 최대 파일 크기 5MB
		
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드 할 수 없다.");
				return false;
			}
			return true;
		}
		
		// 파일 업로드를 확인
		function showUploadResult(uploadResultArr){
			if(!uploadResultArr || uploadResultArr.length == 0){
				return;
			}
			
			var uploadResult = $(".uploadResult ul");
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
				console.log(obj.file_type);
				if(obj.file_type){
					// str += "<li>" + obj.file_name + "</li>";
					console.log(obj.upload_path + "/" + obj.uuid + "_" + obj.file_name);
					var fileCallPath = encodeURIComponent(obj.upload_path + "/" + obj.uuid + "_" + obj.file_name);
					
					str += "<li data-path='" + obj.upload_path + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.file_name + "' data-type='" + obj.file_type + "'>";
					str += " 	<div>";
					str += " 		<span>" + obj.file_name + "</span>";
					str += " 		<button type='button' data-file=\'" + fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'>";
					str += " 			<i class='fa fa-times'></i>";
					str += " 		</button><br>";
					str += " 		<img src='/Board/display?fileName=" + fileCallPath + "'>";
					str += " 	</div>";
					str += "</li>";
				} else {
					alert("이미지만 가능 합니다.");
					// console.log(obj.image);
					// str += "<li><img src='/resources/img/attach.png'>" + obj.fileName + "</li>";
				}
			});
			uploadResult.append(str);
		}
		
		// 파일을 선택할때 ajax가 실행
		$("input[type='file']").change(function(e) {
			
			$(".uploadResult ul li").remove();
			
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			
			for(var i=0; i<files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				url: '/Board/uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType: 'json',
				success: function(result){
					console.log(result);
					showUploadResult(result);
				}
			});
		});
		
		// 첨부파일의 삭제
		$(".uploadResult").on("click", "button", function(e) {
			
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var targetLi = $(this).closest("li");
			
			var uuid = $(this).parent().parent().data("uuid");
			console.log(uuid);
			
			$.ajax({
				url: '/Board/deleteUpdateFile',
				data: {fileName: targetFile, type: type, uuid: uuid},
				dataType: 'text',
				type: 'POST',
				success: function(result) {
					alert(result);
					targetLi.remove();
				}
			});
		});
	});
</script>
