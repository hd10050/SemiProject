<%@page import="com.data.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- 
<jsp:include page="header.jsp"/><br/><br/><br/>
 --%>
<div class="col-md-9">

            <div class="profile-content">
			    <form class="form-signin">
				<div class="panel panel-info">
              <h3 class="panel-title"><span class="fa fa-lock fa-1x"></span><span id=mid>${mvo.getM_id() }</span>님의 정보</h3>
           
					        <div class="panel panel-primary" id="pri">
					            <h3 class="text-center">
					                       회원 정보 수정</h3>
					        <div class="panel-body">
					                    <div class="form-group">
					                        <div class="input-group">
					                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span>
					                            </span>
					                            <input type="text" class="form-control" id="id" value="${mvo.getM_id()}" readonly="readonly" />
					                        </div>
					                    </div>
					                    
					                    <div class="form-group">
					                        <div class="input-group">
					                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
					                            <input type="text" class="form-control" value="${mvo.getM_name()} " id="name"/>
					                        </div>
					                    </div>
					                    
					                     <div class="form-group">
					                        <div class="input-group">
					                            <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
					                            <input type="password" class="form-control" value="${mvo.getM_pw() }" id="pw"/>
					                        </div>
					                    </div>
					                    
					                    <div class="form-group">
					                        <div class="input-group">
					                            <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
					                            <input type="text" class="form-control" value="${mvo.getM_phone()}" id="phone" />
					                        </div>
					                    </div>
					                    <div class="form-group">
					                        <div class="input-group">
					                            <span class="input-group-addon"><span class="glyphicon glyphicon-heart"></span></span>
					                       		<%
					                       		Object obj = session.getAttribute("mvo");
					                       		MemberVO mvo = (MemberVO)obj;    
					                       		String gender = null;
					                       		System.out.println(mvo.getM_gender());
					                       		if(mvo.getM_gender().equals("1")){
					                       			gender = "여자";
					                       		}else{
					                       			gender = "남자";	
					                       		}
					                       		%>
					                            <input type="text" class="form-control" value=<%= gender %> readonly="readonly">
					                            <input type="hidden" value="${mvo.getM_gender()}" id="gender" />
					                        </div>
					                    </div>
					                        <button class="btn btn-lg btn-primary btn-block" type="button" id="button">
								저장
							</button>
					      </div>
					       </div>
					       </div>
					       </form>
					        </div>     
					    </div>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	
			$("#button").bind("click" , function() {

				var name = $("#name").val().trim();
				var pw = $("#pw").val().trim();
				var phone = $("#phone").val().trim();
				var gender = $("#gender").val().trim(); 
				
				//비밀번호 유효성 검사
				if(pw.length < 1){
					alert("비밀번호를 입력하세요!");
					$("#pw").focus();
					return;
				}	
				var param = "m_name="+encodeURIComponent(name)+
				"&m_pw="+encodeURIComponent(pw)+"&m_phone="+encodeURIComponent(phone)+"&m_gender="+encodeURIComponent(gender);
				
				console.log(param);
				
				$.ajax({
					url : "editMem1.inc",
					type : "post",
					data:  param,
					dataType : "json"
						
				}).done(function(data) {
					
					if(data.chk == 1){
						
						alert("수정 성공!");
						
					}else{
						
						alert("실패!")
					}
					
				}).fail(function(err) {
					console.log(err);
				});
			});
			
	
	
	
	</script>

</body>
</html>