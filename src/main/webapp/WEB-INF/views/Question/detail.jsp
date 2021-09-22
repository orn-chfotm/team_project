<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Start include -->
<jsp:include page="../includes/head.jsp" />
<head>
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
<jsp:include page="../includes/small-header.jsp" />
<!-- End include -->
<div class="wrap">
	<div class="content-box container">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">QnA 상세보기</h1>
			</div>
		</div>
		<!-------------------------------QnA테이블 ------------------------------->
		<div class="row">
			<div class="col-lg-12">
				<!------------------form start 상세보기폼--------------->
				<form id="form-update" action="/Question/update" method="post">
					<table class="table table table-bordered table-condensed">
						<tr>
							<th>번호</th>
							<td>
								<input type="hidden" id="text-question-no" 
								class="form-control" name="question_no" value='<c:out value="${list.question_no}"/>' readonly='readonly'>
								<c:out value="${list.question_no}" />
							</td>
						</tr>

						<tr>
							<th>작성자</th>
							<td><c:out value='${list.user_id}' /></td>
						<tr>
						<tr>
							<th style="padding-top: 15px">유형</th>
							<td><select name="question_type" id="type"
								class="form-control">
									<option value="default">-선택해주세요-</option>
									<option value="사이트"
										<c:out value='${list.question_type eq "사이트" ? "selected" : "" }'/>>사이트</option>
									<option value="게시판"
										<c:out value='${list.question_type eq "게시판" ? "selected" : "" }'/>>게시판</option>
									<option value="기타"
										<c:out value='${list.question_type eq "기타" ? "selected" : "" }'/>>기타</option>
							</select></td>
						</tr>

						<tr>
							<th style="padding-top: 15px">제목</th>
							<td><input type="text" id="question_title"
								class="form-control" name="question_title" style="width: 100%"
								value="<c:out value='${list.question_title}'/>" readonly>
							</td>
						</tr>

						<tr>
							<th>내용</th>
							<td><textarea rows="10" id="question_content"
									class="form-control" name="question_content"
									style="resize: none;" readonly><c:out
										value="${list.question_content}" /></textarea></td>
						</tr>

						<tr>
							<th>작성일</th>
							<td><fmt:parseDate var="question_date"
									value="${list.question_date}" pattern="yyyy-MM-dd" /> <fmt:formatDate
									value="${question_date}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</table>
					<!--- ---QnA테이블 ------->

					<!------------------------- button 등록 수정 목록 ----------------------------->

					<div class="pull-right">
						<c:if test="${sessionScope.userid != null}">
							<input type="submit" class="btn btn-primary active"
								id="modifyInsert" value="등록">
							<input type="button" id="btn-modify"
								class="btn btn-primary active" value="수정">
							<input type="button" class="btn btn-primary active" id="delete"
								value="삭제">
						</c:if>
						<input id="btn-returnList" type="button"
							class="btn btn-primary active" value="Q&A목록"> <a
							class='move'
							href="/Question/detail/<c:out value='${lists.question_no}'/>">
							<c:out value="${lists.question_title}" />
						</a>
					</div>
					<!--------- button ------->
				</form>
				<!-- form end 상세보기 테이블---->
			</div>
		</div>
		<c:if test="${sessionScope.userid != null}">
			<div>
				<!-- start form 답변 -->
				<form action="/Question/review" method="post">
					<label for="textarea-content">답변</label>
					<textarea rows="5" class="form-control" id="answer_content"
						name="answer_content" style="resize: none;"></textarea>
					<input type="hidden" name="question_no"
						value='<c:out value="${list.question_no}"/>'>

					<div class="pull-right">
						<input type="submit" class="btn btn-primary active"
							style="margin-top: 20px; margin-bottom: 20px;" id="answerReply"
							value="등록">
					</div>
				</form>
				<!-- end form -->
			</div>
		</c:if>
		<c:if test="${sessionScope.userid != null}">
			<h1 class="page-header">QnA 댓글</h1>
			<c:forEach var="answer" items="${answerList}">

				<!-- 각 댓글 레이아웃 -->
				<div class="comment-box">
					<div class="comment-nick-box">
						<!-- 댓글 작성자 ID -->
						<span><b><c:out value="${list.user_id}" /></b></span>
					</div>
					<!-- 댓글 내용 -->
					<div class="cococontent comment-text-box">
						<span id="span-content"><c:out
								value="${answer.answer_content}" /></span>
					</div>
					<div class="comment-info-box">
						<!-- 댓글 작성일 -->
						<span><fmt:parseDate var="answer_date"
								value="${answer.answer_date}" pattern="yyyy-MM-dd HH:mm" /> <fmt:formatDate
								value="${answer_date}" pattern="HH:mm" /></span>
					</div>
					<!-- dropdown 버튼 -->
					<div class="comment-tool">
						<div class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown"> <i
								class="fas fa-ellipsis-v"></i>
							</a>
							<ul class="dropdown-menu dropdown-menu-right">
								<li><a href="/Question/answer_Update" id="btn-update"
									data-toggle="modal" data-target="#replyModal"
									data-content-no="<c:out value='${answer.content_no}'/>"><b>수정</b></a></li>
								<li><a href="/Question/answer_delete" class="btn-delete"
									data-content-no="<c:out value='${answer.content_no}'/>"><b>삭제</b></a></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<form id="action-form" method='POST'>
			<input type='hidden' name='content_no'> <input type='hidden'
				name='question_no'> <input type='hidden'
				name='answer_content'>
		</form>
	</div>
	<!--container end -->
	<!-- list 로 돌아가기 hidden -->
	<form id='operForm' action="/Question/list" method="get">
		<input type='hidden' name='pageNum'
			value='<c:out value="${cri.pageNum}"/>'> <input type='hidden'
			name='amount' value='<c:out value="${cri.amount}"/>'> <input
			type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
		<input type='hidden' name='keyword'
			value='<c:out value="${cri.keyword}"/>'>
	</form>
	<!-- ///list 로 돌아가기 hidden -->

	<!-- modal ----------------------------------------------------------------------------->
	<!-- Modal -->
	<div class="modal fade" id="replyModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">댓글 수정</h4>
				</div>
				<div class="modal-body">
					<textarea id="modal-textarea" class="form-control"
						placeholder="수정할 내용을 입력해주세요" rows="5"
						style="resize: none; text-align: left"></textarea>
				</div>

				<div class="modal-footer">
					<button type="button" id="btn-modal-modify" class="btn btn-default"
						data-dismiss="modal" data-reply-update=''>수정</button>
					<button type="button" id="btn-modal-cancel" class="btn btn-default"
						data-dismiss="modal" data-reply-update=''>취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal end  -->
</div>
<!-- Start script -->
<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>
<script> 
   $(document).ready(function() {
	   var message = "<c:out value='${message}'/>";
		if(message != ""){
			alert(message);
		}
	   //게시판 수정
      $("#btn-modify").on("click", function(e) { 
         $("#question_title").removeAttr("readonly");
      });
      
      ////댓글삭제/////////
      $(".btn-delete").on("click", function(e){
         e.preventDefault();
         $("#action-form").find("input[name='question_no']").val($("#text-question-no").val());
         $("#action-form").find("input[name='content_no']").val($(this).data("content-no"));
         if(!confirm("삭제하시겠습니까?")){
	           return false;
         }
         $("#action-form").attr("action","/Question/answer_delete").submit();
       });
      
      // 댓글 번호 보내주기
      $(".content-box").on("click","#btn-update", function(e){
         //console.log($(this).data("content-no"));
         var content = $(this).parents("div[class='comment-box']").find("span[id='span-content']").html();
         $("#btn-modal-modify").attr("data-reply-update", $(this).data("content-no"));
         $("#modal-textarea").val(content);
      });
         
      //댓글 수정//
      $("#btn-modal-modify").on("click", function(e){
         e.preventDefault();
         if(!confirm("등록하시겠습니까?")){
	           return false;
         }
         $("#action-form").find("input[name='question_no']").val($("#text-question-no").val());
         $("#action-form").find("input[name='content_no']").val($("#replyModal #btn-modal-modify").data("reply-update"));
         $("#action-form").find("input[name='answer_content']").val($("#replyModal #modal-textarea").val());
         $("#action-form").attr("action","/Question/answer_Update").submit();
         
      });
    
      /*수정 버튼클릭후  유형이 기본값이거나 제목,용이 빈칸이면 경고띄우고 전송안함*/
      $("#modifyInsert").on("click", function(e) {
         e.preventDefault();
         if ($("#question_title").val() == "") {
            alert("제목을 입력해주세요");
         }
         else if ($("#question_content").val() == "") {
            alert("내용을 입력해주세요");
         }
         else if ($("#type").val() === "default") {
            alert("유형을 선택해주세요");
         }
         else{
            $("#form-update").submit();
         }
      });
		/* list로 돌아가기 js */
   	  $("#btn-returnList").on("click", function(e){
		e.preventDefault();
		$("#operForm").submit();
	  });
   	  
      /* 답변에대한 댓글등록 빈칸일경우 경고창 댓글등록안함*/
      $("#answerReply").on("click", function(e) {
         if($("#answer_content").val() == "") {
            alert("글을 입력해주세요");  
            return false;        
         }else if(!confirm("등록하시겠습니까?")){
	           return false;
         } 
      });
      //게시판삭제
      var form=$("#form-update");
      
         $("#delete").on("click", function(e){
        	e.preventDefault();
            form.attr("action","/Question/delete");
            if(!confirm("삭제하시겠습니까?")){
	            return false;
	         }
            form.submit();
         });
         
       //CK에디터
      ClassicEditor
        .create(document.querySelector( "#question_content"),
      		{toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote',
	 	 				 'blockQuote', 'insertTable','undo', 'redo' ],
	 	 })
        .then( editor => { 
	          editor.isReadOnly=true;
       $("#btn-modify").on("click", function(e){
          editor.isReadOnly=false;
       	 });
       
	      console.log( editor );
	       
		  })
	    .catch( error => { 
	
	       console.error( error ); 
	
	      });
   });
</script>
<!-- End script -->
<jsp:include page="../includes/footer.jsp" />