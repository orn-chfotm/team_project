<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Start include -->
<jsp:include page="../includes/head.jsp"/>
<head>
	<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
	<style>
		.ck.ck-editor{
			max-width:100%;
		}
		.ck-editor__editable{
			min-height:500px;
		}
		h1{
			font-size:2.5em;
			font-weight:bold;
		}
		th{
			text-align:center;
		}
	</style>
</head>
<jsp:include page="../includes/small-header.jsp"/>
<!-- End include -->
<div class="wrap">
	<div class="content-box container" role="main">

		<h1 class="page-header">문의하기</h1>

		<!---------------start form 글쓰기폼----------------->
		<form id="form" role="form" method="post" action="/Question/write">
			<div class="table table-responsive">
				<!-------- table start-------->
				<table class="table table table-bordered table-condensed">
					<tr>
						<th style="padding-top: 15px">유형</th>
						<td><select name="question_type" id="question_type"
							class="form-control">
								<option value="default">-선택하세요-</option>
								<option value="모임">모임</option>
								<option value="게시판">게시판</option>
								<option value="기타">기타</option>
						</select></td>
					</tr>
					<tr>
						<th style="padding-top: 15px">제목</th>
						<td><input type="text" class="form-control"
							id="question_title" name="question_title" value=""></td>
					</tr>
					<tr>
						<th style="padding-top: 20px">글내용</th>
						<td><textarea name="question_content" id="question_content"></textarea>
						</td>
					</tr>
				</table>
				<!---end table----->

				<!------------button 등록,초기화,목록-------------->
				<div class="pull-right">
					<button type="submit" class="btn btn-primary active" id="btnSave">등록</button>
					<button type="button" id="btn-returnList"
						class="btn btn-primary active"
						onclick="location.href='/Question/list'" id="btnList">목록</button>
				</div>
				<!-----button 등록,초기화,목록 end---->
			</div>
			<input type="hidden" class="form-control" name="user_id" id="user_id"
				value='${sessionScope.userid}' readonly>
		</form>
		<!---- End form 글쓰기폼---->
	</div>
</div>
<!-- start script -->
<script>
	/* 글쓰기 페이지 셀렉트박스포함 기본값이거나 빈칸일경우 경고창 + 등록안함*/
	$(document).ready(function(){
		

		$("#btnSave").on("click",function(e){
			if($("#question_type").val() === "default"){
				alert("유형을 선택해주세요");
				return false;
			}
			if($("#question_title").val() == "" || $("#question_title").val().length == 0){
				alert("제목을 채워주세요");
				return false;
			}
			if($("#user_id").val() == "" || $("#user_id").val().length == 0){
				alert("이름을 입력해주세요");
				return false;
			}
			if($(".ck-content").html() == "<p><br data-cke-filler=\"true\"></p>"){
				alert("내용을 입력해주세요");
				return false;
			}
			if(!confirm("등록하시겠습니까?")){
	            return false;
	         }
		});
			
	  	ClassicEditor
        .create(document.querySelector( "#question_content"),
   		{toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote',
 				    'blockQuote', 'insertTable','undo', 'redo' ],
		})
	
        .then( editor => { 
	        console.log( editor );
         })
	
	    .catch( error => { 
	        console.error( error ); 
	    });
	});
</script>
<!-- end script -->
<jsp:include page="../includes/footer.jsp" />