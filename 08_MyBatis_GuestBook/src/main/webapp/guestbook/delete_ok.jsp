<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.helloworld.mybatis.DBService"%>
<%@page import="com.helloworld.mybatis.GuestbookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(암호)와 DB저장 암호 일치여부 확인 후 처리
	비교값 : 전달받은 pwd 파라미터 값과 session에 있는 vo에 담긴 pwd값과 비교 
	일치시 : DB데이터 삭제 후 목록 페이지로 이동
	불일치시 : 메세지 출력 후 이전 페이지로 이동
--%>    
<%
	request.setCharacterEncoding("UTF-8");

	String pwd = request.getParameter("pwd");
	
	GuestbookVO vo = (GuestbookVO)session.getAttribute("guestbookVO");
	System.out.println("param pwd : " + pwd + ", vo : pwd : " + vo.getPwd());
	
	// 암호 일치여부 확인
	if (pwd.equals(vo.getPwd())) { 
		// 암호가 일치하는 경우 - DB데이터 삭제처리 후 목록페이지로 이동
		SqlSession ss = DBService.getFactory().openSession(true);
		try {
			ss.delete("guestbook.delete", vo);
%>
		<script>
			alert("정상삭제 되었습니다.")
			location.href = "list.jsp";
		</script>
<%
			
		} catch (Exception e) {
%>
		<script>
			alert("예외발생!! 삭제에 실패하였습니다.");
			history.back();
		</script>
<%
		} finally {
			ss.close();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지</title>
</head>
<body>
<script>
	alert("암호를 확인하세요");
	history.back();
</script>
</body>
</html>