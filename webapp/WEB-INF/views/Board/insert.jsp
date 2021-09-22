<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- header -->
<jsp:include page="../includes/head.jsp"/>
<jsp:include page="../includes/header.jsp"/>

<style>
	.uploadResult ul{
		list-style:none;
	}
	
	ul li{
		float: left;
		
	}
	
	li img{
		margin-left: 1px;
	}
</style>
<!-- 컨텐츠 내용 -->
<div class="wrap">
	<div class="content-box container" role="main">
		<h2 class="page-header">문의하기</h2>
		<form role="form" method="post" action="/Board/insert">
			<div class="table table-responsive">
				<table class="table table-striped">
					<tr>
						<td>작성자</td>	
						<td>
							<input type="text" class="form-control" name="meet_writer" value="${sessionScope.userid}" readonly>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" class="form-control" name="meet_title"></td>
					</tr>
					<tr>
						<td>Type</td>
						<td>
							<div>
								<input type="radio" id="type" name="meet_type" value="공부">
								<label for="type">공부</label>
								<input type="radio" id="type" name="meet_type" value="운동">
			 					<label for="type">운동</label>
								<input type="radio" id="type" name="meet_type" value="클래스">
								<label for="type">클래스</label>
								<input type="radio" id="type" name="meet_type" value="봉사">
			 					<label for="type">봉사</label>
							</div>
						</td>			
					</tr>
					<tr>
						<td>파일 첨부</td>
						<td>
							<div class="uploadDiv">
								<input type="file" name="uploadFile" multiple>
							</div>
							<div class="uploadResult">
								<ul>
								
								</ul>
							</div>
						</td>
					</tr>
					<tr>
						<td>인원</td>
						<td><input type="number" value="2" max="10" min="2" name="meet_regulation"></td>
					</tr>
					<tr>
						<td>장소</td>
						<td>
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
						</td>
					</tr>
					<tr>
						<td>글내용</td>
						<td><textarea rows="10" cols="50" name="meet_content" class="form-control"></textarea></td>
					</tr>
					<tr> 
						<td colspan="2"  class="text-center"></td>
					</tr>
				</table>
				<div class="pull-right">
					<input type="submit" class="btn btn-success" value="등록" id="btnInsert">
					<button type="button" class="btn btn-primary active" onclick="location.href='/Board'" id="btnList" >목록</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- footer -->
<jsp:include page="../includes/footer.jsp"/>
<script type="text/javascript">
	$(function() {
		var formObj = $("form[role='form']");
		
		$("#btnInsert").on("click", function(e) {
			e.preventDefault();
			console.log("submit clicked");
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj) {
				var jobj = $(obj);
				// console.dir(obj);
				
				str += "<input type='hidden' name='attach_list[" + i + "].file_name' value='"+ jobj.data("filename") +"'>";
				str += "<input type='hidden' name='attach_list[" + i + "].uuid' value='"+ jobj.data("uuid") +"'>";
				str += "<input type='hidden' name='attach_list[" + i + "].upload_path' value='"+ jobj.data("path") +"'>";
				str += "<input type='hidden' name='attach_list[" + i + "].file_type' value='"+ jobj.data("type") +"'>";
						
				// console.log(jobj.data("filename"));
				// console.log(jobj.data("uuid"));
				// console.log(jobj.data("path"));
				
			});
				// console.log(jobj.data("type"));
				console.log(str);
			formObj.append(str).submit();
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
					console.log(obj.upload_path + "/s_" + obj.uuid + "_" + obj.file_name);
					var fileCallPath = encodeURIComponent(obj.upload_path + "/s_" + obj.uuid + "_" + obj.file_name);
					
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
		$(".uploadResult").on("click", "button", function(e){
			console.log("delete file");
			
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url: '/Board/deleteFile',
				data: {fileName: targetFile, type: type},
				dataType: 'text',
				type: 'POST',
				success: function(result) {
					alert(result);
					targetLi.remove();
				}
			});
		});
		
		// 목록으로 가기
		$("#btnInst").on("click", function() {
			$(location).attr('href', "/Board/popular");
		});
	});
</script>
