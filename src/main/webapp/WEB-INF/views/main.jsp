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
            <td><a href="view.inc?RESCUE_INST_TELNO=${vo.RESCUE_INST_TELNO}&type=${request.type}">${vo.RESCUE_INST_NM}</a></td>
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
            <td><a href="view.inc?LOCPLC_FACLT_TELNO=${vo.LOCPLC_FACLT_TELNO}&type=${request.type}">${vo.BIZPLC_NM}</a></td>
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
            <td><a href="view.inc?LOCPLC_FACLT_TELNO=${vo.LOCPLC_FACLT_TELNO}&type=${request.type}">${vo.BIZPLC_NM}</a></td>
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
            <td><a href="view.inc?ENTRPS_TELNO=${vo.ENTRPS_TELNO}&type=${request.type}">${vo.ENTRPS_NM}</a></td>
            <td>${vo.REFINE_LOTNO_ADDR}</td>
            <td>${vo.ENTRPS_TELNO}</td>
         </tr>
      </c:forEach>      
         </tbody>      
      <%} %>
      
   </table>
   </div>
   
   
   
   
   </div>
</body>
</html>