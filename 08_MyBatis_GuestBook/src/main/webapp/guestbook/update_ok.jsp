<%@page import="com.helloworld.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터를 사용해서 DB데이터 수정 후 화면전환
	수정성공 : 목록(상세)페이지로 이동
	수정실패 : 예외발생 메세지 출력 후 이전화면 (update.jsp) 로 이동 --%>
<%
//한글 처리
	request.setCharacterEncoding("UTF-8");
	// 파라미터 값 추출
%>    
	<jsp:useBean id="vo" class="com.helloworld.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="vo" />
<%
	System.out.println("> update_ok vo : " + vo);

	SqlSession ss = DBService.getFactory().openSession(true); // 오토커밋 설정
	try {
		ss.update("guestbook.update", vo);
		// 화면 전환 - 정상처리시
		response.sendRedirect("onelist.jsp?idx=" + vo.getIdx());
	} catch (Exception e) {
		e.printStackTrace();	
	} finally {
		ss.close();
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
<script>
	alert("[예외발생] 수정되지 않았습니다.")
	history.go(-2); // 상세화면으로 이동
</script>
</head>
<body>

</body>
</html>