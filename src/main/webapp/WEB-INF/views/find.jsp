<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<html>
<head>
<style type="text/css">
.divider-text {
    position: relative;
    text-align: center;
    margin-top: 15px;
    margin-bottom: 15px;
}
.divider-text span {
    padding: 7px;
    font-size: 12px;
    position: relative;   
    z-index: 2;
}
.divider-text:after {
    content: "";
    position: absolute;
    width: 100%;
    border-bottom: 1px solid #ddd;
    top: 55%;
    left: 0;
    z-index: 1;
}

.btn-facebook {
    background-color: #405D9D;
    color: #fff;
}
.btn-twitter {
    background-color: #42AEEC;
    color: #fff;
}
.btn-google {
    background-color: red;
    color: #fff;
}
.btn-naver {
    background-color: green;
    color: #fff;
}
body{
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
	padding-top: 160px;
}
.box{
	display: inline-block;
	position: absolute;
	left: 380px;
	top: 9px;
	font-size: 14px;
	font-family: Georgia, "Times New Roman", serif;
	font-weight: bold;
}
.input-group-text{
	width: 40px;
}
</style>
</head>
<jsp:include page="navbar.jsp"/>

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
</html>