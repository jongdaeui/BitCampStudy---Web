<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 사번으로 DB에서 조회해서 가져온 데이터 화면 표시 --%>    
<%
	// 전달받은 사번 값 추출
	String id = request.getParameter("id");
	
	// DB데이터 조회
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// DB데이터 저장용 변수
	String name = "";
	Date regDate = null;
	int salary = 0;
	
	try {
		// 드라이버 로딩
		Class.forName(DRIVER);
		// DB 연결
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		// Statement 객체 생성(Connection객체로부터)
		String sql = "";
		sql += "SELECT ID, NAME, REGDATE, SALARY ";
		sql += "  FROM GUEST ";
		sql += " WHERE ID = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(id));
		// 쿼리실행
		rs = pstmt.executeQuery();
		// 쿼리실행 결과 처리
		if (rs.next()) {
			name = rs.getString("NAME");
			regDate = rs.getDate("REGDATE");
			salary = rs.getInt("SALARY");
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
<title>상세보기</title>
</head>
<body>
	<h1>상세정보</h1>
	<table border >
		<tr>
			<th>사번</th>
			<td><%=id %></td>
		</tr>
		<tr>
			<th>성명</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=regDate %></td>
		</tr>
		<tr>
			<th>금액</th>
			<td><%=salary %></td>
		</tr>
	</table>
	<a href="editForm.jsp?id=<%=id %>&name=<%=name %>&salary=<%=salary %>">수정</a>
	<a href="delete.jsp?id=<%=id %>">삭제</a>
	<a href="list.jsp">목록보기</a>
</body>
</html>