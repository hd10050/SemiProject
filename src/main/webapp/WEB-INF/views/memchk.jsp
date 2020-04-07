<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.panel-body{
		width: 300px;
		margin: auto;
		padding-top: 50px;
	}
	.text-center{
		width: 400px;

	body {}
	    margin:0;
	    padding:0;
	    height:100%;
	}

	.btn1{
		padding-left: 420px;
		width : 120px;
		height: 60px;
	}
	#col{
		width: 100%;	
	}
	panel panel-info{
		margin-left:  -50px;
		margin-top:  50px;
	}
	#wrap{
		margin: auto;
		margin-right: 110px;
	}
	
	#mid2{
		color: #122f82;
	}
	

</style>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>
<body>
	
      
          <div class="panel panel-info">
            <div class="panel-heading">
              <h2><span class="fa fa-lock fa-1x"></span><span id=mid2>    ${mvo.getM_id() }</span>님의 정보 수정</h2>
            </div>
     
              <div class="panel-body">
                <div class="text-center">
                    <form id="register-form" role="form" autocomplete="off" class="form" method="post">
                      <div id = "wrap">
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-lock color-blue"></i></span>
                          <input id="email" name="email" placeholder="비밀번호를 입력하세요." class="form-control"  type="password">
                        </div>
                        <br/>
                      <div class="form-group">
                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="수정하기" type="submit" id="button">
                      </div>
                       </div>
                    	</div>  
                    </form>
             		
                </div>
              </div>
			
          </div> 	
     

</body>
	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
				
		$(function() {
			
			$("#button").bind("click", function() {
				
				//유효성 검사
				if($("#pwd").val() == ""){
					alert("비밀번호를 입력해주세요");
					$("#pwd").focus();
					return;
				};	
					
				var pwd = $("#pwd").val();	
				var param  = "pwd="+encodeURIComponent(pwd);

				$.ajax({
					url : "editchk.inc",
					type: "post",
					data : param,
					dataType: "json"
	
				}).done(function(data) {
					
					if(data.chk == 1){
						alert("성공");
						//window.location.href = "editmove.inc";
						$("#right_content").load("editmove.inc");
						
					}else{
						alert("실패!");
					};
					
				}).fail(function(err) {
					
					console.log(err);
				});
		});
			
		});		
	</script>
</body>
</html>