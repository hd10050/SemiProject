<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap{
	width: 690px;
	margin: auto;	
	}
	
#list{
	 border:1px solid red;
	 padding: auto;
}	
	
#list table {
	    width:670px;
	   	margin: auto;
	    border-collapse:collapse;
	    font-size:14px;
	}	
	
#list table th {
	    text-align:center;
	    border:1px solid #d9f1f7;
	    padding:4px 10px;
	}
	
#list table td {
	    text-align:left;
	    border:1px solid #d9e1e8;
	    padding:4px 10px;
	  
	}
	
th{
		height: 40px;
		color: #353866;
		font-family: ‘Roboto’, ‘Spoqa Han Sans’, ‘Spoqa Han Sans JP’, ‘Sans-serif’; 
		font-size: 14px;
		font-weight: 700;
		background-color: #d9e1e8;
	
	} 
	#search{
		 border:1px solid blue;
		 margin: auto;
		  padding: 30px;
	}
	
	
	#mainImage{
		
		border:1px solid green;
	
	}
	

</style>
</head>
<body>
	
	<div id="wrap">
	
	<div id="mainImage">
		<%-- 메인 이미지 넣기 --%>
		<h1>이미지 </h1>
	
	
	</div>
	
	
	
	
	<div id="search">
	<form>
		<select name="searchSelect">   
	      <option value=""> 지역</option>
	      <option value=""> 병원명</option>
	  	</select>
	  	<input type="text" size="20" name="searchValue"/>
	  	<input type="button" value="검색" id="searchbt"/>
	</form>
	</div>
	<%-- 지도 --%>
	
	
	
	<%-- 리스트 --%>
	<div id ="list">
	<table id="list">
		<colgroup>
			<col width="66px"/>
			<col width="165px"/>
			<col width="*"/>
			<col width="105px"/>
		</colgroup>
		<%if(request.getAttribute("type").equals("0")) { %>
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
				<td><a href="view.inc?stdRestNm=${vo.RESCUE_INST_TELNO}">${vo.RESCUE_INST_NM}</a></td>
				<td>${vo.REFINE_LOTNO_ADDR}</td>
				<td>${vo.RESCUE_INST_TELNO}</td>
			</tr>
		</c:forEach>				

		</tbody>
		<%} %>
	</table>
	</div>
	
	
	
	
	</div>
</body>
</html>