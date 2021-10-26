<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 파라미터 값을 자바빈(Bean) VO에 담고 저장하고 사용 --%>
<%
	// 한글 처리
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="vo" class="com.mystudy.MemberVO" />
	<jsp:setProperty property="*" name="vo" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL param 사용</title>
</head>
<body>
	<h2>EL 사용해서 form 데이터 표시(param, paramValues)</h2>
	<p>아이디 : ${param.id }</p>
	<p>암호 : ${param.pwd }</p>
	<p>이름 : ${param.name }</p>
	<p>성별 : ${param.gender }</p>
	<p>취미 : ${param.hobby }</p>
	<p>취미(배열객체 hobby) : ${paramValues.hobby }</p>
	
	<p>취미(배열데이터) :
		${paramValues.hobby[0] }
		${paramValues.hobby[1] }
		${paramValues.hobby[2] }
		${paramValues.hobby[3] }
	</p>
</body>
</html>