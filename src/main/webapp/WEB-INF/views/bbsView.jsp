<%@page import="com.data.vo.ReviewVO"%>
<%@page import="com.data.vo.BbsVO"%>
<%@page import="com.data.vo.MemberVO"%>
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
<%------%>
.panel-shadow {
    box-shadow: rgba(0, 0, 0, 0.3) 7px 7px 7px;
}
.panel-white {
  border: 1px solid #dddddd;
}
.panel-white  .panel-heading {
  color: #333;
  background-color: #fff;
  border-color: #ddd;
}
.panel-white  .panel-footer {
  background-color: #fff;
  border-color: #ddd;
}
.post .post-heading {
  height: 95px;
  padding: 20px 15px;
}
.post .post-heading .avatar {
  width: 60px;
  height: 60px;
  display: block;
  margin-right: 15px;
}
.post .post-heading .meta .title {
  margin-bottom: 0;
}
.post .post-heading .meta .title a {
  color: black;
}
.post .post-heading .meta .title a:hover {
  color: #aaaaaa;
}
.post .post-heading .meta .time {
  margin-top: 8px;
  color: #999;
}
.post .post-image .image {
  width: 100%;
  height: auto;
}
.post .post-description {
  padding: 15px;
}
.post .post-description p {
  font-size: 14px;
}
.post .post-description .stats {
  margin-top: 20px;
}
.post .post-description .stats .stat-item {
  display: inline-block;
  margin-right: 15px;
}
.post .post-description .stats .stat-item .icon {
  margin-right: 8px;
}
.post .post-footer {
  border-top: 1px solid #ddd;
  padding: 15px;
}
.post .post-footer .input-group-addon a {
  color: #454545;
}
.post .post-footer .comments-list {
  padding: 0;
  margin-top: 20px;
  list-style-type: none;
}
.post .post-footer .comments-list .comment {
  display: block;
  width: 100%;
  margin: 20px 0;
}
.post .post-footer .comments-list .comment .avatar {
  width: 35px;
  height: 35px;
}
.post .post-footer .comments-list .comment .comment-heading {
  display: block;
  width: 100%;
}
.post .post-footer .comments-list .comment .comment-heading .user {
  font-size: 14px;
  font-weight: bold;
  display: inline;
  margin-top: 0;
  margin-right: 10px;
}
.post .post-footer .comments-list .comment .comment-heading .time {
  font-size: 12px;
  color: #aaa;
  margin-top: 0;
  display: inline;
}
.post .post-footer .comments-list .comment .comment-body {
  margin-left: 50px;
}
.post .post-footer .comments-list .comment > .comments-list {
  margin-left: 50px;
}
</style>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/><br/><jsp:include page="navbar.jsp"/><br/><br/>
<div class="container">
<div class="col-md-5" style="width: 750px; margin: 0 auto;">
    <div class="form-area">  
        <br style="clear:both">
			<div class="form-group">
				<pre>제목 : ${vo.subject }</pre>
			</div>
			<div class="form-group">
				<pre>조회수 : ${vo.hit }</pre>
			</div>
			<div class="form-group">
			<c:if test="${vo.file_name != null and fn:length(vo.file_name) > 4 }"> 
				<pre>첨부파일 :	<a href="javascript: fDown('${vo.file_name }')">${vo.file_name } (${vo.ori_name }) </a></pre>
			</c:if>
			<c:if test="${vo.file_name == null and fn:length(vo.file_name) <= 4 }">
			 	<pre>첨부파일이 없습니다.</pre>
			</c:if>
	        </div>
	        <div class="form-group">
				<pre>이름 : ${vo.writer }</pre>
	        </div>
	        <div class="form-group">
				<pre style="height: auto;">${vo.content }</pre>
	        </div>
	        
<%			
			Object obj = session.getAttribute("mvo");
			MemberVO mvo = null;
			BbsVO bvo = (BbsVO)session.getAttribute("vo");
			if(obj != null) {
				mvo = (MemberVO)obj;
%>
<%				if(mvo != null && (mvo.getM_level().equals("1") || mvo.getM_level().equals("2")))  {%>
					<button type="button" id="del_btn" class="btn btn-danger pull-right">삭제</button>
<% 				} else if(bvo.getM_idx().equals(mvo.getM_idx())) { %>
					<button type="button" id="del_btn" class="btn btn-danger pull-right">삭제</button>
					<button type="button" id="edit_btn" class="btn btn-primary pull-right" style="margin-left: 10px; margin-right: 10px" onclick="sendData()">수정</button>
<%				}
			}
%>
			<button type="button" id="list_btn" class="btn btn-white pull-right">목록</button>
    </div>
</div>
</div>

<%-- 댓글 -----------------------------------------------------------------------------------%>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<div class="container" style="margin: 0 auto;">
    <div class="col-sm-8">
        <div class="panel panel-white post panel-shadow">
	<div class="post-footer">
		<div class="input-group">
			<form action="c_write.inc" method="post" name="r_write">
				<input class="form-control" name="r_content" id="r_content" placeholder="Add a comment" type="text" style="width: 500px"/>
				<span class="input-group-addon"> 
				<%-- 등록버튼 --%>
<%
				if(mvo != null) {
%>
					<input type="hidden" name="m_idx" value='<%=mvo.getM_idx()%>'/>
					<input type="hidden" name="b_idx" value='<%=bvo.getB_idx()%>'/>
					<input type="hidden" name="type" value="${type }"/>
					<input type="hidden" name="nowPage" value="${nowPage }"/>
					<a href="javascript:ans_write()"><i class="fa fa-edit"></i></a>
<%
				} else {
%>
					<a href="javascript:alert('로그인 후 이용해 주세요');"><i class="fa fa-edit"></i></a>
<%
				}
%>
				</span>	
			</form>
		</div>
		
<%
	ReviewVO[] r_ar = null;
	if(request.getAttribute("review_ar") != null ){
		r_ar = (ReviewVO[])request.getAttribute("review_ar");
%>
		<ul class="comments-list">
<%
		for(int i = 0 ; i < r_ar.length ; i++) {
%>
			<hr/>
			<li class="comment">
				<form id="edit_frm<%=i%>" action="c_edit.inc" method="post">
				<div class="comment-body">
					<div class="comment-heading">
						<h4 class="user"><%=r_ar[i].getMvo().getM_name() %></h4>
						<h5 class="time"><%=r_ar[i].getR_date() %></h5>
					</div>
					<p id="content<%=i%>"><%=r_ar[i].getR_content() %></p>
					<input type="hidden" name="r_idx" value='<%=r_ar[i].getR_idx() %>'/>
					<input type="hidden" name="type" value="${type }"/>
					<input type="hidden" name="nowPage" value="${nowPage }"/>
					<input type="hidden" name="b_idx" value='<%=r_ar[i].getB_idx() %>'/>
<%				if(mvo != null && (mvo.getM_level().equals("1") || mvo.getM_level().equals("2")))  {%>
					<button type=button class="btn btn-danger" id="ans_del<%=i%>" onclick="ans_del('<%=r_ar[i].getR_idx() %>','<%=r_ar[i].getB_idx()%>', '<%=request.getParameter("type")%>')">삭제</button>
<%				} else if(mvo != null  && r_ar[i].getMvo().getM_idx().equals(mvo.getM_idx())){ %>
					<button type=button class="btn btn-primary" id="ans_edit<%=i%>" onclick="ans_edit('<%=i%>', '<%=r_ar[i].getR_idx()%>', this.form)">수정</button>
					<button type=button class="btn btn-danger" id="ans_del<%=i%>" onclick="ans_del('<%=r_ar[i].getR_idx() %>','<%=r_ar[i].getB_idx()%>', '<%=request.getParameter("type")%>')">삭제</button>
<%				} %>
				</div>
				</form>
			</li>
		
<%
		}
%>
		</ul>
<%
	}
%>
	
		
			
	
	</div>
	</div>
	</div>
	</div>

	<form action="" method="post" id="go_form" name="go_form">
        <input type="hidden" name="b_idx" value="${b_idx }"/>
        <input type="hidden" name="nowPage" value="${nowPage }"/>
		<input type="hidden" name="type" value="${type }"/>
		<input type="hidden" name="f_name"/>
	</form>

	<script src="resources/js/jquery-3.4.1.min.js"></script>
	<script>
		$(function() {
			$("#del_btn").click(function() {
				if (confirm("정말 삭제하시겠습니까?")) {
					$("#go_form").attr("action", "bbs_del.inc");
					go_form.submit();
				}
			});
			$("#edit_btn").click(function() {
				$("#go_form").attr("action", "edit_form.inc");
				go_form.submit();
			});
			$("#list_btn").click(function() {
				$("#go_form").attr("action", "bbs.inc");
				go_form.submit();
			});
		});
		function fDown(fname) {
			document.go_form.action = "FileDownload";
			document.go_form.f_name.value = fname;
			document.go_form.submit();
		}
		
		//*********************************************************************
		function ans_write() {
				if ($("#r_content").val().trim().length < 1) {
					alert("내용을 입력하세요");
					return;
				}
				r_write.submit();
			}
		
		function ans_del(r_idx, b_idx, type, nowPage){
				if (!(confirm('정말 삭제하시겠습니까?'))) {
					return;
				}
				var Param ="r_idx="+encodeURIComponent(r_idx);
				$.ajax({
					url: "r_del.inc",
					type: "post",
					data: Param,
					dataType:"json"
				}).done(function(data){
					if(data.value == "1"){
						if(type == "4") {
							location.href = "bbs_view.inc?type=4&nowPage=" + nowPage + "&b_idx=" + b_idx ;
						} else if(type == "5") {
							location.href = "bbs_view.inc?type=5&nowPage=" + nowPage + "&b_idx=" + b_idx ;
						}
					} else {
						alert("댓글삭제 실패");
					}
				}).fail(function(err){
					console.log(err)
				});
			}
			function ans_edit(num, r_idx, frm){
				var content = $("#content"+num).html();

				$("#content"+num).html("<input class='form-control' name='r_content' id='r_content' type='text' style='width: 500px' value='" + content + "'/>");
				$("#ans_edit"+num).attr("onclick", "ans_editok("+ num +")", frm);
			}
			function ans_editok(num){
				var frm = $("#edit_frm"+num);
				frm.submit();
			}
	</script>

</body>
</html>