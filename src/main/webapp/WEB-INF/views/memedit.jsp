<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/><br/><br/><br/>
<div class="col-md-9">

            <div class="profile-content">
			    <form class="form-signin">
							
					        <div class="panel panel-primary" id="pri">
					            <h3 class="text-center">
					                       회원 정보 수정</h3>
					        <div class="panel-body">
					                    <div class="form-group">
					                        <div class="input-group">
					                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span>
					                            </span>
					                            <input type="text" class="form-control" id="id" placeholder="${m_id }" readonly="readonly" />
					                        </div>
					                    </div>
					                    
					                    <div class="form-group">
					                        <div class="input-group">
					                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
					                            <input type="text" class="form-control" placeholder="이름" id="name"/>
					                        </div>
					                    </div>
					                    
					                     <div class="form-group">
					                        <div class="input-group">
					                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
					                            <input type="password" class="form-control" placeholder="새 비밀번호" id="pw"/>
					                        </div>
					                    </div>
					                    
					                    <div class="form-group">
					                        <div class="input-group">
					                            <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
					                            <input type="text" class="form-control" placeholder="폰 번호" id="phone" />
					                        </div>
					                    </div>
					                    <div class="form-group">
					                        <div class="input-group">
					                            <span class="input-group-addon"><span class="glyphicon glyphicon-heart"></span></span>
					                            <input type="text" class="form-control" placeholder="성별" id="gender" />
					                        </div>
					                    </div>
					                        <button class="btn btn-lg btn-primary btn-block" type="button" id="button">
								저장
							</button>
					      </div>
					       </div>
					       </form>
					        </div>     
					    </div>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	
			$("#button").bind("click" , function() {
				
				alert('hi');
				
				var name = $("#name").val().trim();
				var pw = $("#pw").val().trim();
				var phone = $("#phone").val().trim();
				var gender = $("#gender").val().trim(); 
				
				console.log(name);
				console.log(pw);
				console.log(phone);
				console.log(gender);
				
				//비밀번호 유효성 검사
				if(pw.length < 1){
					alert("비밀번호를 입력하세요!");
					$("#pw").focus();
					return;
				}
				
				var param = "m_name"+encodeURIComponent(name)+
				"m_pw"+encodeURIComponent(pw)+"m_phone"+encodeURIComponent(phone)+"m_gender"+encodeURIComponent(gender);
				
				console.log(param);
				
				$.ajax({
					url : "editMem1.inc",
					type : "post",
					data:  param,
					dataType : "json"
						
				}).done(function(data) {
					
					alert("성공!");
								
		
				}).fail(function(err) {
					
					alert("실패");
					
				});
				
				
			});
			
	
	
	
	</script>

</body>
</html>