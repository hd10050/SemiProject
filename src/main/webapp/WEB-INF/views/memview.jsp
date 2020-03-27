<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.4.1.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="resources/css/memview.css"/>
<link rel="stylesheet" href="resources/css/editform.css"/>
<style>
 

</style>
</head>
<body>
<div class="container">
    <div class="row profile">
    	<div class="col-md-3">
			<div class="profile-sidebar">
				<!-- SIDEBAR USERPIC -->
				<div class="profile-userpic">
					<img src="resources/image/mung.png">
				</div>
				<!-- END SIDEBAR USERPIC -->
				<!-- SIDEBAR USER TITLE -->
				<div class="profile-usertitle">
					<div class="profile-usertitle-name">
						<h5>${m_id }님 안녕하세요!</h5>
					</div>
				</div>
				<!-- END SIDEBAR USER TITLE -->
				<!-- SIDEBAR BUTTONS -->
				<div class="profile-userbuttons">
					<button type="button" class="btn btn-success btn-sm">F</button>
					<button type="button" class="btn btn-danger btn-sm">M</button>
				</div>
				<!-- END SIDEBAR BUTTONS -->
				<!-- SIDEBAR MENU -->
				<div class="profile-usermenu">
					<ul class="nav">
						<li class="active">
							<a href="javascript:changePage(0)">
							<i class="glyphicon glyphicon-home"></i>
							Home </a>
						</li>
						<li>
							<a href="javascript:changePage(1)">
							<i class="glyphicon glyphicon-pencil"></i>
							개인 정보 수정 </a>
						</li>
							<li>
							<a href="javascript:changePage(2)">
							<i class="glyphicon glyphicon-inbox"></i>
							스크랩</a>
						</li>
						<li>
							<a href="javascript:changePage(3)">
							<i class="glyphicon glyphicon-remove"></i>
							탈퇴</a>
						</li>
					</ul>
				</div>
				<!-- END MENU -->
			</div>
		</div>
	<div class="col-md-9">
            <div class="profile-content">
			  <div id="right_content"></div>
            </div>
		</div>
		
            </div><%--content end --%>

</div>

<script type="text/javascript">
		
		
		$(document).ready(function(){
			$("#right_content").load("memdel");
			
			});
				
		
		function changePage(val){
			if(val == 0){
				$("#right_content").load("memInfo.inc");
			}else if(val == 1){
				$("#right_content").load("editMem.inc");
			}else if(val == 2){
				$("#right_content").load("scrap.inc");	
			}else{
				$("#right_content").load("memdel.inc");
			}
		}
	


</script>
</body>
</html>