<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="resources/css/summernote-lite.css"/>
<style>
.red {
    color:red;
}
.form-area {
    background-color: #FAFAFA;
	padding: 10px 40px 60px;
	margin: 10px 0px 60px;
	border: 1px solid GREY;
}
input[id="chk"]:checked + label {
	color: #00f;
}
</style>
</head>
<body>
<jsp:include page="navbar.jsp"/><br/><br/><br/><br/>
<jsp:include page="top.jsp"/>
<div class="container" style="margin: 0 auto; width: 900px;">
    <div class="form-area" style="width: 900px">  
    <div style="margin: 0 auto; width: 700px;">
        <form action="write.inc" method="post" encType="multipart/form-data" name="write_form">
        <br style="clear:both">
			<div class="form-group">
				<input type="text" class="form-control" id="subject" name="subject" placeholder="제목" required style="width: 700px">
			</div>
			
			<!-- 비밀글 -->
			<div style="margin-bottom: 10px; text-align: right;">
				<input type="checkbox" id="chk" name="chk"/>
				<label for="chk">비밀글</label>
			</div>
			
			
			<div class="form-group">
				<input type="file" name="file"/>
			</div>
			<div class="form-group">
				<textarea class="form-control" type="textarea" id="content" name="content" maxlength="140" rows="7"></textarea>
	        </div>
			<input type="hidden" name="m_idx" value="${m_idx }"/>
			<input type="hidden" name="type" value="${type }"/>
	        <input type="hidden" name="nowPage" value="${nowPage }"/>
	        <input type="hidden" id="status" name="status"/>
			<button type="button" id="save_btn" class="btn btn-primary pull-right" style="margin-left: 10px;" onclick="sendData()">저장</button>
			<button type="button" id="list_btn" class="btn btn-white pull-right" onclick="go_list('${type }', '${nowPage }')">목록</button>
        </form>
        </div>
    </div>
</div>

	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script src="resources/js/summernote-lite.js"></script>
	<script src="resources/js/lang/summernote-ko-KR.js"></script>
	<script>
		$(function(){
			$("#content").summernote({
				height: 300,
				width: 700,
				lang: "ko-KR",
				callbacks:{
					onImageUpload: function(files, editor){
						for(var i=0; i<files.length; i++){
							sendFile(files[i], editor);
						}
					},
				}
			});
			$("#content").summernote("lineHeight", 1.0);
		});
		
		function sendFile(file, editor){
			var frm = new FormData();
			
			frm.append("file", file);
			
			$.ajax({
				url: "saveImage.inc",
				type: "post",
				dataType: "json",
				// 파일을 보낼 때는
				//일반적인 데이터 전송이 아님을 증명해야 한다.
				contentType: false,
				processData: false,
				data: frm
				
			}).done(function(data){
				$("#content").summernote(
					"editor.insertImage", data.url);
			}).fail(function(err){
				console.log(err);
			});
		}
		
		
		function sendData(){
			var subject = $("#subject").val();
			var content = $("#content").val();
			
			if(subject.trim().length < 1) {
				alert("제목을 입력하세요.");
				return;
			}
			if(content.trim().length < 1) {
				alert("내용을 입력하세요.");
				return;
			}
			
			if($("input[id='chk']").is(':checked')){
				//체크 했을 때, true
				$("#status").val("2");
			}else{
				//체크 안 했을 때, false
				$("#status").val("0");
			}

			write_form.submit();
			
		}
		
		function go_list(type, nowPage) {
			location.href = "bbs.inc?s_type=" + type + "&nowPage=" + nowPage;
		}
	</script>
<jsp:include page="footer.jsp"/>
</body>
</html>