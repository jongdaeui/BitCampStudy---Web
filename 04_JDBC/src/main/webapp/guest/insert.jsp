<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- (실습) 전달받은 데이터를 이용해서 DB에 입력처리
	 정상입력 : list.jsp페이지로 이동
	 예외발생 : 현재페이지 오류메세지 보여주기
--%>
<%
	// 파라미터 값 추출
	int id = Integer.parseInt(request.getParameter("id"));
	String name = (String)request.getParameter("name");
	int salary = Integer.parseInt(request.getParameter("salary"));
	
	// DB 입력 작업
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 사용할 SQL 쿼리 작성
	String sql = "";
	sql += "INSERT INTO GUEST99 VALUES (?, ?, SYSDATE, ? )";
	int result = 0;
	try {
		// 드라이버 로딩
		Class.forName(DRIVER);
		// DB 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		// Statement 객체 생성(Connection객체로부터)
		pstmt = conn.prepareStatement(sql);
		// 쿼리실행
		pstmt.setInt(1, id);
		pstmt.setString(2, name);
		pstmt.setInt(3, salary);
		result = pstmt.executeUpdate();
		// 쿼리실행 결과 처리
	} catch (Exception e) {
		result = -1;
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 페이지 이동처리
	if (result > 0) {
		response.sendRedirect("list.jsp");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 등록</title>
</head>
<body>
	<h1>사원정보 등록 실패</h1>
	<p>등록처리를 완료하지 못했습니다.<br>
	담당자에게 문의하세요</p>
	<a href="detail.jsp">상세페이지로 이동</a>
	<a href="list.jsp">목록으로 이동</a>
</body>
</html>