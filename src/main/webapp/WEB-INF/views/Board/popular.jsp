<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- header -->
<jsp:include page="../includes/head.jsp"/>
<head>
	<style>
		.panel-default{
	        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
	        transition: 0.3s;
	        font-family: 'Jua', sans-serif;
	    }
	    .panel-default:hover{
	        box-shadow: 0 8px 16px 0 rgba(0,0,0,0.5);
	        cursor: pointer;
	    }
	    #board-search{
	        text-align: right;
	        padding-bottom: 7%;
	    }
	</style>
</head>
<jsp:include page="../includes/header.jsp"/>
<!-- 인기 게시판 -->
<div class="wrap">
    <div class="content-box container">
        <div>
            <h1 id="board-title" class="page-header" class="page-header">
            	<c:choose>
	            	<c:when test="${'' eq cri.subject}">전체 게시판</c:when>
	            	<c:when test="${'P' eq cri.subject}">인기 게시판</c:when>
	            	<c:when test="${'S' eq cri.subject}">스터디 게시판</c:when>
	            	<c:when test="${'E' eq cri.subject}">운동 게시판</c:when>
            		<c:when test="${'C' eq cri.subject}">클래스 게시판</c:when>
            		<c:when test="${'H' eq cri.subject}">봉사 게시판</c:when>
            	</c:choose>  
            </h1>
            <!-----------------------검색 searchForm------------------------------>
		    <div id="board-search">
		    	  <form class="navbar-form navbar-right" id="searchForm" action="/Board/popular" method="get">
		       		  <div class="form-group" >
		         		<select name="type" class="form-control">
							<option value="" <c:out value="${pageMaker.cri.type == null? 'selected':''}"/>>--</option>
							<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected':''}"/>>제목</option>
							<option value="C"  <c:out value="${pageMaker.cri.type eq 'C' ? 'selected':''}"/>>내용</option>
							<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected':''}"/>>제목과 내용</option>
						</select>
			           		<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"/>' class="form-control"placeholder="검색어를 입력해주세요."/>
							<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
							<button class="btn btn-primary" style="float:right">검색</button>
		        	 </div>
		     	 </form>
		   	</div>
   	 	<!---------------------검색 searchForm------------------------------>
        </div>
        <div class="row">
        	<c:forEach var="popular" items="${list}">
	            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
	                <div class="panel panel-box panel-default" onclick="location.href='/Board/detail/<c:out value='${popular.meet_num}'/>'">
	                    <div class="panel-heading" id="boardImage">
		                    <c:choose>
		                    	<c:when test="${popular.meet_type eq '운동'}">
			                        <img src="/resources/img/defautImage/sport.png" >
		                    	</c:when>
		                    	<c:when test="${popular.meet_type eq '클래스'}">
			                        <img src="/resources/img/defautImage/class.png" >
		                    	</c:when>
		                    	<c:when test="${popular.meet_type eq '봉사'}">
			                        <img src="/resources/img/defautImage/service.png" >
		                    	</c:when>
		                    	<c:otherwise>
		                    		<img src="/resources/img/defautImage/study.png" >
		                    	</c:otherwise>
		                    </c:choose>
	                    </div>
	                    <div class="panel-body paddingTop-10">
	                        <h5 class="fw-bolder">
	                        	<c:out value="${popular.meet_title}"></c:out>
	                        </h5>
	                    </div>
	                    <div class="panel-footer paddingTop-10">
	                        <c:out value="${popular.meet_type}"></c:out> /
	                        <c:out value="${popular.meet_regulation}"></c:out> /
	                        <c:out value="${popular.meet_count}"></c:out>
	                    </div>
	                </div>
	            </div>
        	</c:forEach>            
        </div>
        
        <!-------------------------------페이징 ------------------------------------->
      <div class="pull-right">
               
        <input type="button" class="btn btn-primary active" onclick="location.href='/Board/insert'" id="write" value="글쓰기"
            style="float: right">
         <!-- 글쓰기 버튼 -->
      <div style="margin-top:20px">
         <ul class="pagination">
            <c:if test="${pageMaker.prev}">
               <li class="paginate_button previous">
               <a href="${pageMaker.startPage-1}">Previous</a>
               </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
               <li
                  class="paginate_button ${pageMaker.cri.pageNum==num?'active':''}">
                  <a href="${num}">${num}</a>
               </li>

            </c:forEach>

            <c:if test="${pageMaker.next}">
               <li class="paginate_button next">
               <a href="${pageMaker.endPage+1}">Next</a>
               </li>
            </c:if>
         </ul>
      
         <form id="actionForm" action="/Board/popular" method="get" >
             <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>
             <input type="hidden" name="type"  value='<c:out value="${pageMaker.cri.type}"/>'>
             <input type="hidden" name="keyword"  value='<c:out value="${pageMaker.cri.keyword}"/>'>                             
         </form>
      </div>
      </div>
         <!--------------------- 페이징-------------------------->
    </div>
    <!-- 인기 게시판 ----------------------------------------------------------------------------------------------------------->
</div>

<script type="text/javascript">
	$(function() {
		 var actionForm = $("#actionForm");
		//////////////페이징 버튼////////////////
		 $(".paginate_button a").on("click", function(e) {
			e.preventDefault();  //전송을 막음
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		 });
		 
		 //게시판 리스트 콤보박스////
		 $("#pageUnit").on("change",function(e){
			 e.preventDefault();
			 console.log('change');
			 actionForm.find("input[name='amount']").val($(this).val());
			 actionForm.submit();
		 });
		 
		//게시판 리스트 콤보박스////
	      $("#pageUnit").on("change",function(e){
	      e.preventDefault();
	      console.log('change');
	      actionForm.find("input[name='amount']").val($(this).val());
	      actionForm.submit();
	      });
	      
	      ///////////////게시판 검색 스크립트////////////////////
	      var searchForm = $("#searchForm");
	      
	      $("#searchForm button").on("click",function(e){
	    	  if(!searchForm.find("option:selected").val()){
	    	  alert("검색 종류를 선택하세요");
	    	  return false;
	      }
	       if(!searchForm.find("input[name='keyword']").val()){
	    	   alert("키워드를 입력하세요");
	    	   return false;
	       }
	      searchForm.find("input[name='pageNum']").val("1");
	      e.preventDefault();
	      
	      searchForm.submit();
	      });
	});
</script>
<!-- footer -->
<jsp:include page="../includes/footer.jsp"/>

