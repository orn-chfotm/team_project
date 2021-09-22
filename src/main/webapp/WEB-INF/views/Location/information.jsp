<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- header -->
<jsp:include page="../includes/head.jsp"/>
<style>
.panel-heading h1{
	color:#86E57F;
}
.back-btn{
	float:right;
	margin-top:35px;
}
#btn-search{
	float:right;
	
}
#search-bar{
	width:20%;
	float:right;
}
</style>
<jsp:include page="../includes/small-header.jsp"/>

<!-- 컨텐츠 내용 -->
<div class="wrap">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
	            <div class="panel panel-default">
	            	<!-- panel - heading -->
	            	<div class="panel-heading">
	            		<div class="row text-center">
	            			<div class="col-sm-11">
		                    	<h1><strong>지역 공공시설 조회</strong></h1>
		                    </div>
		                    <div class="col-sm-1">
		                    	<button type="button" class='btn btn-warning back-btn' onclick="location.href='/Location/map'">지역 재선택</button>
                    		</div>
                    	</div>
                    </div>
                    <!-- ////End panel - heading -->
                    <!-- panel - body -->
					<div class="panel-body">
						<div>
						<!-- Amount Scale -->
							<label for="list-number">한번에 보기</label> 
							<select id="list-number" name="list-number" size="1" >
								<option value="10">10</option>
								<option value="30">30</option>
								<option value="50">50</option>
								<option value="100">100</option>
							</select>
							<!-- ////End Amount Scale -->							
							<!-- Search -->
							<button type="button" class="btn btn-danger" id="btn-search">검색</button>							
							<input class="form-control" id="search-bar" type="text" placeholder="찾는 지역을 입력해주세요.">
							<!-- ////End Search -->
						</div>						
						<!-- List Table -->
						<table class='table table-striped table-bordered table-hover'>
							<thead>
								<tr class="active">
									<td class="col-md-2">지역</td>
									<td class="col-md-4">개방시설명/개방장소명</td>
									<td class="col-md-2">개방시설유형</td>									
									<td class="col-md-1">수용인원</td>									
									<td class="col-md-1">유료유무</td>
									<td class="col-md-2">휴관일</td>
								</tr>
							</thead>
							 <tbody class="table-list"></tbody>
						</table>
						<!-- ////End List Table -->
						<!-- Paging Process -->
						<div class="panel-paging">
						</div>
						<!-- ////End Paging Process -->
						
						<!-- Hidden Form (actionForm) -->
						<form id="actionForm" method="GET" action="">
							<input type='hidden' name='pageNum' id='pageNum' value="<c:out value='${pageMaker.cri.pageNum}'/>">
							<input type='hidden' name='amount' id='amount' value="<c:out value='${pageMaker.cri.amount}'/>">
							<input type='hidden' name='type' id='type' value="<c:out value='${pageMaker.cri.type}'/>">
							<input type='hidden' name='keyword' id='keyword' value="<c:out value='${pageMaker.cri.keyword}'/>">
						</form>
						<!-- ////End Hidden Form (actionForm) -->
                    </div>
				 	<!-- //////////////// panel - body -->
		       </div>
            </div>
		</div>
	</div>
	<!-- ///////////////// Content -container  -->
</div>
<script>
	$(function(){
		var formData={"pageNum":$("#pageNum").val(),"amount":$("#amount").val(),
				"type":$("#type").val(),"keyword":$("#keyword").val()}	
		
		const actionForm=$("#actionForm");
		const output=$(".table-list");

		var Ajax = (function(){
			return{
				//공공시설 List 받아오는 ajax function
				getList:function(formData,callback,error){
					console.log(formData);
					$.ajax({
						type:'POST',
						url:'/Location/ajax/information',
						data:JSON.stringify(formData),
						contentType:"application/json; charset=utf8",
						success:function(data,status,xhr){
							if(callback){
								console.log(data.list);
								callback(data.list,data.pageMaker);
							}
						},
						error:function(xhr,status,err){
							alert("err");
						}
					});
				}
			}
		})();
		
		// 리스트 양 조절
		$("#list-number").change(function(e){
			output.empty();
			actionForm.find("[name='amount']").val($(this).val());
			formData.amount=$("#amount").val();
			console.log(actionForm.find("[name='amount']").val());
			console.log(formData);
			showList();
		});
		
		//검색 기능
		$("#btn-search").on("click",function(e){
			output.empty();
			actionForm.find("[name='keyword']").val($("#search-bar").val());
			formData.keyword=$("#keyword").val();
			console.log(formData);
			console.log($("#keyword").val());
			showList();
		});
		
				
		//Ajax 함수 호출 및 화면에 출력해주는 함수
		function showList(){
			Ajax.getList(formData,function(list,pageMaker){
				var str="";
				var pagination="";
				
				for(var i=0,len=list.length||0;i<len;i++ ){
					str+="<tr><td>"+list[i].provider+"</td>";
					str+="<td><a class='move' href='"+list[i].location_num+"'>"+list[i].name_1+"/"+list[i].name_2+"</a></td>";
					str+="<td>"+list[i].facility_type+"</td>";
					if(list[i].max_person==null){
						str+="<td>-</td>";
					}else{
						str+="<td>"+list[i].max_person+"</td>";
					}
					str+="<td>"+list[i].is_pay+"</td>";
					str+="<td>"+list[i].closed_days+"</td></tr>";
				}
				output.append(str);				
				showLocationPage(pageMaker);
				
			});
		}
		
		//페이징 처리 함수
		function showLocationPage(pageMaker){
			console.log(pageMaker);
			var str="<div class='pull-right'>";
			str+="<ul class='pagination'>";
			if(pageMaker.prev){
				
				str+="<li class='page-item'><a class='page-link' href='"+(pageMaker.startPage-1)+"'>Previous</a></li>";
				
				}
			for(var i=pageMaker.startPage;i<=pageMaker.endPage;i++){
				
				var active =pageMaker.cri.pageNum == i ? "active":"";
				
				str+="<li class='page-item'"+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
				
			}
			if(pageMaker.next){
				str+="<li class='page-item'><a class='page-link' href='"+(pageMaker.endPage+1)+"'>Next</a></li>";
			}
			str+="</ul>";
			
			console.log(str);
			
			$(".panel-paging").html(str);
		}
		
		//상세보기
		$(".table-list").on("click",".move",function(e){
			e.preventDefault();
			console.log($(this).attr("href"));
			actionForm.append("<input type='hidden' name='location_num' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/Location/description");
			actionForm.submit();
		});
		
		//페이징 처리
		$(".panel-paging").on("click","li a",function(e){
			e.preventDefault();
			output.empty();
			actionForm.find("[name='pageNum']").val($(this).attr("href"));
			formData.pageNum=$("#pageNum").val();
			console.log(formData);
			showList();
		});
		
		
		showList();
	});
		
</script>

<!-- footer -->
<jsp:include page="../includes/footer.jsp"/>
