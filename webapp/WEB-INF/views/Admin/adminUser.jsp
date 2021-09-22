<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
    <title>Admin</title>
    <style>
    	.float-right{
    		float: right;
    	}
    </style>
</head>
<body>
	<!-- Head - Nav  -->
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" style="color: white;" href="/Admin/adminHome">관리자페이지</a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
				<li class="nav-item"><a class="navbar-brand" href="/index">홈페이지</a>
				</li>
				<li><a href="/Admin/adminHome"><i
						class="fas fa-home fa-lg"></i></a></li>
				<li class="active"><a href="/Admin/adminUser">회원관리</a></li>
				<li><a href="/Admin/adminManager">관리자 관리</a></li>
			</ul>
          </div>
        </div>
      </nav>
	<!-- ///////////////////// Head - Nav  -->
	<!-- Content -container  -->
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
	            <div class="panel panel-default">
	            	<!-- panel - head -->
	            	<div class="panel-heading">
	                    User List Page
                    </div>
                    <!-- ////////////// panel - head -->
                    <!-- panel - body -->
					<div class="panel-body">
						<div>
							<label for="list-number">User List 개수</label> 
							<select id="list-number" name="list-number" size="1" >
								<option value="10" <c:out value='${pageMaker.cri.amount eq "10" ? "selected":""}'/>>10</option>
								<option value="30" <c:out value='${pageMaker.cri.amount eq "30" ? "selected":""}'/>>30</option>
								<option value="50" <c:out value='${pageMaker.cri.amount eq "50" ? "selected":""}'/>>50</option>
								<option value="100" <c:out value='${pageMaker.cri.amount eq "100" ? "selected":""}'/>>100</option>
							</select>
						</div>
						<table class='table table-striped table-bordered table-hover'>
							<thead>
								<tr class="active">
									<th>선택</th>
									<th>ID</th>
									<th>NAME</th>
									<th>GENDER</th>
									<th>BIRTH</th>
									<th>LOCATION</th>
									<th>HOBBY</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
						<div class="pull-right">
							<input id="btn-delete" class="btn btn-info float-right" type="button" value="삭제">
						</div>
					</div>
					<!-- paging -->
					<div id="paging">
                    	<!-- //////////////// paging -->
                    </div>
				 	<!-- //////////////// panel - body -->
		       </div>
            </div>
		</div>
	</div>
	<!-- ///////////////// Content -container  -->
</body>
<script>
	var Ajax =(function(){
		return{
			// 아래의 함수에서 보내주는 page 번호와 amount 는 param 안에 function 부분은 callback 
			getList : function(param, callback, error){
				// page 번호와 amount를 param 에서 꺼낸다.
				var page = param.page || 1;
				var amount = param.amount || 10;
				
				$.ajax({
					// Ajax 설정 type, url (보내는 곳 Controller의 맵핑), data(내가 보내는 데이터의 형식), contentType(내가 받을 데이터의 형식)
					type:'get',
					url:'/Admin/adminUser/' + page + '/' + amount,
					contentType:'application/json; charset=utf-8',
					// Ajax가 성공적으로 실행된 경우
					success:function(userList, status, xhr){
						callback(userList.userList)
					},
					// Ajax 실행에서 error 가 발생한 경우
					error:function(xhr,status, er){
						
					}
				});
			},
			getPages : function(param, callback, error){
				var page = param.page || 1;
				var amount = param.amount || 10;
				$.ajax({
					// Ajax 설정 type, url (보내는 곳 Controller의 맵핑), data(내가 보내는 데이터의 형식), contentType(내가 받을 데이터의 형식)
					type:'get',
					url:'/Admin/userListPages/' + page + '/' + amount,
					contentType:'application/json; charset=utf-8',
					// Ajax가 성공적으로 실행된 경우
					success:function(pages, status, xhr){
						callback(pages);
					},
					// Ajax 실행에서 error 가 발생한 경우
					error:function(xhr,status, er){
						
					}
				});
			},
			deleteUser:function(data, callback, error){
			//console.log(data);
				$.ajax({
					// Ajax 설정
					type:'delete',
					url:'/Admin/deleteUser',
					// data JSON 문자열화
					data:JSON.stringify(data),
					contentType:'application/json; charset=utf8',
					// HttpStatus.OK 시 
					success:function(result,status, xhr){
					  callback(result);
					},
					// HttpStatus ERROR 시
					error:function(status,er,xhr){
					  //에러 처리
					}
				});
			}
		}
	})();

	$(document).ready(function(){
		
		var amount = $("#list-number").val();
		var table = $(".table tbody");
		
		UserList(1);
		
		function UserList(page,amount){
			Ajax.getList({page:page||1,amount:amount||10}, function(userList){
				// table 을 초기화 시킨다.
				table.empty();
				var str = "";
				
				// forEach() 각 행의 정보를 data로, 번호를 index로  -> index, data 순서가 jQuery each 와 반대
				// forEach() 순서가 다름
				userList.forEach(function(data, i){
					str+="<tr>";
					str+="<td><input type='checkbox'></td>";
					str+="	<td>"+data.user_id+"</td>";
					str+="	<td>"+data.user_name+"</td>";
					str+="	<td>"+data.user_gender+"</td>";
					str+="	<td>"+data.user_birth+"</td>";
					str+="	<td>"+data.user_location+"</td>";
					str+="	<td>"+data.hobby+"</td>";
					str+="</tr>" ;
				}); 
				
				// ************* 위의 3가지 방식의 javascript 에서 반복문을 돌리는 방식들 ************ 모두 다 같은 기능
				
				// 반복문 실행 후 str 에 들어있는 html 문을 table 에 append 시켜준다.
				table.append(str);
				// table 아래 페이징 처리를 위한 pages 함수 호츌 현재 page(현재 보는 페이지 번호), amount(한 페이지에 보는 글의 개수)의 정보를 가져간다.
				pages(page,amount);
			});
		} 
		// paging 처리를 출력한 부분을 지정
		var pagination = $("#paging");
		// pages 함수 parameter 로 page와 amount 를 받는다.
		function pages(page,amount){
							// page 값이  지정된 경우는 지정된 값, 지정되지 않을 경우는 1
							// amount 값이  지정된 경우는 지정된 값, 지정되지 않을 경우는 10
							// 기본값을 지정해 주는 부분 -> {page:page||1,amount:amount||10}
			Ajax.getPages({page:page||1,amount:amount||10}, function(pages){
				// Ajax success 일 경우 실행 되는 함수
				// 아래 부분은 page 번호를 구하기 위한 수식이다.
				
				var pageNum = pages.cri.pageNum;
				var endNum = pages.endPage;  
				var startNum = pages.startPage; 
				
				var prev = pages.prev;
				var next = pages.next;
				
				
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
				
				str += "</ul></div>";
				
				
				pagination.html(str);
			});
		}
		$("#btn-delete").on("click", function(e){
			// checkbox 가 클릭된 테이블을 행을 가져온다.
			var checkbox = $("input[type=checkbox]:checked");
			// adminid 값을 배열로 저장하여 보내주기 위한 배열 선언
			var deletedata={user_id:[]}; 
			// checkbox가 클릭된 행을 한 행씩 each(반복문)을 실행한다.
			checkbox.each(function(i){
				// chrome 에서 개발자 도구(F12)를 눌러서 확인해보세요.
				// check 박스가 클릭한 한행을 가져와서 체크박스 위치를 기준으로 부모 -> 부모 -> 를 선택한다 -> <tr> 
				var tr = checkbox.parent().parent().eq(i);
				// tr의 자식 <td> td 에 저장
				var td = tr.children();
				// td 중에서 인덱스 0 번째 값을 가져온다. -> adminid
				var userid = td.eq(1).text();
				// 배열에 adminid 를 넣어준다.
				deletedata.user_id.push(userid);
				
				//checkbox 가 check 된 수만큼 반복
				});
				console.log(deletedata);
				// Ajax 호출 - Ajax data 로 배열값만 보내준다.
				Ajax.deleteUser(deletedata,function(result){
					alert(result);
					UserList();
			  	}); 	
		});
		// page 번호를 눌렀을 경우 실행 되는 함수, 
		// 누른 부분의 번호 값을 가져와서 UserList(page,amount) 함수를 실행시킨다.
		pagination.on("click","li a", function(e){
			e.preventDefault();
			console.log("page click");
			
			var targetPageNum = $(this).attr("href");
			
			console.log("targetPageNum: " + targetPageNum);
			
			pageNum = targetPageNum;
			
			// 기본값을 지정했기때문에 page 번호만 넘어가도 가능 -> user 목록을 구하는 Ajax를 실행시킨다.
			UserList(pageNum);
		}); 
		
		// 한 페이지의 글의 수를 변경시에 실행되는 함수
		$("#list-number").on("change",function(e) {
			//변경된 값을 구한다.
			var amount = parseInt($(this).val());
			// 페이지는  1 페이지, amount 는 변경된 값으로 다시 UserList -> user 목록을 구하는 Ajax를 실행시킨다.
			UserList(1,amount)
		});
		
		
		// var actionForm=$("#actionForm");
		// $(".paginate_button a").on("click",function(e){
		// 	e.preventDefault();//다른페이지로 이동을 막는다.
		// 	var page = $(this).attr("href");
		// });
	});
</script>
</html>