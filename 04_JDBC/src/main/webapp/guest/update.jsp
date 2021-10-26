<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(파라미터)를 이용해서 DB에 수정 처리
	 수정할 데이터 : 성명, 금액, 날짜(SYSDATE)
	 정상입력 : list.jsp 페이지로 이동
	 예외발생 : 현재 페이지 오류메세지 표시 --%>    

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	int result = 0;
	int id = 0;
	String name = "";
	int salary = 0;
	
	try {
		id = Integer.parseInt(request.getParameter("id"));
		name = request.getParameter("name");
		salary = Integer.parseInt(request.getParameter("salary"));
		
		// DB 입력 작업
		final String DRIVER = "oracle.jdbc.OracleDriver";
		final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		final String USER = "mystudy";
		final String PASSWORD = "mystudypw";
		
		String sql = "";
		sql += "UPDATE GUEST ";
		sql += "   SET NAME = ?, ";
		sql += "       SALARY = ?, ";
		sql += "       REGDATE = SYSDATE ";
		sql += " WHERE ID = ? ";
	
		// 드라이버 로딩
		Class.forName(DRIVER);
		// DB 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		// Statement 객체 생성(Connection객체로부터)
		pstmt = conn.prepareStatement(sql);
		// 쿼리실행
		pstmt.setString(1, name);
		pstmt.setInt(2, salary);
		pstmt.setInt(3, id);
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
		response.sendRedirect("detail.jsp?id=" + id);
	}

%>	 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<h1>사원정보 수정 실패</h1>
	<p>수정처리를 완료하지 못했습니다.<br>
	담당자에게 문의하세요</p>
	<a href="detail.jsp?id=<%=id %>">상세페이지로 이동</a>
	<a href="list.jsp">목록으로 이동</a>
</body>
</html>