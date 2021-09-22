<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- header -->
<jsp:include page="../includes/head.jsp"/>
    <style>
        .page-header .col-sm-12{border:1px solid #ebecef;}
        .page-header .col-sm-12 h1{margin-left:10px;}
    </style>
    
<jsp:include page="../includes/header.jsp"/>
<div class="content-box container">
    <div class ="pull-right">
	    <button class="btn btn-success">이전페이지로</button>
		<button class="btn btn-warning">다음페이지로</button>
		<button class="btn btn-primary" id="button-a" onclick="location.href='/Board/popular'">목록</button>
	</div>	    
        <!-- Title Head-->
        <div class="page-header">
            <div class="col-sm-12">
	            <h1><strong><c:out value="${list.meet_title}"/></strong></h1>
	            <p style="font-size:1.2em;margin-left:15px;">작성자:<c:out value="${list.meet_writer}"/></p>
	            <div class="col-sm-6">
	            	<div class="pull-left">
	             		<p style="font-size:1em;color:#D5D5D5;padding-top:5px;">작성일:<c:out value="${list.meet_writedate}"/>  조회:<c:out value="${list.meet_count}"/></p>
	            	</div>
	            </div>	
	            <div class="col-sm-6">
	            	<div class="pull-right">
	            		<p style="font-size:1.3em;"><i class="fas fa-comment">댓글 <c:out value="${replyTotalCount}"/></i></p>
	            	</div>
	            </div>	            		                               
            </div>
        </div>
        <!-- // Title Head End-->
        <div class="row content">
            <div class="col-sm-12" style="margin-top:30px;">
                <div class="col-sm-6">
                    <div class="Carousel-image" style="height:400px;">
                        <div class="text-center">                    
                            <p><strong>Carousel 영역</strong></p>  
                        </div>
                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>
                        
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                            <div class="item active">
                                <img src="#" alt="Los Angeles" style="width:100%;">
                            </div>
                        
                            <div class="item">
                                <img src="#" alt="Chicago" style="width:100%;">
                            </div>
                            
                            <div class="item">
                                <img src="#" alt="New york" style="width:100%;">
                            </div>
                            </div>

                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                            </a>
                        </div>                    
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="description" style="padding-top:25px;">
                        <div id="content-box">
                        	<div class="text-center">
								모임 종류:<c:out value="${list.meet_type}"/>
								모집 인원:<c:out value="${list.meet_regulation}"/>	                        	
                        	</div>
                        	<div class="content-text">
                        		<c:out value="${list.meet_content}"/>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 buttonList" style="margin-top:30px;margin-bottom:30px;padding-left:30px;padding-right:30px;">
                	<div class="col-sm-6">
                		<input type="button" class="btn btn-primary" onclick="location.href='/Board/update/${list.meet_num}'" id="update" value="수정">
                		<button id="btn_postDelete" class="btn btn-primary" onclick="deleteForm({'meet_writer':'${sessionScope.userid}','meet_num':'<c:out value='${list.meet_num}'/>'})">게시글 삭제</button>
                		<input type="button" class="btn btn-primary" onclick="location.href='/Board/insert'" id="write" value="글쓰기">
                	</div>
                	<div class="col-sm-6">
	                    <div class="pull-right">
	                    	<button type="button" id="btn-join" class="btn btn-primary" data-toggle="modal" data-target="#joinModal"> 참여하기 </button>
                            <button type="submit" id="btn-delete" class="btn btn-primary" data-toggle="modal" data-target="#deleteModal" value="삭제"> 참여취소 </button>
                            <button id="button-a" class="btn btn-primary" onclick="location.href='/Board/popular'"> 뒤로가기 </button>
	                    </div>
	                    <form name="form" id="form-join" method="post" action="/Board/detail">
							<input type="hidden" name="user_id" id="user_id" value=<c:out value="${sessionScope.userid}"/> readonly>
							<input type="hidden" name="meet_num" id="meet_num" value=<c:out value="${list.meet_num}"/> readonly>
						</form>
                    </div>    
                </div>
            </div>
            <!-- 댓글 작성 영역 -->            
            <div class="row col-sm-12">	                
	        	<div class="comment-list">
				</div>
				<div class="comment-write-head" style="padding-left:40px;border-top:1px solid #ebecef;margin-top:30px;">
					<h4><i class="fas fa-comment"><strong> 댓글</strong></i></h4>
	            </div>
	            <div class="comment-write col-sm-10" style="margin-left:20px;">	                		                	
	            	<textarea class="form-control" rows="3" style="width:920px;margin-bottom:20px; "id='write-content'></textarea>	                			                	
	            </div>
	            <div class="col-sm-1">
	            	<button class="btn btn-primary" style="width:70px;height:70px;margin-right:-80px;" id="reply-writeBtn">작성</button>
	            </div>
             </div>
             <!-- ////댓글 작성 -->
      </div>
		</div>
		<div class="content-box container">
	         <div class="row">
                <div class="Meeting-List">
                    <div class="col-sm-12">
                        <table class="table table-condensed" style="width:94%;margin-left:35px;margin-top:50px;">
				            <thead>
				                <tr>
				                    <th>No.</th>
				                    <th>title</th>
				                    <th>작성자</th>
				                    <th>모집인원</th>
				                    <th>장소</th>
				                    <th>분류</th>
				                </tr>
				            </thead>
				            <tbody>
		                        <c:forEach var="detailList" items="${board}">
		                        <tr>
		                            <td><c:out value="${detailList.meet_num}"></c:out></td>
		                            <td><c:out value="${detailList.meet_title}"></c:out></td>
		                            <td><c:out value="${detailList.meet_writer}"></c:out></td>
		                            <td><c:out value="${detailList.meet_regulation}"></c:out></td>
		                            <td><c:out value="${detailList.meet_location}"></c:out></td>
		                            <td><c:out value="${detailList.meet_type}"></c:out></td>            	
		                        </tr>
						        </c:forEach>
					        </tbody>
				        </table>
			        	<!--  ///페이징 처리 -->
			        	<div class="pull-right">
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
					      
					         <form id="actionForm" method="get" >
					             <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>                         
					         </form>
					    </div>
       					<!--------------------- 페이징-------------------------->
                    </div>
                </div>
            </div>	
       </div>
            <!-- Login Modal -->
			<div class="modal fade" id="joinModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">미팅 참여 확인</h4>
						</div>
						<div class="modal-body">
							<p id="content1"></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade" id="deleteModal" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">미팅 취소 확인</h4>
						</div>
						<div class="modal-body">
							<p id="content2"></p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
						</div>
					</div>
				</div>
			</div>
			</div>
			<!-- ////Login Modal -->
            <!-- Reply Modal -->
            <div class="modal fade" id="replyModal" role="dialog">
                <div class="modal-dialog">                
                    	<!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header">
                            	<h4 class="modal-title">댓글 수정</h4>
                            </div>
                            <div class="modal-body">
                            <div class="form-group">
                                <label>댓글 내용</label>
                                <textarea class="form-control" rows="3" name="modal-reply-content"></textarea>
                                <input type='hidden' name='reply-no' id='reply-no'>
                            </div>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" name="reply-modalBtn">수정</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" name="reply-closeBtn">취소</button>
                            </div>
                        </div>
                </div>
            </div>
            <!-- ////Reply Modal -->
            

<jsp:include page="../includes/footer.jsp"/>
<script>

	// 게시글 삭제 javascript 처리
	function deleteForm(params) {
		var form = document.createElement('form');
		form.setAttribute("id", 'form-Delete');
		form.setAttribute("method", 'POST');
	    form.setAttribute("action", '/Board/postDelete');
	    for(var key in params) {
	    	var hidden = document.createElement('input');
			hidden.setAttribute('type', 'hidden');
			hidden.setAttribute('name', key);
			hidden.setAttribute('value', params[key]);
			form.appendChild(hidden);
	    }
	    console.log(form);
	    document.body.appendChild(form);
	    $("#form-Delete").submit();
	}
    $(function() {
        var actionForm = $("#actionForm");
        //////////////페이징 버튼////////////////
            $(".paginate_button a").on("click", function(e) {
            e.preventDefault();  //전송을 막음
            console.log('click');
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
            });
        
        $("tbody tr").on("click", function() {
            var num = $(this).children().eq(0).text();
            // console.log(num);
            $(location).attr('href', "/Board/detail/"+num);
        });

        $("#modalBtn").on("click", function() {
            alert("확인 되었습니다.");
            $(location).attr('href', "/Board/popular");
        });
        
        var bno = '<c:out value="${list.meet_num}" />';
        $.getJSON("/Board/getAttachList", {no:bno}, function(arr) {
            /* 종합 var 처리 */
            var str_control ="";
            var str_inner = "";
            var carousel_control = $(".carousel-indicators");
            var carousel = $(".carousel-inner");
            /* //종합 var 처리 */
            $(arr).each(function(i, attach) {
                if(attach.file_type){
                    if(i == 0){
                        str_control += '<li data-target="#myCarousel" data-slide-to="0" class="active"></li>';
                        var fileCallPath = encodeURIComponent(attach.upload_path + "/" + attach.uuid + "_" + attach.file_name);
                        str_inner += " 	<div class='item active' data-path='" + attach.upload_path + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.file_name + "' data-filetype='" + attach.file_type + "'>";
                        str_inner += " 		<img src='/Board/display?fileName=" + fileCallPath + "'>";
                        str_inner += " 	</div>";
                    } else {
                        str_control += '<li data-target="#myCarousel" data-slide-to="'+i+'"></li>';
                        var fileCallPath = encodeURIComponent(attach.upload_path + "/" + attach.uuid + "_" + attach.file_name);
                        str_inner += " 	<div class='item' data-path='" + attach.upload_path + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.file_name + "' data-filetype='" + attach.file_type + "'>";
                        str_inner += " 		<img src='/Board/display?fileName=" + fileCallPath + "'>";
                        str_inner += " 	</div>";
                    }
                } else {
                    str_control += '<li data-target="#myCarousel" data-slide-to="0" class="active"></li>';
                    var fileCallPath = encodeURIComponent(attach.upload_path + "/" + attach.uuid + "_" + attach.file_name);
                    str_inner += " 	<div class='active' data-path='" + attach.upload_path + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.file_name + "' data-filetype='" + attach.file_type + "'>";
                    str_inner += " 		<span>" + attach.file_name + "</span><br/>";
                    str_inner += " 		<img src='https://dummyimage.com/450x300/dee2e6/6c757d.jpg' style='width:100%; height:300px'>";
                    str_inner += " 	</div>";
                }
            });
            carousel_control.html(str_control);
            carousel.html(str_inner);
        });
        //ajax 처리 모듈
        var replyAjax=(function(){
            return{
                getReplyList : function(param,callback,error){
                    var meet_num = param.meet_num;
                    $.getJSON("/Board/ajax/getReplyList/"+meet_num+".json",
                        function(list){
                            if(callback){
                                callback(list);
                            }
                        }).fail(function(xhr ,status,err){
                            alert("Server_error");
                        });
                    },
                    writeReply : function(formData,callback,error){
        	            $.ajax({
        	                type:'POST',
        	                url:'/Board/ajax/writeReply',
        	                contentType:"application/json; charset=utf-8",
        	                data:JSON.stringify(formData),
        	                success:function(result,status,xhr){
        	                    if(callback){
        	                        callback(result);
        	                    }
        	                },
        	                error:function(xhr,status,err){
        	                    alert("SERVER_ERROR");
        	                }
        	            });
                    },
                    deleteReply : function(reply,callback,error){
                    	$.ajax({
                    		type:'DELETE',
                    		url:'/Board/ajax/deleteReply',
                    		contentType:"application/json; charset=utf-8",
                    		data:JSON.stringify(reply),
                    		success:function(result,status,xhr){
                    			if(callback){
                    				callback(result);
                    			}
                    		},
                    		error:function(xhr,status,err){
                    			alert("DELETE_SERVER_ERROR");
                    		}
                    	});
                    },
                    modifyReply : function(reply,callback,error){
                    	$.ajax({
                    		type:'PATCH',
                    		url:'/Board/ajax/modifyReply',
                    		contentType:"application/json; charset=utf-8",
                    		data:JSON.stringify(reply),
                    		success:function(result,status,xhr){
                    			if(callback){
                    				callback(result);
                    			}
                    		},
                    		error:function(xhr,status,err){
                    			alert("UPDATE_SERVER_ERROR");
                    		}
                    	});
                    }
            }
        })();
        
        //댓글 출력 function
        replyOutput=$(".comment-list");
        var meetNumValue="${list.meet_num}";
        console.log(meetNumValue);
        function replyList(){
        	replyAjax.getReplyList({"meet_num":meetNumValue},function(list){        		
        		var str="";
        		
        		for(var i=0,len=list.length;i<len;i++){
        			//댓글 출력위치
        			str+="<div class='comment-box' style='width:95%; margin-left:30px;'>";
        			str+="<div class='comment-nick-box'>";
        			str+="<span><b>"+list[i].user_id+"</b></span></div>";
        			str+="<div class='comment-text-box'>";
        			str+="<span><b>"+list[i].reply_content+"</b></span></div>";
        			str+="<div class='comment-info-box'>";
        			str+="<span><b>"+list[i].reply_date+"</b><span></div>";        			
        			// 수정 및 삭제 드롭다운 버튼
        			str+="<div class='comment-tool'><div class='dropdown'>";
        			str+="<a class='dropdown-toggle' data-toggle='dropdown'><i class='fas fa-ellipsis-v'></i></a>";
        			str+="<ul class='dropdown-menu dropdown-menu-right'><li><a data-reply='"+list[i].reply_content+"' data-replyno='"+list[i].reply_no+"' data-target='#replyModal' data-toggle='modal' class='update-replyBtn'><b>수정</b></a></li>";
        			str+="<li><a data-reply='"+list[i].reply_no+"' class='delete-replyBtn' ><b>삭제</b></a></li></ul></div></div></div>";
        		}
        		replyOutput.append(str);
        	});
        }
        replyList();
       
        //댓글 작성 동작
        var replyWriteBtn=$("#reply-writeBtn");
        var replyContent=$("#write-content");
       	replyWriteBtn.on("click",function(e){
       		if(replyContent.val()==''){
       			alert("내용을 입력하여 주세요!");
       		}else{
       			var formData={"meet_num":meetNumValue,"user_id":"asdasd","reply_content":replyContent.val()};
       			console.log(formData);
       			replyAjax.writeReply(formData,function(result){
       				alert(result);
       				replyOutput.empty();
       				replyList();
       				replyContent.val("");
       			});
       		}
       	});
       	//댓글 삭제 동작
       	var commentList=$(".comment-list");
       	commentList.on("click",".delete-replyBtn",function(e){
       		e.preventDefault();
       		console.log($(this).data("reply"));
       		var replyData={"meet_num":meetNumValue,"reply_no":$(this).data("reply")};
       		var conResult=confirm("코멘트를 삭제하시겠습니까?");
       		if(conResult){
       			replyAjax.deleteReply(replyData,function(result){
       				alert(result);
       				replyOutput.empty();
       				replyList();
       			});
       		}
       	});
       	//댓글창 드롭다운 '수정'클릭시 모달창 PopUp 
       	var modalReply=$("#replyModal");
       	commentList.on("click",".update-replyBtn",function(e){
       		e.preventDefault();
       		console.log($(this).data("reply"));
       		//replyContent.html($(this).data("reply")).focus();
       		modalReply.find("textarea[name='modal-reply-content']").val($(this).data("reply"));
       		modalReply.find("input[name='reply-no']").val($(this).data("replyno"));
       	});
       	//댓글 수정 모달 취소 눌렀을때 동작
       	var replyCloseBtn=modalReply.find("button[name=reply-closeBtn]");
       	replyCloseBtn.on("click",function(e){
       		console.log("댓글수정 취소버튼 동작");
       		modalReply.find("textarea[name='modal-reply-content']").val("");
       		modalReply.find("input[name='reply-no']").val("");
       	});
       	//댓글 수정 이벤트
       	var replyModalBtn=modalReply.find("button[name='reply-modalBtn']");
       	replyModalBtn.on("click",function(e){
       		console.log("댓글수정 전송버튼 클릭");
       		var modalReplyContent=modalReply.find("textarea[name='modal-reply-content']").val();
       		var replyModalNo=modalReply.find("input[name='reply-no']").val();
       		console.log(modalReplyContent+"/"+replyModalNo);
       		var replyData={"meet_num":meetNumValue,"reply_no":modalReply.find("input[name='reply-no']").val(),"reply_content":modalReplyContent};
       		console.log(replyData);
       		replyAjax.modifyReply(replyData,function(result){
       			alert(result);
       			replyOutput.empty();
       			replyList();
       			modalReply.find("textarea").val("");
       		});
       	});
       	
       	$("#btn-join").on("click", function(e){
         	var meetNum = "<c:out value='${list.meet_num}'/>";
         	var userID = "<c:out value='${sessionScope.userid}'/>";
         	var params = {
         	   meet_num : meetNum,
         	   user_id : userID
         	};
         	//console.log(params);
         	$.ajax({
         	   type: "post",
         	   url:'/Board/selectcheck',
         	   data:JSON.stringify(params),
         	   contentType:'application/json; charset=utf8',
         	   success:function(data){
         	      if(data == "true"){
         	    	$("#form-join").submit();
         	    	$("#content1").html("참여가 확인되었습니다.");
         	    	$("#myModal").modal("show");
         	    	
         	      }else{
         	    	  $("#content1").html("이미 참여한 모임입니다.");
         	    	  $("#myModal").modal("show");
         	      }
         	      
         	   }
         	});
      	});

    	$("#btn-delete").on("click", function(e) {
    		var meetNum = "<c:out value='${list.meet_num}'/>";
    		var userID = "<c:out value='${sessionScope.userid}'/>";
    		var params = {
    			meet_num : meetNum,
    			user_id : userID
    		};
    		//console.log(params);
    		$.ajax({
    			type : "post",
    			url : '/Board/selectcheck',
    			data : JSON.stringify(params),
    			contentType : 'application/json; charset=utf8',
    			success : function(data) {
    				if (data == "true") {
    					$("#content2").html("참여 안한 모임입니다.");
    					$("#myModal").modal("show");
    					
    				} else {
    					$("#form-join").attr("action","/Board/delete").submit();
    					$("#content2").html("참여 취소되었습니다.");
    					$("#myModal").modal("show");
    				}

    			}
    		});
    	});
    });
</script>
