<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 세션을 초기화(무효화) --%>
<%
	// 세션 초기화
	session.invalidate();

	//재요청 처리
	response.sendRedirect("ex02_login.jsp");
%>