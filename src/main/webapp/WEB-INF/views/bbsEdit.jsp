<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" href="resources/css/listStyle.css"/>
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
</style>
</head>
<body>
<div class="container">
<div class="col-md-5">
    <div class="form-area">  
        <form action="edit.inc" method="post" encType="multipart/form-data" name="write_form">
        <br style="clear:both">
			<div class="form-group">
				<input type="text" class="form-control" id="subject" name="subject" placeholder="제목" value='${vo.subject }' required />
			</div>
			<div class="form-group">
				<input type="file" name="file"/>
				<c:if test="${vo.file_name != null and fn:length(vo.file_name) > 4 }">
					&nbsp;&nbsp;${vo.file_name } (${vo.ori_name })
				</c:if>
			</div>
			<div class="form-group">
				<textarea class="form-control" type="textarea" id="content" name="content" maxlength="140" rows="7">${vo.content }</textarea>
	        </div>
			<input type="hidden" name="b_idx" value="${b_idx }"/>
			<input type="hidden" name="type" value="${type }"/>
	        <input type="hidden" name="nowPage" value="${nowPage }"/>
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
				width: 450,
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
			
			write_form.submit();
		}
		
		function go_list(type, nowPage) {
			location.href = "bbs.inc?type=" + type + "&nowPage=" + nowPage;
		}
	</script>
</body>
<jsp:include page="footer.jsp"/><br/><br/><br/>
</html>