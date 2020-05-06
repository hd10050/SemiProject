<%@page import="com.data.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

#panel panel-info{
	width: 733.021px;
	height: 388.768px;
}
.span.input-group-addon{
	width: 120px !important;
}

</style>

</head>
<body>

<%-- 
<jsp:include page="header.jsp"/><br/><br/><br/>
 --%>

	   <div class="panel panel-info" id="panel panel-info" style="width:703px;">
            <div class="panel-heading" style="width:703px;">
              <h2 style="font-size: 35px"><span class="fa fa-lock fa-1x"></span><span id=mid2>    ${mvo.getM_id() }</span>님의 정보 수정</h2>
            </div>
     			  <div class="profile-content1" style="padding:0;">
			   

					        <div class="panel-body">
					                    <div class="form-group" style="padding-left: 111px">
					                        <div class="input-group">
					                            <span class="input-group-addon" style="width:120px;"><span class="glyphicon glyphicon-user">&nbsp;아이디</span>
					                            </span>
					                            <input type="text" style="width:350px; font-size: 19px;" class="form-control" id="id" value="${mvo.getM_id()}" readonly="readonly" />
					                        </div>
					                    </div>
					                    
					                    <div class="form-group" style="padding-left: 111px">
					                        <div class="input-group">
					                            <span class="input-group-addon" style="width:120px;"><span class="glyphicon glyphicon-user">&nbsp;이름</span></span>
					                            <input type="text" style="width:350px; font-size: 19px;" class="form-control" value="${mvo.getM_name()} " id="name"/>
					                        </div>
					                    </div>
					                    
					                     <div class="form-group" style="padding-left: 111px">
					                        <div class="input-group">
					                            <span class="input-group-addon" style="width:120px;"><span class="glyphicon glyphicon-lock">&nbsp;새비밀번호</span></span>
					                            <input type="password" style="width:350px; font-size: 19px;" class="form-control" id="pw" style="font-size: 18px;"/>
					                        </div>
					                    </div>
					                    
					                    <div class="form-group" style="padding-left: 111px">
					                        <div class="input-group">
					                            <span class="input-group-addon" style="width:120px;"><span class="glyphicon glyphicon-phone">&nbsp;전화번호</span></span>
					                            <input type="text" style="width:350px; font-size: 19px;" class="form-control"  value="${mvo.getM_phone()}" id="phone" />
					                        </div>
					                    </div>
					                    <div class="form-group" style="padding-left: 111px">
					                        <div class="input-group">
					                            <span class="input-group-addon" style="width:120px; font-size: 19px;"><span class="glyphicon glyphicon-heart">&nbsp;성별</span></span>
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
					                            <input type="text" style="width:350px; font-size: 19px;" class="form-control" value=<%= gender %> readonly="readonly">
					                            <input type="hidden" value="${mvo.getM_gender()}" id="gender" />
					                        </div>
					                    </div>
					                        <button class="btn btn-lg btn-primary btn-block" type="button" id="button" style="width:472px; margin-left: 111px;">
								저장
							</button>
					      </div>
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
						location.href = "myPage.inc"
						
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