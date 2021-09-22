<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../includes/head.jsp"/>
<head>
	<style>
		.height-100{
		    height: 100%; 
		}
		.box{
		    width: 300px;
		    padding: 10px;
		    border: 1px solid gray;
		    border-radius: 10px;
		    margin: 0 auto;
		}
		.id-input{
		    display: inline-block;
		    width: 65%;
		}
		.d-block{
		    display: block;
		}
		.float-right{
		    float: right;
		}
		.d-none{
		    display: none;
		}
	</style>
</head>
<jsp:include page="../includes/small-header.jsp"/>
	<div class="wrap">
		<div class="content-box container">
		    <div class="row box">
		        <form id="form-sign" action="/Member/sign" method="POST">
		            <div class="form-group">
		                <label class="d-block" for="id">ID </label>
		                <input id="user-id" name="user_id" type="text" class="form-control id-input" data-id-check="false">
		                <input type="button" class="btn btn-info pull-" id="id-check" value="중복확인">
		                <div id="id-message" class="alert d-none"></div>
		            </div>
		            <div class="form-group">
		                <label for="user-pw">PW </label>
		                <input id="user-pw" name="user_pw" type="password" class="form-control" data-pw-check="false">
	                    <div id="pw-message" class="alert d-none"></div>
		            </div>
	              	<div class="form-group">
		                <label for="pw-check">PW Check</label>
		                <input type="password" class="form-control" id="pw-check">
	                    <div id="pwCheck-message" class="alert d-none"></div>
		            </div>
		            <div class="form-group">
		                <label for="name">이름</label>
		                <input type="text" class="form-control" data-name-check="false" id="user_name" name="user_name">
	                    <div id="name-message" class="alert d-none"></div>
		            </div>
		            <div class="form-group">
		                <label for="gender">성별</label>
		                <select class="form-control" data-gender-check="false" id="gender" name="user_gender">
	                        <option value="default">-----선택하세요-----</option>
		                    <option value="여성">여성</option>
		                    <option value="남성">남성</option>
		                </select> 
	                    <div id="gender-message" class="alert d-none"></div>
		            </div>
		            <div class="form-group">
		                <label for="birth">Birth</label>
		                <input type="date" class="form-control" pattern="" data-birth-check="false" id="birth" name="user_birth">
	                    <div id="birth-message" class="alert d-none"></div>
		            </div>
		            <div class="form-group">
		            	<label for="adress">관심 모임 장소</label>
		            	<input type="text" id="adress" class="form-control" name="user_location">
		            </div>
		            <div class="form-group">
		            	<label for="hobby">관심사</label>
		            	<div id="hobby">
		            		<div class="checkbox">
		            			<label class="checkbox-inline"><input type="checkbox" name="hobby" value="스터디">스터디</label>
		            			<label class="checkbox-inline"><input type="checkbox" name="hobby" value="운동">운동</label>
	            				<label class="checkbox-inline"><input type="checkbox" name="hobby" value="클래스">클래스</label>
		            			<label class="checkbox-inline"><input type="checkbox" name="hobby" value="봉사">봉사</label>
		            		</div>
		            	</div>
		            </div>
		            <!-- END   ///////////////-->
		            <div class="text-center">
		                <input type="submit" class="btn btn-success" value="가입">
		                <input type="reset" class="btn btn-info">
		                <input type="button" class="btn btn-info" onclick="location.href='login'" value="돌아가기">
		            </div>
		        </form>
		    </div>
		</div>
	</div>
<script>
	$(document).ready(function(){

        // 영문 대.소문자, 숫자 _,-만 입력 5~20
        var idPattern = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
        // 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자
        var pwPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
        // 한글만 2~6 입력가능
        var namePattern = RegExp(/^[가-힣]{2,6}$/);
        // 이메일 형식 ex ) javascript@naver.com 형식 만 허용 
        var emailPattern = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	
		// 생년 월 일 정규식
		var birth1Pattern = RegExp(/^(19[0-9][0-9]|20\d{2})(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
		
		// 생년 월 일 정규식 ( - 포함 )
		var birth2Pattern = RegExp(/^(19[0-9][0-9]|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/);
		
        // 01로 시작하여 그 다음은 0,1,7,9 중 하나와 매칭되는지 체크한뒤 7~8자리인지 검사
        var phonePattern = RegExp(/^01[0179][0-9]{7,8}$/);
		
     	// ID 중복 체크 Ajax
	    $("#id-check").on("click", function(e){
	    	var id = $("#user-id").val();
	    	if(idPattern.test(id)){
	    		$("#id-message").css("display","none").empty();
		    	$.ajax({
					url: 'checkID/' + id, 
					type: "GET",
					success:function(result){
						alert(result);
						$("#user-id").attr("data-id-check", true);
					},
					error:function(){
						// 에러페이지 생성
					}
				});
	    	}else{
	    		$("#id-message").html("<strong>영문 대.소문자, 숫자 ,특수문자(_,-)</br> 조합으로 5~20자리 사용해야 합니다.<strong>")
                .removeClass("alert-success").addClass("alert-danger")
                .css("color","red").css("font-weight","bold").css("display","block").css("margin-top","10px");
	    	}
	    });
		
		// PW 확인 기능
        // 이벤트(keyup focusout) 2개 할당 , 2개 중 하나라도 이벤트 발생 시 기능
        // keyup = 키보드 입력 시 이벤트 발생 , focusout = 포커스가 벗어났을 때 이벤트 발생

        $("#user-pw").on("keyup focusout", function(e){

            $("#pw-check").trigger("focusout");

            if(pwPattern.test($("#user-pw").val())){
                // pwPattern 의 정규식에 PW 값이 허용되었을 때
                // PW 가 사용 가능할 경우
                $("#pw-message").html("<strong>사용가능합니다.<strong>")
                .removeClass("alert-danger").addClass("alert-info")
                .css("color","blue").css("display","block").css("margin-top","10px");
            }else if($("#user-pw").val() == '' || $("#user-pw").length == 0){
                // PW의 값이 아무것도 없을 때
                // .empty() 는 선택자 ( $("#span-pwCheck-message") ) 의 내용(html)을 지우겠다는 명령어
                $("#pw-message").css("display","none").empty();
            }else{
                // pwPattern 의 정규식에 PW 값이 허용되지 않았을 경우
                // PW 가 사용 불가능할 경우
                $("#pw-message").html("<strong>비밀번호는 영문자+숫자+특수문자</br> 조합으로 8~25자리 사용해야 합니다.<strong>")
                .removeClass("alert-success").addClass("alert-danger")
                .css("color","red").css("font-weight","bold").css("display","block").css("margin-top","10px");
            }
        });

        // PW 와 PW Check 의 값이 같은지 확인하는 기능
        // 이벤트(keyup focusout) 2개 할당 , 2개 중 하나라도 이벤트 발생 시 기능
        // keyup = 키보드 입력 시 이벤트 발생 , focusout = 포커스가 벗어났을 때 이벤트 발생
	    $("#pw-check").on("keyup focusin focusout", function(e){

            // PW 의 value 값 (입력 값)
	        var pw = $("#user-pw").val();

            // $(this)는 이벤트가 발생한 태그를 의미 현재는 PW Check => <input type='text' id='pw-check'> 
            // attr(속성명, 속성값) 은 선택자의 속성 값을 변경하는 명령어

	        if( pw === $(this).val() ){
                // PW 와 PW Check 의 값이 같을 떄
                // attr(속성명, 속성값) 은 선택자의 속성 값을 변경하는 명령어
                $("#pwCheck-message").html("일치합니다.")
                .removeClass("alert-danger").addClass("alert-info")
                .css("color","blue").css("font-weight","bold").css("display","block").css("margin-top","10px");
	            $("#user-pw").attr("data-pw-check", true);
	        }else if( $(this).val() == '' || $(this).length == 0 ){
                // PW Check의 값이 없을 때
                // .empty() 는 선택자 ( $("#span-pwCheck-message") ) 의 내용(html)을 지우겠다는 명령어
                $("#pwCheck-message").css("display","none").empty();
                $("#user-pw").attr("data-pw-check", false);
            }else{
                // PW 와 PW Check 의 값이 다를 때
	            $("#pwCheck-message").html("불일치합니다.")
                .removeClass("alert-success").addClass("alert-danger")
                .css("color", "red").css("font-weight","bold").css("display","block").css("margin-top","10px");
	            $("#user-pw").attr("data-pw-check", false);
            }
	    });
        
        // name 정규식 확인 기능
		$("#user_name").on("keyup focusout", function(e){

            // $(this)는 이벤트가 발생한 태그를 의미 현재는 name => <input type='text' id='name'>
            // val() 은 선택자의 value 값을 return 
            // attr(속성명, 속성값) 은 선택자의 속성 값을 변경하는 명령어

            var name = $(this).val();

            if(namePattern.test(name)){
                $("#name-message").html("사용가능한 이름입니다.")
                .removeClass("alert-danger").addClass("alert-info")
                .css("color","blue").css("font-weight","bold").css("display","block").css("margin-top","10px");
               
                /*  
                 $("#name-message").delay(3000).css("display","none").empty();
                	정규식 패턴에 맞으면 span 메세지를 제거하고
                 	속성 data-name-check 을 true 로 변경
                 	.empty() 는 선택자 내용(html)을 지우겠다는 명령어
                 	$("#name-message").delay(3000).queue(function(){
                    $(this).css("display","none").empty();
                    $(this).fadeOut(2000);
                    $(this).fadeOut(1600, complete).dequeue(); 
                 }); */
                $(this).attr("data-name-check",true);
            }else if(name == "" | name.length == 0){
               // 값을 입력하지 않고 넘아깄을 경우
               $("#name-message").html("이름을 입력해주세요.")
               .removeClass("alert-success").addClass("alert-danger")
                .css("color", "red").css("font-weight","bold").css("display","block").css("margin-top","10px");
                $(this).attr("data-name-check",false);
            }else{
                // 정규식 패턴에 불일치하면 span 메시지
                // 속성 data-name-check 을 false 로 변경
                $("#name-message").html("한글 이름으로 2~6 입력가능합니다.")
                .removeClass("alert-success").addClass("alert-danger")
                .css("color", "red").css("font-weight","bold").css("display","block").css("margin-top","10px");
                $(this).attr("data-name-check",false);
            }
		});

        // 성별 선택 시 이벤트
        $("#gender").on("click change",function(e){

            // $(this) 는 이벤트가 발생한 태그를 의미 현재는 gender => <select bane='gender'></select>
            // attr(속성명, 속성값) 은 선택자의 속성 값을 변경하는 명령어

            if($(this).val() === "default"){
                $("#gender-message").html("선택해주세요.")
                .removeClass("alert-success").addClass("alert-danger")
                .css("color", "red").css("font-weight","bold").css("display","block").css("margin-top","10px");
                $(this).attr("data-gender-check",false);
            }else{
                $("#gender-message").css("display","none").empty();
                $(this).attr("data-gender-check",true);
            }
        });

        // 이메일 정규식 Check 이벤트
        $("#mail").on("keyup focusout", function(e){

            // attr(속성명, 속성값) 은 선택자의 속성 값을 변경하는 명령어

            if(emailPattern.test($("#mail").val())){
                // mail 이 정규식에 허용되었을 경우
                // .empty() 는 선택자 내용(html)을 지우겠다는 명령어
                //$('#mail-check').css("display","none").empty();
                $("#mail-message").html("사용가능한 E-mail 입니다.")
                .removeClass("alert-danger").addClass("alert-info")
                .css("color","blue").css("font-weight","bold").css("display","block").css("margin-top","10px");
                //$("#mail-message").delay(3000).css("display","none").empty();
                $(this).attr("data-mail-check",true);
            }else if($(this).val() == "" | $(this).val().length == 0){
                 // mail 에 값을 입력하지 않았을 경우
                $('#mail-message').html("E-mail을 입력해주세요.")
                .removeClass("alert-success").addClass("alert-danger")
                .css("color","red").css("font-weight","bold").css("display","block").css("margin-top","10px");
                $(this).attr("data-mail-check",false);
            }else{
                // mail 이 정규식에 허용되지 않았을 경우
                $('#mail-message').html("E-mail 형식에 맞지 않습니다.")
                .removeClass("alert-success").addClass("alert-danger")
                .css("color","red").css("font-weight","bold").css("display","block").css("margin-top","10px");
                $(this).attr("data-mail-check",false);
            }
		});
        
        // type="date" 생년월일 정규식 Check 이벤트
        $("#birth").on("keyup focusout", function(e){
            if($(this).val() == "" | $(this).val().length == 0){
                 // 생년월일 에 값을 입력하지 않았을 경우
                $('#birth-message').html("생년월일 을 선택해주세요.")
                .removeClass("alert-success").addClass("alert-danger")
                .css("color","red").css("font-weight","bold").css("display","block").css("margin-top","10px");
                $(this).attr("data-birth-check",false);
            }else{
            	$(this).attr("data-birth-check",true);
            	$('#birth-message').css("display","none").empty();
            }
		}); 
		
        // 입력 값을 모두 정확하게 입력했는지 확인하는 function
        function check(){
        	// 각 input tag 에서 지정해 놓은 data-~~~ 의 값을 가져온다.  
            var isID = $("#user-id").data("idCheck");
            var isPW = $("#user-pw").data("pwCheck");
            var isName = $("#user_name").data("nameCheck");
            var isGender = $("#gender").data("genderCheck");
            var isBirth = $("#birth").data("birthCheck");
            
            if( Boolean(isID) && Boolean(isPW) && Boolean(isName) && Boolean(isGender) && Boolean(isBirth)){
                return true;
            }else{
                return false;
            }
        }

		// 회원 가입 form 전송
	    $(":submit").on("click", function(e){
	        e.preventDefault();

            // chech() function을 호출
            // true 면 submit()
            // false 면 alert()

            if(check()){
                $("#pw-check").attr("disabled",true);
	       	    $("#form-sign").submit();
            }else{
                alert("누락된 정보가 있습니다.");
            }
	    });
	});
</script>
<!-- footer -->
<jsp:include page="../includes/footer.jsp"/>