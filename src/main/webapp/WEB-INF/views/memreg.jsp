<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
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
</style>
</head>
<div class="container">
<br>  <p class="text-center"> <a href="http://bootstrap-ecommerce.com/"> Bootstrap-ecommerce.com</a></p>
<hr>

<body>
<div class="card bg-light">
<article class="card-body mx-auto" style="max-width: 400px;">
	<h4 class="card-title mt-3 text-center">회 원 가 입</h4>
	<p class="text-center"></p>
	<p>
		<a href="" class="btn btn-block btn-twitter"> <i class="fab fa-twitter"></i>   Login via Twitter</a>
		<a href="" class="btn btn-block btn-facebook"> <i class="fab fa-facebook-f"></i>   Login via facebook</a>
		<a href="" class="btn btn-block btn-google"> <i class="fab fa-google"></i>   Login via google</a>
	</p>
	<p class="divider-text">
        <span class="bg-light">OR</span>
    </p>
	<form>
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="" class="form-control" placeholder="이름" type="text" id="name">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="" class="form-control" placeholder="아이디" type="text" id="id">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		</div>
		
    	<input name="" class="form-control" placeholder="전화번호('-'없이 붙여 쓰시오.)" type="text" id="phone">
    </div> <!-- form-group// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		</div>
		<select class="form-control" id="gender">
			<option selected="">성별</option>
			<option value="1">여자</option>
			<option value="2">남자</option>
		</select>
	</div> <!-- form-group end.// -->
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input class="form-control" placeholder="비밀번호" type="password" id="pw">
    </div> <!-- form-group// -->                             
    <div class="form-group">
        <button type="button" class="btn btn-primary btn-block" id="sub_btn"> Create Account </button>
    </div> <!-- form-group// -->      
    <p class="text-center">기존 회원 이십니까? <a href="">로그인</a> </p>                                                                 
</form>
</article>
</div> <!-- card.// -->

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$("#sub_btn").click(function () {
	
	var name = $("#name").val().trim();
	var id = $("#id").val().trim();
	var pw = $("#pw").val().trim();
	var phone = $("#phone").val().trim();
	var gender = $("#gender").val().trim(); //f or m
	
	//유효성 검사
	if(id.length < 1){
		alert("아이디를 입력하세요!");
		$("#id").focus();
		return;
	}
	if(pw.length < 1){
		alert("비밀번호를 입력하세요!");
		$("#pw").focus();
		return;
	}
	if(name.length < 1){
		alert("이름을 입력하세요!");
		$("#name").focus();
		return;
	}
	
	var param = "m_name="+encodeURIComponent(name)+
						"&m_id="+encodeURIComponent(id)+
						"&m_pw="+encodeURIComponent(pw)+
						"&m_phone="+encodeURIComponent(phone)+
						"&m_gender="+encodeURIComponent(gender);
	// 비동기식 통신
	$.ajax({
		url: "memreg.inc",
		type: "post",
		dataType: "json",
		data: param
				
		}).done(function(res){
			if(res.chk == "1") {
				location.href="login.inc";	
			} else {
				alert("실패");
			}
			
			
		}).fail(function(err) {
			console.log(err);
		});
	
	
});
</script>
</body>

</div> 
<!--container end.//-->

<br><br>
<article class="bg-secondary mb-3">  
<div class="card-body text-center">
    <h3 class="text-white mt-3">Bootstrap 4 UI KIT</h3>
<p class="h5 text-white">Components and templates  <br> for Ecommerce, marketplace, booking websites 
and product landing pages</p>   <br>
<p><a class="btn btn-warning" target="_blank" href="http://bootstrap-ecommerce.com/"> Bootstrap-ecommerce.com  
 <i class="fa fa-window-restore "></i></a></p>
</div>
<br><br>
</article>


