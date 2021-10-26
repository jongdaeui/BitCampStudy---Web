<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 아이디, 암호 사용해서 로그인 처리여부 판단 --%>    
<%
	// 파라미터 값 추출(확인)
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// 아이디, 암호 확인 후 로그인 처리여부 판단
	// DB 연결 생략, id:jong, pwd:1234 이면 로그인 성공처리
	boolean loginSuccess = false;
	if ("jong".equals(id) && "1234".equals(pwd)) {
		loginSuccess = true;
	}
	
	// 로그인 성공 / 실패에 따른 처리
	if (loginSuccess) {
		session.setAttribute("login_chk", "ok");
		session.setAttribute("id", id);
	} else {
		session.setAttribute("login_chk", "fail");
	}
	System.out.println(">> login_chk : " + session.getAttribute("login_chk"));
	// 페이지 전환
	response.sendRedirect("ex02_login.jsp");
	
	
	
	
%>