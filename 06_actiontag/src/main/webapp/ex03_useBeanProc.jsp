<%@page import="com.mystudy.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03_useBeanProc.jsp</title>
</head>
<body>
	<h1>[ ex03_useBeanProc.jsp ]</h1>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>	

	<h2>일반적인 파라미터 처리 방식</h2>
	<h2>이름 : <%=name %>(local variable)</h2>
	<h2>나이 : <%=age %>(local variable)</h2>
	<hr>
<%
	request.setAttribute("req_name", name + "(attr)");
	request.setAttribute("req_age", age + "(attr)");
%>	
	<h2>속성(attribute)을 이용해서 저장 사용</h2>
	<h2>이름 : <%=request.getAttribute("req_name") %></h2>
	<h2>나이 : <%=request.getAttribute("req_age") %></h2>
	<hr><hr>
	
	<%-- ================= useBean 액션태그 ==================== --%>
	<%-- 자바빈(Bean)을 이용해서 파라미터 값 저장 사용 --%>
	<%-- <% //아래의 useBean 액션태그 동작방식
	PersonVO person = (PersonVO)request.getAttribute("person");
	if (person == null) {
		person = new PersonVO();
		request.setAttribute("person", person);
	}
	%> --%>
	<jsp:useBean id="person" class="com.mystudy.PersonVO" scope="request"/>
	<jsp:setProperty property="*" name="person"/>
	<%-- <jsp:setProperty property="name" name="person"/>
	<jsp:setProperty property="age" name="person"/> --%>
<%
	System.out.println("person : " + person);
	System.out.println("request person : " + request.getAttribute("person"));
%>	
	<h2>빈(Bean) 저장값 표시</h2>
	<h2>이름(표현식) : <%=person.getName() %></h2>
	<h2>나이(표현식) : <%=person.getAge() %></h2>
	<hr>
</body>
</html>