<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서브페이지</title>
</head>
<body>
	<h1>서브페이지</h1>
	<a href="main.jsp">메인페이지로 이동</a>
	<h2>서브페이지 내용</h2>
	<p>................</p>
	<p>................</p>
	<p>................</p>
	<p>................</p>
	<%@ include file="01_declaration.jsp" %>
	<%@ include file="02_scriptlet.jspf" %>
	<hr><hr>
	<%@ include file="footer.jsp" %>
	
	<hr>
	<footer>
	© 2021 All Rights Reserved. 주식회사 스타트링크 | 서비스 약관 | 개인정보 보호 | 결제 이용 약관 | 도움말 | 광고 문의 | 업데이트 노트 | 이슈 | TODO
	사업자 등록 번호: 541-88-00682
	대표자명: 최백준
	주소: 서울시 서초구 서초대로74길 29 서초파라곤 412호
	전화번호: 02-521-0487 (이메일로 연락 주세요)
	이메일: contacts@startlink.io
	통신판매신고번호: 제 2017-서울서초-2193 호
	이 사이트는 ACM 또는 ICPC 대회와 무관하며, ACM으로부터 승인이나 지원을 받지 않고 있습니다.
	</footer>
</body>
</html>