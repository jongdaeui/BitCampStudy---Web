<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach varStatus</title>
</head>
<body>
<%
	List<String> list = new ArrayList<>();
	list.add("홍길동-1");
	list.add("홍길동-2");
	list.add("홍길동-3");
	list.add("홍길동-4");
	System.out.println(">> list : " + list);
	pageContext.setAttribute("alist", list);
	
%>
	<h2>forEach List 데이터 표시</h2>
	<p>List 데이터 :
	<c:forEach items="${alist }" var="listItem">
		${listItem }&nbsp;&nbsp;
	</c:forEach>
	</p> 
	<hr>
	
	<ol>
		<c:forEach var="listItem" items="${alist }" varStatus="status" begin="0" end="${alist.size() - 1 }" step="1">
			<li>
				var값 : ${listItem }<br>
				status.current : ${status.current }<br>
				status.count : ${status.count }<br>
				status.index : ${status.index }<br>
				status.first : ${status.first }<br>
				status.last : ${status.last }<br>
				
				status.begin : ${status.begin }<br>
				status.end : ${status.end }<br>
				status.step : ${status.step }<br>
				
				status : ${status }
			</li>
		</c:forEach>
	</ol>
	
	
</body>
</html>