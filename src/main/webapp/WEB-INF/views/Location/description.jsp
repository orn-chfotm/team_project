<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- header -->
<jsp:include page="../includes/head.jsp"/>
<head>
 <style>
    h3{
    	margin-bottom:30px;
    }
    #kakaomap{
    	width: 100%;
    	height:523px;
    }
  </style>
</head>
<jsp:include page="../includes/small-header.jsp"/>

<!-- 컨텐츠 내용 -->
<div class="content-box container">
  <div class="row content">
  	<div class="col-sm-12 text-center">
  		<h1><strong>시설 상세정보</strong></h1>
  	</div>
  	<div class="col-sm-6 text-center">
  		<h3>지도로 위치보기</h3>
		<div id="kakaomap"></div>		
	  	<ul class="nav nav-pills nav-justified" style="margin-top:20px;">
		    <li class="active"><a data-toggle="tab" href="#home">유의사항</a></li>
		    <li><a data-toggle="tab" href="#menu1" class="reply-menu">이용후기</a></li>
	  	</ul>
    	
    </div>  
    <div class="col-sm-6">
    	<div class="col-sm-100 text-center">
    	<h3>시설 상세정보</h3>
    	</div>
    	<div class="col-sm-4">
    		<ul class="list-group">
				<li class="list-group-item list-group-item-success"><strong>장소</strong></li>
				<li class="list-group-item list-group-item-success"><strong>장소유형</strong></li>
				<li class="list-group-item list-group-item-success"><strong>제공</strong></li>
				<li class="list-group-item list-group-item-success"><strong>장소면적</strong></li>
				<li class="list-group-item list-group-item-success"><strong>최대사용 인원</strong></li>
				<li class="list-group-item list-group-item-success"><strong>휴관일</strong></li>
				<li class="list-group-item list-group-item-success"><strong>대여료</strong></li>		
				<li class="list-group-item list-group-item-success"><strong>평일 이용가능시간</strong></li>
				<li class="list-group-item list-group-item-success"><strong>주말 이용가능시간</strong></li>
				<li class="list-group-item list-group-item-success"><strong>신청기간</strong></li>
				<li class="list-group-item list-group-item-success"><strong>예약방법</strong></li>
				<li class="list-group-item list-group-item-success"><strong>홈페이지링크</strong></li>
				<li class="list-group-item list-group-item-danger"><strong>문의전화</strong></li>	
			</ul>				
		</div>
		<div class="col-sm-8">
			<ul class="list-group">
				<li class="list-group-item list-group-item-default">▷ ${getLocation.name_1}</li>
				<li class="list-group-item list-group-item-default">▷ ${getLocation.facility_type}</li>
				<li class="list-group-item list-group-item-default">▷ ${getLocation.provider}</li>
				<li class="list-group-item list-group-item-default">▷ ${getLocation.space_area}m</li>
				<li class="list-group-item list-group-item-default">▷ ${getLocation.max_person}</li>
				<li class="list-group-item list-group-item-default">▷ ${getLocation.closed_days}</li>
				<li class="list-group-item list-group-item-default">▷ ${getLocation.fee}</li>
				<li class="list-group-item list-group-item-default">▷ ${getLocation.weekdays_open}~${getLocation.weekdays_closed}</li>
				<li class="list-group-item list-group-item-default">▷ ${getLocation.weekend_open}~${getLocation.weekend_closed}</li>
				<li class="list-group-item list-group-item-default">▷ ${getLocation.use_time}</li>
				<li class="list-group-item list-group-item-default">▷ ${getLocation.apply_way}</li>
				<li class="list-group-item list-group-item-default"><a class="url" href="${getLocation.home_page}">바로가기</a></li>
				<li class="list-group-item list-group-item-default">▷ ${getLocation.phone_num}</li>
			</ul>			
		</div>
		<div class="row">
			<div class="col-sm-12">
				<div class="col-sm-6 oper-btn">
					<button type="button" class="btn btn-danger btn-list">목록으로</button>
					<!-- <button type="button" class="btn btn-info">예약하기</button> -->
		    	</div>
			</div>	  
    	</div>

    	<form id="actionForm" method="GET" action="">
    		<input type="hidden" value="${pageMaker.cri.pageNum}" name='pageNum'>
    		<input type="hidden" value="${pageMaker.cri.amount}" name='amount'>
    		<input type='hidden' value='${pageMaker.cri.type}' name='type'>
    		<input type='hidden' value='${pageMaker.cri.keyword}' name='keyword'>
    	</form>
    </div>
   	<div class="row">
   		<div class="col-sm-12">
   			<div class="tab-content" style="margin-top:50px; margin-left:30px;">
   				<hr>
			    <div id="home" class="tab-pane fade in active">
			      <h2><strong>※필수 준수사항</strong></h2><br>
					<p>모든 서비스의 이용은 담당 기관의 규정에 따릅니다. 각 시설의 규정 및 허가조건을 반드시 준수하여야 합니다.</p>
					<p>각 관리기관의 시설물과 부대시설을 이용함에 있어 담당자들과 협의 후 사용합니다.</p>
					<p>각 관리기관의 사고 발생시 서울시청에서는 어떠한 책임도 지지않습니다.<p>
					<p>시설이용료 납부는 각 관리기관에서 규정에 준합니다.</p>
					<p>본 사이트와 각 관리기관의 규정을 위반할 시에는 시설이용 취소 및 시설이용 불허의 조치를 취할 수 있습니다.</p>
					<p>접수 시간을 기준으로 브라우저에서 새로고침을 하면 변경된 정보를 볼 수 있습니다.</p><br>
					<h2><strong>※주의사항</strong></h2><br>			
					<p>❍ 사용허가 제외 및 취소대상</p>
					<p>- 시설 및 설비 등을 훼손할 우려가 있는 행사</p>
					<p>- 정치적인 행위 또는 종교 활동을 목적으로 하는 경우</p>
					<p>- 영리를 목적으로 하는 경우</p>
					<p>- 기타 공공질서와 선량한 풍속을 해할 우려가 있다고 인정되는 경우</p>
					<p>- 사용 목적을 위반하는 경우</p>
					<p>- 다른 시민의 안전유지를 위해 사용을 제한할 필요가 있다고 인정할 경우</p>
					<p>- 행위의 제한</p>
					<p>· 흡연, 음주 또는 취식 행위</p>
					<p>· 관리자의 허가 없는 촬영 행위</p>
					<p>· 고성 및 난무 등 다른 시민에게 지장을 주는 행위</p>
			      </div>
					<div id="menu1" class="tab-pane fade">
						<div class="row">
							<div class="col-sm-7">
								<h3>
									<strong>Comment List</strong>
								</h3>
								<div class="pull-right"></div>
							</div>
							<div class="col-sm-5">
								<div class="pull-right">
									<button type="button" class="btn btn-warning"
										data-toggle="modal" data-target="#myModal" id="replyBtn"
										style="margin-top: 20px;">코멘트 등록</button>
								</div>
							</div>
						</div>
						<div class="row reply"
							style="width: 99%; float: none; margin-right: 7px auto;">
							<div class="comment-list"></div>
							<div class="paging" style="margin-top: -40px;"></div>
						</div>
					</div>
				</div>
 			 <!-- Modal -->
		  <div class="modal fade" id="myModal" role="dialog">
		    <div class="modal-dialog">			    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title"></h4>
		        </div>
		        <div class="modal-body">
		        	<div class="form-group">
			          <p>내용</p>
			          <textarea class="form-control" cols="2" name="reply-comment"></textarea>
			          <input type='hidden' name='reply-num'>
		          	</div>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-primary" name='btn-write' id="reply-write">Write</button>
		          <button type="button" class="btn btn-warning" name='btn-modify' id="reply-modify">Modify</button>
		          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        </div>
		      </div>  
		   		</div>
		   	</div> 
		   	<!-- ////Modal -->
		</div>
	</div>
			
	</div>
</div>
 	<script>
 		$(function(){
 			var modal=$("#myModal");
 			var inputReply=modal.find("textarea[name='reply-comment']");
 			var locationValue="${getLocation.location_num}";
 			console.log(locationValue);
 			//코멘트 ajax 전송 함수 모듈
 			var ReplyAjax = (function(){
 				return{
 					getReplyList:function(param,callback,error){ 						
 						var location_num = param.location_num;
 						var page = param.page;
 						$.getJSON("/Location/ajax/getReplyList/"+location_num+"/"+page+".json",
 								function(data){
 								console.log("data.replyCnt: "+data.replyCnt);
 								console.log(data.list);
 								if(callback){
 									callback(data.replyCnt,data.list);
 								}
 						}).fail(function(xhr,status,err){
 							alert("INTERNAL_SERVER_ERROR");
 						});
 					},
 					writeReply:function(reply,callback,error){
 						$.ajax({
 							type:'POST',
 							url:"/Location/ajax/writeReply",
 							data:JSON.stringify(reply),
 							contentType:"application/json; charset=utf-8",
 							success:function(result,status,xhr){
 								if(callback){
 									callback(result);
 								}
 							},
 							error:function(xhr,status,err){
 								alert("INTERNAL_SERVER_ERROR");
 							}
 						});
 					},
 					deleteReply:function(reply,callback,error){
 						$.ajax({
 							type:'DELETE',
 							url:"/Location/ajax/deleteReply",
 							data:JSON.stringify(reply),
 							contentType:"application/json; charset=utf-8",
 							success:function(result,status,xhr){
 								if(callback){
 									callback(result);
 								}
 							},
 							error:function(xhr,status,error){
 								alert("INTENAL_SERVER_ERROR");
 							}
 						});
 					},
 					modifyReply:function(reply,callback,error){
 						$.ajax({
 							type:'PUT',
 							url:"/Location/ajax/modifyReply",
 							data:JSON.stringify(reply),
 							contentType:"application/json; charset=utf-8",
 							success:function(result,status,xhr){
 								if(callback){
 									callback(result);
 								}
 							},
 							error:function(xhrstatus,err){
 								alert("INTERNAL_SERVER_ERROR");
 							}
 						});
 					}
 				}
 			})();//End 코멘트 ajax 전송함수 
 			
 			const actionForm=$("#actionForm");
 			//이전페이지로 돌아가기
 			$(".btn-list").on("click",function(e){
 				actionForm.attr("action","/Location/information");
 				actionForm.submit();
 			});
 			//홈페이지 링크 없을때, 하이퍼 링크 삭제
 			if($(".url").attr("href")==""){
 				$(".url").parent().html("▷ 없음");
 			}
 			//nav-pills 댓글 목록 클릭시 댓글 목록 출력
 			$(".reply-menu").on("click",function(e){
 				replyList(1);
 			});
 			//댓글 리스트 출력 function
	 		function replyList(page){
				ReplyAjax.getReplyList({"location_num":locationValue,"page":page||1},function(replyCnt,list){
					if(page==-1){
						pageNum = Math.ceil(replyCnt/10.0);
						replyList(pageNum);
						return;
					}					
					var str="";					
					if(list==null||list.length==0){
						return;
					}					
					for(var i=0,len=list.length;i<len;i++){
						//댓글 출력위치
						str+="<div class='comment-box'>";
						str+="<div class='comment-nick-box'>";
						str+="<span><b>"+list[i].user_id+"</b></span></div>";
						str+="<div class='comment-text-box'>";
						str+="<span><b>"+list[i].reply_content+"</b></span></div>";
						str+="<div class='comment-info-box'>";
						str+="<span><b>"+list[i].regdate+"</b><span></div>";        			
						// 수정 및 삭제 드롭다운 버튼
						str+="<div class='comment-tool'><div class='dropdown'>";
						str+="<a class='dropdown-toggle' data-toggle='dropdown'><i class='fas fa-ellipsis-v'></i></a>";
						str+="<ul class='dropdown-menu dropdown-menu-right'><li><a data-reply='"+list[i].reply_content+"' data-replyno='"+list[i].reply_num+"' data-target='#myModal' data-toggle='modal' class='update'><b>수정</b></a></li>";
						str+="<li><a data-reply='"+list[i].reply_num+"' class='delete' ><b>삭제</b></a></li></ul></div></div></div>";
					}
					$(".comment-list").html(str);
					
					showReplyPage(replyCnt);
					//후기 작성이 없을 경우 출력됨
					/*
					if($(".reply-content").html()==''){
	 					$(".reply-content").append("작성된 후기가 없습니다. 작성후기를 작성해주세요!").css("color","green").css("text-align","center").css("display","block").css("margin-top","30px");	
	 				}
					*/
				});
 			}
 	 			var pageNum = 1;
			    var replyPageFooter = $(".paging");
			    
			    // 댓글 페이지 List 출력 function
			    function showReplyPage(replyCnt){
			      console.log("replyCnt:"+replyCnt);
			      var endNum = Math.ceil(pageNum / 10.0) * 10;  
			      var startNum = endNum - 9; 
			      
			      var prev = startNum != 1;
			      var next = false;
			      
			      if(endNum * 10 >= replyCnt){
			        endNum = Math.ceil(replyCnt/10.0);
			      }
			      
			      if(endNum * 10 < replyCnt){
			        next = true;
			      }
			      
			      var str = "<ul class='pagination pull-right'>";
			      
			      if(prev){
			        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
			      }
			      			       			      
			      for(var i = startNum ; i <= endNum; i++){
			        
			        var active = pageNum == i? "active":"";
			        
			        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			      }
			      
			      if(next){
			        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
			      }
			      
			      str += "</ul>";
			      
			      console.log(str);
			      
			      replyPageFooter.html(str);
			    }
			    
			  	//페이징 delegate
			    replyPageFooter.on("click","li a", function(e){
			        e.preventDefault();
			        console.log("page click");
			        
			        var targetPageNum = $(this).attr("href");
			        
			        console.log("targetPageNum: " + targetPageNum);
			        
			        pageNum = targetPageNum;
			        
			        replyList(pageNum);
			      }); 
			  	
 			//댓글 작성 버튼 클릭시 modal open
 			$("#replyBtn").on("click",function(e){
				$(".modal-title").html("Write Comment");
				modal.find("textarea").val("");
				modal.find("input").val("");
				modal.find("button[name='btn-write']").css("display","inline");
				modal.find("button[name='btn-modify']").css("display","none");
 			});
 			
 			var commentList=$(".comment-list");
 			
 			//수정 버튼 클릭시 모달창으로 데이터 이동
 	       	commentList.on("click",".update",function(e){
 	       		e.preventDefault();
 	       		modal.find("input").val("");
 	       		$(".modal-title").html("Modify Comment");
 	       		modal.find("textarea[name='reply-comment']").val($(this).data("reply"));
 	       		modal.find("input[name='reply-num']").val($(this).data("replyno"));
 	       		console.log(modal.find("textarea[name='reply-comment']").val()+"/"+modal.find("input[name='reply-num']").val());
				modal.find("button[name='btn-write']").css("display","none");
				modal.find("button[name='btn-modify']").css("display","inline");				
 	       	});
 			
 			
 			//modal 에서 수정완료 버튼 클릭시 ajax modify 동작
 			$("#reply-modify").on("click",function(e){
 				console.log(modal.find("input[name='reply_num']").val());
 				var reply={"user_id":"asdasd","location_num":locationValue,"reply_num":modal.find("input[name='reply-num']").val(),"reply_content":inputReply.val()};
 				console.log("Modify Reply!");
 				ReplyAjax.modifyReply(reply,function(result){
 					alert(result);
 					modal.find("textarea").val("");
 					modal.modal("hide");
 					$(".reply-content").empty();
 					replyList(pageNum);
 				});
 			});
 			//modal에서 댓글 작성 완료 버튼 클릭시 ajax insert 동작
 			$("#reply-write").on("click",function(e){
 				var reply={"user_id":"asdasd","location_num":locationValue,"reply_content":inputReply.val()};
 				console.log("write Reply:"+reply);
 				ReplyAjax.writeReply(reply,function(result){
 					alert(result);
 					modal.find("input").val("");
 					modal.modal("hide");
 					$(".reply-content").empty();
 					replyList(-1);
 				});
 			});
 			//댓글 삭제 버튼 클릭시 위임 후 ajax delete 동작
 	       	commentList.on("click",".delete",function(e){
 	       		e.preventDefault();
 	       		console.log($(this).data("reply"));
 	       		var reply={"location_num":locationValue,"reply_num":$(this).data("reply")};
 	       		var conResult=confirm("해당 코멘트를 삭제하시겠습니까?");
 	       		if(conResult){
 	       			ReplyAjax.deleteReply(reply,function(result){
 	       				alert(result);
 	       				$("reply-content").empty();
 	       				replyList(pageNum);
 	       			});
 	       		}
 	       	});

 		});
 	</script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1ad7154847fa73627454f8d52c2a78a2"></script>
	<script> 
		var latitude = "${getLocation.latitude}";
		var longtitude = "${getLocation.longtitude}";
	    var mapContainer = document.getElementById('kakaomap'), // 지도를 표시할 div 
	     mapOption = { 
	            center: new daum.maps.LatLng(latitude, longtitude), // 지도의 중심좌표
	            level: 3 // 지도의 확대 레벨
	        };
	
	    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	    // 마커가 표시될 위치입니다 
	    var markerPosition  = new daum.maps.LatLng(latitude, longtitude); 
	
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        position: markerPosition
	    });
	
	    // 마커가 지도 위에 표시되도록 설정합니다
	    marker.setMap(map);
	
	</script>
<!-- footer -->
<jsp:include page="../includes/footer.jsp"/>

