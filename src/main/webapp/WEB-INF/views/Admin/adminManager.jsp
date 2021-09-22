<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <title>Admin</title>
</head>
<body>
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
					<li><a href="/Admin/adminUser">회원관리</a></li>
					<li class="active"><a href="/Admin/adminManager">관리자 관리</a></li>
				</ul>
			</div>
        </div>
      </nav>

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
						<table class='table table-striped table-bordered table-hover'>
							<colgroup>
								<col width="10%">
								<col>
								<col>
							</colgroup>
							<thead>
								<tr class="active">
									<td>삭제 선택</td>
									<td>관리자 ID</td>
									<td>관리자 PW</td>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
						<div class="pull-right">
							<input type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" value="관리자 추가">
							<input class="btn btn-info float-right" id="btn-delete" type="button" value="관리자 삭제">
						</div>
					</div>
				 	<!-- //////////////// panel - body -->
		       </div>
            </div>
		</div>
	</div>
	<!-- ///////////////// Content -container  -->
	
	<!-- Modal  -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
    	<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">관리자 ID/PW 추가</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="adminid">Admin ID</label>
		                <input type="text" class="form-control" id="adminid" name="adminid" placeholder="PW 입력해주세요." required>
						<label for="adminpw">Admin PW</label>
		                <input type="text" class="form-control" id="adminpw" name="adminpw" placeholder="PW 입력해주세요." required>
		            </div>
				</div>
				<div class="modal-footer">
					<input type="button" id="btn-insert" class="btn btn-info" value="추가하기">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- End Modal content --------------->
		</div>
	</div>
	<!-- End Modal ------------->
	
</body>
<script>
// Ajax 처리를 모듈화 해서 불러오기 위한 즉시 실행함수
var Ajax =(function(){
	return{
			// 관리자 목록 보기 Ajax
			// 보내주는 data 없이 받기만 해서 data는 없다.
			// getList(callback){}
			// getList : (callback) = >{
			getList : function(callback){
				$.ajax({
					// Ajax 설정 type, url (보내는 곳 Controller의 맵핑), data(내가 보내는 데이터의 형식), contentType(내가 받을 데이터의 형식)
					type:'get',
					url:'/Admin/adminList',
					contentType:'application/json; charset=utf-8',
					// Ajax가 성공적으로 처리되면 success function 실행
					success:function(adminList){
						callback(adminList.userList);
					},
					// Ajax 처리중 error 발생하면 error function 실행
					error:function(er){
						//에러 처리 부분
					}
				});
			},
			// 관리자 추가 Ajax
			insertAdmin : function(adminvalue, callback, error){
				$.ajax({
					// Ajax 설정 type, url (보내는 곳 Controller의 맵핑), data(내가 보내는 데이터의 형식), contentType(내가 받을 데이터의 형식)
					// Controller의 
					type:'post',
					url:'/Admin/insetAdmin',
					// Ajax로 보내주기위해 데이터를 JSON.stringfy 문자열화 한다.
					data:JSON.stringify(adminvalue),
					contentType:'application/json; charset=utf8',
					// Ajax 데이터가 성공적으로 return 되면 - HttpStatus 가 OK 일 경우 (Controller 부분에서 돌아오는 return 참고)
					success:function(result, status, xhr){
						console.log(result);
						callback(result);
					},
					// Ajax 데이터 처리 중 error 발생 되면 - HttpStatus 가 INTERNAL_SERVER_ERROR 일 경우  (Controller 부분에서 돌아오는 return 참고)
					error:function(xhr,status, er){
						//에러 처리
					}
				});
			},
			// 삭제처리 Ajax 
			// data = checkbox를 선택한 adminid를 저장한 배열 값
			// callback 은 function()
			deleteAdmin:function(data, callback, error){
				//console.log(data);
				$.ajax({
					// Ajax 설정
					type:'delete',
					url:'/Admin/deleteAdmin',
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
			},updateAdmin : function(adminvalue, callback, error){
				
				$.ajax({
					// Ajax 설정
					type:'put',
					url:'/admin/updateAdmin',
					// data JSON 문자열화
					//data:JSON.stringify(adminvalue),
					contentType:'application/json; charset=utf8',
					// Ajax 데이터가 성공적으로 return 되면 - HttpStatus 가 OK 일 경우 (Controller 부분에서 돌아오는 return 참고)
					success:function(result, status){
						callback(result);
					},
					// Ajax 데이터 처리 중 error 발생 되면 - HttpStatus 가 INTERNAL_SERVER_ERROR 일 경우  (Controller 부분에서 돌아오는 return 참고)
					error:function(status, er){
						//에러 처리
					}
				});
			}
		}
	})();
 
	$(document).ready(function(){
		// HTML 의 <talble> 의 <tbody>를 가리키는 선택자
		var table = $(".table tbody");
		adminList();
		// 관리자 List 불러오기
		function adminList(){
			Ajax.getList(function(userList){
				// userList 는 Ajax에서 contentType으로 받은 return 값
				var str = "";
				// tbody 초기화
				table.empty();
				// return 값을 가지고 forEach 를 돌려서 각 행의 데이터를 tbody에 넣는다.
				userList.forEach(function(data, i){
					str+="<tr>";
					str+="  <td><input type='checkbox'></td>";
					str+="	<td>"+data.user_id+"</td>";
					str+="	<td>"+data.authority+"</td>";
					str+="</tr>" ;
				});
				// tbody 에 append 시킨다.
				table.append(str);
			});
		}
		// Modal 창의 관리자 추가 버튼을 누르면 insertAdmin 함수 실행 -> 관리자를 추가하는 Ajax
		$("#btn-insert").on("click",function(){
			insertAdmin();
		});
		
		// 관리자 추가하기
		function insertAdmin(){
			// Ajax로 보내줄 데이터 종합
			// Modal 창에 적은 추가할 adminid, adminpw 의 val() 값.
			var insertdata={
					user_id: $("#adminid").val(),
					user_pw: $("#adminpw").val()
			};
			
			// Ajax - insertAdmin 호출 
			Ajax.insertAdmin(insertdata, function(result){
				//success 시 실행
				alert(result);
				$('#myModal').modal("hide");
				adminList();
			});
		}
		
		//삭제버튼을 클릭시 이벤트
		$("#btn-delete").on("click", function(e){
			// checkbox 가 클릭된 테이블을 행을 가져온다.
			var checkbox = $("input[type=checkbox]:checked");
			// adminid 값을 배열로 저장하여 보내주기 위한 배열 선언
			var deletedata={user_id:[]}; 
			// checkbox가 클릭된 행을 한 행씩 each(반복문)을 실행한다.
			checkbox.each(function(i){
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				var adminid = td.eq(1).text();
				deletedata.user_id.push(adminid);
			});
			console.log(deletedata);
			// Ajax 호출 - Ajax data 로 배열값만 보내준다.
			Ajax.deleteAdmin(deletedata,function(result){
				alert(result);
			    adminList();
		  	});
		});
		
		
	});
	 
</script>
</html>