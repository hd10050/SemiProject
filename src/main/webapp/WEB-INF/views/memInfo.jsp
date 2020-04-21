<%@page import="com.data.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/meminfo.css">
<link rel="stylesheet" href="resources/css/login.css">
</head>
<body>


      
          <div class="panel panel-info">
            <div class="panel-heading">
              <h2 style="font-size: 35px"><span class="fa fa-user fa-1x"></span><span id=mid>&nbsp;${mvo.getM_id() }</span>님의 정보</h2>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3" align="center"> <img alt="User Pic" src="resources/image/profile2.png" width="180"> </div>
                
                <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                  <dl>
                    <dt>DEPARTMENT:</dt>
                    <dd>Administrator</dd>
                    <dt>HIRE DATE</dt>
                    <dd>11/12/2013</dd>
                    <dt>DATE OF BIRTH</dt>
                       <dd>11/12/2013</dd>
                    <dt>GENDER</dt>
                    <dd>Male</dd>
                  </dl>
                </div>-->
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td class="tdc"><span class="input-group-addon" style="text-align: left;"><span class="glyphicon glyphicon-user" style="font-size: 19px">&nbsp;아이디</span>
					                            </span></td>
                        <td>${mvo.getM_id() }</td>
                      </tr>
                      <tr>
                        <td class="tdc"><span class="input-group-addon" style="text-align: left;"><span class="glyphicon glyphicon-user" style="font-size: 19px">&nbsp;이름</span></span></td>
                        <td>${mvo.getM_name() }</td>
                      </tr>
                      <tr>
                        <td class="tdc"><span class="input-group-addon" style="text-align: left;"><span class="glyphicon glyphicon-phone"  style="font-size: 19px">&nbsp;연락처</span></span></td>
                        <td>${mvo.getM_phone() }</td>
                      </tr>
                   
                         <tr>
                             <tr>
                        <td class="tdc"><span class="input-group-addon" style="text-align: left;"><span class="glyphicon glyphicon-heart"  style="font-size: 19px">&nbsp;성별</span></span></td>
                       	<%
	                       		Object obj = session.getAttribute("mvo");
	                       		MemberVO mvo = (MemberVO)obj;    
	                       		String gender = null;
  
	                       		if(mvo.getM_gender().equals("1")){
	                       			gender = "여자";
	                       			 
	                       		}else if(mvo.getM_gender().equals("2")){
	                       			gender = "남자";	
	                       		};
	                       		
	                       	
	                     %>
                        <td><%= gender %></td>
                      </tr>
                       
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <div class="btn1">
            <a href="#" id="modibtn" class="btn btn-primary" style="font-size: 22px; position: absolute; left:650px;">수정하기</a>
            </div>
          </div> 	
      
</body>

<script src="resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
		$("#modibtn").bind("click", function() {
			
			$("#right_content").load("memchk.inc");
			
		});

</script>

</html>