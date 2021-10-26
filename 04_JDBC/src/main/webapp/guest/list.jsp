<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JDBC프로그램으로 DB데이터를 가져와서 화면 출력 --%>    
<%
	//JDBC프로그램을 위한 변수 선언
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 사용할 SQL 쿼리 작성
	String sql = "";
	sql += "SELECT ID, NAME, REGDATE, SALARY ";
	sql += "  FROM GUEST ";
	sql += " ORDER BY ID ";
	
	// 인원수
	int cnt = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체목록</title>
</head>
<body>
	<h1>전체목록</h1>
	<table border>
		<thead>
			<tr>
				<th>사번</th>
				<th>성명</th>
				<th>날짜</th>
				<th>금액</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
<!-- 			<tr> -->
<!-- 				<td>1111</td> -->
<!-- 				<td>USER1</td> -->
<!-- 				<td>2021/09/26</td> -->
<!-- 				<td>1000</td> -->
<!-- 				<td>상세보기</td> -->
<!-- 			</tr> -->
			
			<%
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
				while (rs.next()) { %>
					<tr>
						<td><%=rs.getInt("ID") %></td>
						<td><%=rs.getString("NAME") %></td>
						<td><%=rs.getDate("REGDATE") %></td>
						<td><%=rs.getInt("SALARY") %></td>
						<td>
							<a href="detail.jsp?id=<%=rs.getInt("ID") %>">상세보기</a>
						</td>
					</tr>
				<% }
				rs.close();
				// 전체데이터 건수 확인
				rs = pstmt.executeQuery("SELECT COUNT(*) AS CNT FROM GUEST");
				if (rs.next()) {
					cnt = rs.getInt("CNT");
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
		</tbody>
	</table>
	<p>전체인원 : <%=cnt %></p>
	<p><a href="addForm.jsp">사원등록</a></p>
</body>
</html>