<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Start include -->
<jsp:include page="../includes/head.jsp"/>
<head>
<style>
	h1{
		font-weight:bold;
	}
</style>
</head>
<jsp:include page="../includes/small-header.jsp"/>
<!-- End include -->
<!-- Start content -->
<div class="wrap">
	<div class="content-box container">
		<h1 class="page-header">QnA게시판</h1>
		<div class="row">
			<!------------------------리스트 콤보박스--------------------------->
			<div class="col-lg-6">
				<label for="list-number"></label> <select id="pageUnit"
					name="list-number" size="1" class="form-control"
					style="width: 100px">
					<option value="10"
						<c:out value='${pageMaker.cri.amount eq "10" ? "selected":""}'/>>10개씩</option>
					<option value="20"
						<c:out value='${pageMaker.cri.amount eq "20" ? "selected":""}'/>>20개씩</option>
					<option value="30"
						<c:out value='${pageMaker.cri.amount eq "30" ? "selected":""}'/>>30개씩</option>
					<option value="40"
						<c:out value='${pageMaker.cri.amount eq "40" ? "selected":""}'/>>40개씩</option>
				</select>
			</div>
			<!------------리스트 콤보박스--------------->

			<!-----------------------검색 searchForm------------------------------>
			<div class="col-lg-6">
				<form class="navbar-form navbar-right" id="searchForm"
					action="/Question/list" method="get">
					<div class="form-group" style="margin-top: 12px">
						<select name="type" class="form-control">
							<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
							<option value="C"
								<c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
							<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W' ? 'selected':''}"/>>작성자</option>
							<option value="TC"
								<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/>>제목과
								내용</option>
						</select> <input type="text" name="keyword"
							value='<c:out value="${pageMaker.cri.keyword}"/>'
							class="form-control" placeholder="검색어를 입력해주세요." /> <input
							type="hidden" name="pageNum"
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
							type="hidden" name="amount"
							value='<c:out value="${pageMaker.cri.amount}"/>' />
						<button class="btn btn-primary"
							style="float: right; margin-left: 5px;">검색</button>
					</div>
				</form>
			</div>
			<!---------------------검색 searchForm------------------------------>
		</div>
		<!-----------------QnA 테이블 ------------------------------>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>유형</th>
					<th>제목</th>
					<th>이름</th>
					<th>날자</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lists" items="${list}">
					<tr>
						<td><c:out value="${lists.question_no}" /></td>
						<td><c:out value="${lists.question_type}" /></td>
						<td><a class='move'
							data-question-no="<c:out value='${lists.question_no}'/>"> <c:out
									value="${lists.question_title}" /></a></td>
						<td><c:out value="${lists.user_id}" /></td>
						<td><fmt:parseDate var="question_date"
								value="${lists.question_date}" pattern="yyyy-MM-dd" /> <fmt:formatDate
								value="${question_date}" pattern="yyyy-MM-dd" /></td>
						<td><c:out value="${lists.cnt}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- QnA테이블 끝 -->

		<!-------------------------------페이징 ------------------------------------->
		<div class="pull-right">
			<c:if test="${sessionScope.userid != null}">
				<input type="button" class="btn btn-primary active"
					onclick="location.href='/Question/write'" id="write" value="글쓰기"
					style="float: right">
			</c:if>
			<!-- 글쓰기 버튼 -->
			<div style="margin-top: 20px">
				<ul class="pagination">

					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a
							href="${pageMaker.startPage-1}">Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li
							class="paginate_button ${pageMaker.cri.pageNum==num?'active':''}">
							<a href="${num}">${num}</a>
						</li>

					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a
							href="${pageMaker.endPage+1}">Next</a></li>
					</c:if>
				</ul>

				<form id="actionForm" action="/Question/list" method="get">
					<input type="hidden" name="pageNum"
						value='<c:out value="${pageMaker.cri.pageNum}"/>'> <input
						type="hidden" name="amount"
						value='<c:out value="${pageMaker.cri.amount}"/>'> <input
						type="hidden" name="type"
						value='<c:out value="${pageMaker.cri.type}"/>'> <input
						type="hidden" name="keyword"
						value='<c:out value="${pageMaker.cri.keyword}"/>'>
				</form>
			</div>
		</div>
		<!--------------------- 페이징-------------------------->
	</div>
	<!-- End content -->
</div>
<!-- Start script -->
<script>
	$(document).ready(
			function() {

				var actionForm = $("#actionForm");
				//////////////페이징 버튼////////////////
				$(".paginate_button a").on(
						"click",
						function(e) {
							e.preventDefault(); //전송을 막음
							console.log('click');
							actionForm.find("input[name='pageNum']").val(
									$(this).attr("href"));
							actionForm.submit();
						});

				//게시판 리스트 콤보박스////
				$("#pageUnit").on(
						"change",
						function(e) {
							e.preventDefault();
							console.log('change');
							actionForm.find("input[name='amount']").val(
									$(this).val());
							actionForm.submit();
						});

				///////////////게시판 검색 스크립트////////////////////
				var searchForm = $("#searchForm");

				$("#searchForm button").on("click", function(e) {
					if (!searchForm.find("option:selected").val()) {
						alert("검색 종류를 선택하세요");
						return false;
					}
					if (!searchForm.find("input[name='keyword']").val()) {
						alert("키워드를 입력하세요");
						return false;
					}
					searchForm.find("input[name='pageNum']").val("1");
					e.preventDefault();

					searchForm.submit();
				});

				// TMI
				$(".move").on(
						"click",
						function(e) {
							e.preventDefault();
							actionForm.attr("action", "/Question/detail/"
									+ $(this).attr("data-question-no"));
							actionForm.submit();
						});
			});
</script>
<!-- End script -->

<jsp:include page="../includes/footer.jsp" />