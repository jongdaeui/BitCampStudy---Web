<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	// 로그인 성공 여부 확인
	String login_chk = (String)session.getAttribute("login_chk");
	System.out.println(">>>>> login_chk : " + login_chk);
	if (login_chk == null) {
%>
	<h2>로그인</h2>
	<form action="ex02_loginProc.jsp">
		<p>아이디 : <input type="text" name="id"></p>
		<p>암호 : <input type="password" name="pwd"></p>
		<input type="submit" value="로그인">
	</form>
<%
	} else if ("ok".equals(login_chk)) { // login_chk 값이 "ok"이면 
		String id = (String)session.getAttribute("id");
		out.print("<h2>로그인 성공!!!" + id + "님. 환영합니다.!</h2>");
%>
	<a href="ex02_logout.jsp">로그아웃</a>
<%
	} else { // 로그인 실패
// 		out.print("<h2> 로그인 실패 !!! (아이디, 암호를 확인 하세요)</h2>");
		session.invalidate();
		response.sendRedirect("ex02_loginMessage.jsp");
	}
%>	
</body>
</html>