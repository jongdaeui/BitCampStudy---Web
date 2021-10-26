<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그-include</title>
</head>
<body>
<%-- JSP 액션태그 : JSP 페이지의 흐름제어
	사용형태 : <jsp:액션명령어></jsp:액션명령어> or <jsp:액션명령어 /> (속성만 있는 경우)
 --%>
 
 	<h1>디렉티브/액션태그 - include</h1>
	<hr><hr>
	<h2>디렉티브(지시어) - include</h2>
	<%@ include file="ex01_includee.jsp" %>
	<hr>
	<%@ include file="ex01_includee1.jspf" %>
	
	<hr><hr>
	
	<jsp:include page="ex01_includee2_param.jsp" />
	
	<hr><hr>
	
	<h2>액션태그 - jsp:include 실행결과를 사용</h2>
	<jsp:include page="ex01_includee.jsp"></jsp:include>
	<hr>
	<jsp:include page="ex01_includee1.jspf"></jsp:include>
	
	<hr><hr>
	
	<h2>액션태그 - jsp:include(파라미터전달)</h2>
	<jsp:include page="ex01_includee2_param.jsp">
		<jsp:param value="김유신" name="name"/>
		<jsp:param value="30" name="age"/>
	</jsp:include>
</body>
</html>