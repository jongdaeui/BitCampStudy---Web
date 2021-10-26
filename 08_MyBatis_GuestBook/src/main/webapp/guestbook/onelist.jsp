<%@page import="com.helloworld.mybatis.GuestbookVO"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.helloworld.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(idx)로 DB데이터 조회 후 화면 출력 --%>    
<%
	String idx = request.getParameter("idx");

	SqlSession ss = DBService.getFactory().openSession();
	
	GuestbookVO vo = ss.selectOne("guestbook.one", idx);
	
	
	ss.close();
	session.setAttribute("guestbookVO", vo);
	System.out.println("session vo : " + session.getAttribute("guestbookVO"));
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세화면</title>
<style>
	#container {
		width: 512px; margin: auto;
/* 		border: 1px solid blue; */
	}
	
	#container h2 { text-align: center; }
	#container p { text-align: center; }
	#container table {
		width: 100%; 
		border: 1px solid black;
		border-collapse: collapse;		
	}
	#container th {
		background-color: #9cf;
		border: 1px solid black;
	}
	#container td { border: 1px solid black; }
	#container .center { text-align: center; }
	#container tfoot { text-align: center; }
</style>
<script>
	function update_go() {
		location.href="update.jsp"
	}
	
	function delete_go() {
		location.href="delete.jsp"
	}
</script>
</head>
<body>
	<div id="container">
		<h2>방명록 : 상세화면</h2>
		<p><a href="list.jsp">목록으로 이동</a></p>
		
		<table>
		<colgroup>
			<col width="50%">
			<col width="50%">
		</colgroup>
			<tbody>
				<tr>
					<th>작성자</th>
					<td>${guestbookVO.name }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${guestbookVO.subject }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${guestbookVO.email }</td>
				</tr>
				<tr>
					<td colspan="2">${guestbookVO.content }</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="수 정" onclick="update_go()">
						<input type="button" value="삭 제" onclick="delete_go()">
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>