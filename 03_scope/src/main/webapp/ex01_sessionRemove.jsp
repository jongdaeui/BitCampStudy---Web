<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션에 설정된 속성 삭제 --%>    
<%
	// 속성 삭제
	session.removeAttribute("attr_name");
// 	session.removeAttribute("attr_age"); // 속성 삭제
// 	session.setAttribute("attr_age", ""); // 삭제가 아닌 빈 문자열로 변경
	
	// 재요청 처리
	response.sendRedirect("ex01_session.jsp");
%>
