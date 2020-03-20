<%@page import="com.data.vo.ProtectVO"%>
<%@page import="com.data.vo.StoreVO"%>
<%@page import="com.data.vo.HospitalVO"%>
<%@page import="com.data.vo.RescueVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link rel="stylesheet" href="resources/css/page.css"/>

<link type="text/css" rel="stylesheet" href="resources/css/main.css"/>

</head>
<body>
  
   
   <div id="wrap">
   
   <div id="mainImage" class="col-sm-12 pull-center well" >
      <%-- 메인 이미지 넣기 --%>
      <h1>이미지 </h1>
   </div>
   
   
   
   <div id="search" class="col-sm-12 pull-center well" >
   <form class="form-inline">
      <select name="searchSelect" id="searchSelect" class="form-control">   
         <option value=""> 지역</option>
         <option value=""> 병원명</option>
        </select>
        <input type="text"  class="form-control" size="20" name="searchValue" id="searchValue"/>
        <input type="button" value="검색" id="searchbt" class="btn btn-default" onclick="search()"/>
   </form>
   
  	 <div id = "buttons"> 
	       <input type="button" value="야생동물 구조치료기관" onclick="bbs(0)" class="btn btn-xs btn-primary"/>
		   <input type="button" value="동물 병원" onclick="bbs(1)" class="btn btn-xs btn-primary"/>
		   <input type="button" value="동물 약국" onclick="bbs(2)" class="btn btn-xs btn-primary"/>
		   <input type="button" value="유기 동물 보호시설" onclick="bbs(3)" class="btn btn-xs btn-primary"/>
      </div> 
   </div>
   
   <div id ="list" class="col-sm-12 pull-center well" >
   <table>
      <colgroup>
         <col width="66px"/>
         <col width="165px"/>
         <col width="*"/>
         <col width="105px"/>
      </colgroup>


      <%--야생동물 구조치료기관 --%>
      <%if(request.getAttribute("type").equals("0")) {
      		RescueVO[] ar = (RescueVO[])session.getAttribute("ar");%>
      <thead>   
         <tr>
            <th>지역</th>
            <th>기관명</th>
            <th>주소</th>
            <th>전화번호</th>
         </tr>
      </thead>   
      <tbody>
      <c:forEach var="vo" items="${ar}">
         <tr>
            <td>${vo.SIGUN_NM}</td>
            <td><a href="view.inc?RESCUE_INST_TELNO=${vo.RESCUE_INST_TELNO}&type=${requestScope.type}">${vo.RESCUE_INST_NM}</a></td>
            <td>${vo.REFINE_LOTNO_ADDR}</td>
            <td>${vo.RESCUE_INST_TELNO}</td>
         </tr>
      </c:forEach>
      </tbody>
      
      <%-- 동물병원 --%>
      <%}else if(request.getAttribute("type").equals("1")) {
    	  HospitalVO[] ar = (HospitalVO[])session.getAttribute("ar");%>
      <thead>   
         <tr>
            <th>지역</th>
            <th>병원명</th>
            <th>주소</th>
            <th>전화번호</th>
         </tr>
      </thead>     
      <tbody>
      <c:forEach var="vo" items="${ar}">
         <tr>
            <td>${vo.SIGUN_NM}</td>
            <td><a href="view.inc?LOCPLC_FACLT_TELNO=${vo.LOCPLC_FACLT_TELNO}&type=${requestScope.type}">${vo.BIZPLC_NM}</a></td>
            <td>${vo.REFINE_LOTNO_ADDR}</td>
            <td>${vo.LOCPLC_FACLT_TELNO}</td>
         </tr>
      </c:forEach>      
         </tbody>      
      
      <%-- 동물약국 --%>   
      <%}else if(request.getAttribute("type").equals("2")) { 
    	  StoreVO[] ar = (StoreVO[])session.getAttribute("ar");%>
      <thead>   
         <tr>
            <th>지역</th>
            <th>약국명</th>
            <th>주소</th>
            <th>전화번호</th>
         </tr>
      </thead>   
      <tbody>
      <c:forEach var="vo" items="${ar}">
         <tr>
            <td>${vo.SIGUN_NM}</td>
            <td><a href="view.inc?LOCPLC_FACLT_TELNO=${vo.LOCPLC_FACLT_TELNO}&type=${requestScope.type}">${vo.BIZPLC_NM}</a></td>
            <td>${vo.REFINE_LOTNO_ADDR}</td>
            <td>${vo.LOCPLC_FACLT_TELNO}</td>
         </tr>
      </c:forEach>      
         </tbody>      
      
      <%-- 유기 동물 보호시설  --%>   
      <%}else if(request.getAttribute("type").equals("3")) { 
    	  ProtectVO[] ar = (ProtectVO[])session.getAttribute("ar");%>
      <thead>   
         <tr>
            <th>지역</th>
            <th>기관명</th>
            <th>주소</th>
            <th>전화번호</th>
         </tr>
      </thead>   
      <tbody>
      <c:forEach var="vo" items="${ar}">
         <tr>
            <td>${vo.SIGUN_NM}</td>
            <td><a href="view.inc?ENTRPS_TELNO=${vo.ENTRPS_TELNO}&type=${requestScope.type}">${vo.ENTRPS_NM}</a></td>
            <td>${vo.REFINE_LOTNO_ADDR}</td>
            <td>${vo.ENTRPS_TELNO}</td>
         </tr>
      </c:forEach>
 
         </tbody>  
  
             
      <% }%>
	
         <tfoot id="tfoot">
         	 <tr>
         	 	<td colspan="4">
      		${pageCode }
      			</td>
      		</tr>		
     
         </tfoot>
      
        
   </table>
   </div> 
   </div>
	
	<form action="search.inc" method="post" name="search_form">
		<input type="hidden" id="search_value" name="search_value"/>
		<input type="hidden" id="search_type" name="search_type"/>
		<input type="hidden" name="s_type" value='<%=request.getAttribute("type")%>'/>
	</form>
  	
   <script src="resources/js/jquery-3.4.1.min.js"></script>
   <script>
   		function bbs(type) {
			document.location.href="main.inc?s_type=" + type;
		}
   		
		function search() {
			var val = $("#searchValue").val();
			var index = $("#searchSelect option").index($("#searchSelect option:selected"));
			if(val.trim().length < 1) {
				alert("검색값을 입력해주세요.");
				return;
			}
			$("#search_type").attr('value', index);
			$("#search_value").attr('value', val);
			search_form.submit();
		}
   </script>
</body>
</html>