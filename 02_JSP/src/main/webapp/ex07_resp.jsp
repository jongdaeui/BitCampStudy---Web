<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터 화면에 표시 --%>   
<%
	// 요청정보(request)로부터 파라미터 값 추출(확인)
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String[] hobbies = request.getParameterValues("hobby");
	if (hobbies == null) {
		hobbies = new String[] {"선택사항없음"};
	}
	// 요청자의 브라우저 화면에 출력(ul)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 데이터</title>
</head>
<body>
	<h1>회원가입 정보</h1>
	<ul>
		<li>이름 : <%=name %></li>
		<li>아이디 : <%=id %></li>
		<li>암호 : <%=pwd %></li>
		<li>이메일 : <%=email %></li>
		<li>취미(배열값) : <%=hobbies %></li>
		<li>취미(개별값) : 
		<%
			for (String str : hobbies) {
				out.print(str + " ");
			}
		%>
		</li>
	</ul>
	<hr><hr>
	<h2>out.print 사용해서 출력</h2>
	<ol>
	<%
		for (String str : hobbies) { 
			out.print("<li>" + str + "</li>");
		}
	%>		
	</ol>
	<h2>표현식으로 출력</h2>
	<ol>
	<%
		for (String str : hobbies) { %>
			<li><%=str %></li>
	<%
		}
	%>		
	</ol>
</body>
</html>