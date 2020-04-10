<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<link rel="stylesheet" href="resources/css/find.css">
<html>
<head>
</head>
<jsp:include page="navbar.jsp"/><br/><br/>

<body>
<div class="">
<article class="card-body mx-auto" style="max-width: 400px;">
	<h4 class="card-title mt-3 text-center">아이디 찾기</h4>
	<p class="text-center"></p>
	<p class="divider-text">
        <hr/>
    </p>
    
	<form action="find_id.inc" method="post">		    
			<div class="form-group input-group">
				<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
				 </div>
		        <input class="form-control" placeholder="이름" type="text" id="name">
		    </div> <!-- 이름 -->
		    
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fas fa-mobile-alt"></i> </span>
			</div>
		    	<input class="form-control" placeholder="전화번호 (' - '없이 붙여 쓰시오.)" type="text" id="phone"  maxlength="11">
		    	<div id="box_p" class="box"></div>
		    </div> <!-- 전화번호 -->
		    
			<div class="form-group" style="padding-top: 20px;">
	        	<button type="button" class="btn btn-primary btn-block" id="sub_btn" style="background: #286386;">아이디 찾기</button>
	    	</div> <!-- 회원가입 버튼 -->   
	</form>
	
		<h4 class="card-title mt-3 text-center">비밀번호 찾기</h4>
			<p class="text-center"></p>
			<p class="divider-text">
		        <hr/>
		    </p>
		    
	<form action="find_pw.inc" method="post">	
	    <div class="form-group input-group">
			<div class="input-group-prepend">
			    <span class="input-group-text"><i class="fas fa-id-card"></i> </span>
			 </div>
	        <input class="form-control" placeholder="아이디(4자 이상 입력하시오.)" type="text" id="id">
	        <div id="box" class="box"></div>
	    </div> <!-- 아이디 -->
	    
		<div class="form-group input-group">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fas fa-question"></i> </span>
			</div>
	         <select id="m_question" name="m_question" class="form-control">
						<option value="0">어린시절 별명은?</option>
						<option value="1">살던 동네 이름은?</option>
						<option value="2">보물 1호는?</option>
						<option value="3">처음 키운 애완동물 이름은?</option>
			 </select>
	    </div> <!-- 힌트 질문 -->

	     <div class="form-group input-group">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"><i class="fas fa-pencil-alt"></i></span>
			</div>
	        <input class="form-control" placeholder="힌트 정답" type="text" id="m_answer" name="m_answer" />
	    </div> <!-- 힌트 대답 -->       

	    <div class="form-group" style="padding-top: 20px;">
	        <button type="button" class="btn btn-primary btn-block" id="sub_btn" style="background: #286386;">비밀번호 찾기</button>
	    </div> <!-- 비밀번호 찾기 버튼 -->   
	</form>
</article>
</div> <!-- card.// -->
</body>
<jsp:include page="footer.jsp"/>
</html>