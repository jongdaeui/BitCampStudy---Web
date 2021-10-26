<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- DB연결하고 프로그램 사용해서 사번 구하기(가장 큰 사번 + 1111 자동생성) --%>    
<%
	// JDBC 프로그램 사용해서 사번 구하기
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 사용할 SQL 쿼리 작성
	String sql = "SELECT NVL(MAX(ID),0) + 1111 AS ID FROM GUEST ";
	int id = 0;
	
	try {
		// 드라이버 로딩
		Class.forName(DRIVER);
		// DB 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		// Statement 객체 생성(Connection객체로부터)
		pstmt = conn.prepareStatement(sql);
		// 쿼리실행
		rs = pstmt.executeQuery();
		// 쿼리실행 결과 처리
		if (rs.next()) {
			id = rs.getInt("ID");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		// close
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원등록</title>
</head>
<body>
	<h1>사원등록</h1>
	<form action="insert.jsp">
		<table>
			<tr>
				<th>사번</th>
				<td>
					<input type="text" name="id" value="<%=id %>" readonly>
				</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>
					<input type="text" name="name">
				</td>
			</tr>
			<tr>
				<th>금액</th>
				<td>
					<input type="text" name="salary">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="사원등록">
					<input type="reset" value="초기화">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>