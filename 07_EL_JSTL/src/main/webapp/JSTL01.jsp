<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<%-- JSTL(JSP Standard Tag Library
	라이브러리 구하기
	다운로드 - mavenrepository > jstl 검색
	webapp > lib 에 jar파일 등록
	jstl 디렉티브(지시어) taglib 추가
--%>
	<h2>JSTL 사용</h2>
	<h3>속성 설정 : set</h3>
	<%-- set : 속성 선언 태그 setAttribute 역할
		<c:set var="속성명" value="속성값" scope="범위" />
		--%>
	<c:set var="test" value="Hello JSTL!!! - page" />
	<c:set var="test" value="Hello JSTL!!! - request" scope="request" />
	<c:set var="test" value="Hello JSTL!!! - session" scope="session" />
	
	<hr>
	<h3>속성값 출력 : out</h3>
	<p><c:out value="Hello World~~~" /></p>
	<p>page test : <c:out value="${pageScope.test }"></c:out>
	<p>page test(EL) : ${pageScope.test }</p>
	<p>session test(EL) : ${sessionScope.test }</p>
	
	<p>application test(EL) : ${application.test }</p>
	<p>application test(c:out) : 
		<c:out value="${application.test }" default="데이터 없음" />
	</p>
	
	<h3>삭제 : remove</h3>
	<c:remove var="test" scope="page" />
	
	<p>EL : ${test }</p>
	<p>EL(page) : ${pageScope.test }</p>
	<p>EL(request) : ${requestScope.test }</p>
	<p>EL(session) : ${sessionScope.test }</p>
	<hr><hr>
	
	<%-- ======= if 문 ========= --%>
	<h2>JSTL : if 태그 test 속성</h2>
	<%-- JSTL에는 else문이 제공되지 않음 --%>
	<c:if test="${20 > 10 }">
		<p>20 > 10결과 true인 경우 실행 문장</p>
	</c:if>
	<c:if test="${20 <= 10 }">
		<p>20 <= 10결과 인 경우 실행 문장</p>
	</c:if>
	
	<h3>JSTL : if 태그2</h3>
	<c:set var="n1" value="20"/>
	<c:set var="n2" value="20"/>
	<c:if test="${n1 > n2 }" var="result">
		<p>if문 결과 n1이 n2보다 큽니다.(result : ${result })</p>
	</c:if>
	<c:if test="${n1 <= n2 }">
		<p>if문 결과 n1이 n2보다 작거나 같습니다.(result : ${result })</p>
	</c:if>
	<hr>
	
	<%-- ===== choose ~ when ~ otherwise ===== --%>
	<h1>if문 choose문 비교 확인</h1>
	<c:set var="score" value="90"/>
	<c:if test="${score >= 90 }">
		<p>판정결과(${score }) : A</p>
	</c:if>
	<c:if test="${score >= 80 }">
		<p>판정결과(${score }) : B</p>
	</c:if>
	<hr>
	
	<h2>JSTL : choose ~ when ~ otherwise</h2>
	<c:choose>
		<c:when test="${score >= 90 }">
			<p>판정결과(${score }) : A</p>
		</c:when>
		<c:when test="${score >= 80 }">
			<p>판정결과(${score }) : B</p>
		</c:when>
		<c:when test="${score >= 70 }">
			<p>판정결과(${score }) : C</p>
		</c:when>
		<c:otherwise>
			<p>판정결과(${score }) : 노력필요</p>
		</c:otherwise>
	</c:choose>
	
	<%-- ======= 반복문 forEach ======= --%>
	<hr><hr>
	<h2>JSTL 반복문 : forEach</h2>
	<p>1~10까지의 숫자 출력</p>
	<c:forEach var="i" begin="1" end="10">
		${i }&nbsp;&nbsp;
	</c:forEach>
	<p>forEach문 종료 후 \${i } 값 출력 : ${i }</p>
	<hr>
	
	<p>1~10까지의 숫자 중 짝수 만 출력(step='1')사용</p>
	<c:forEach var="i" begin="1" end="10" step="1">
		<c:if test="${(i % 2) == 0 }">
			${i }&nbsp;&nbsp;
		</c:if>
	</c:forEach>
	
	<p>1~10까지의 숫자 중 짝수 만 출력(step='2')사용</p>
	<c:forEach var="i" begin="2" end="10" step="2">
		${i }&nbsp;&nbsp;
	</c:forEach>
	
	<%-- ==== forEach 문 집합객체 처리 ==== --%>
	<h2>forEach문 집합객체 처리</h2>
	<h3>배열값 출력 - 스크립트릿</h3>
	<%
		String[] arr = {"홍길동1", "홍길동2", "홍길동3", "홍길동4"};
		for (String name : arr) {
			out.print(name + ", ");
		}
	%>
	
	<c:set var="attr_names" value="<%=arr %>" />
	
	<h3>배열값 출력 - JSTL forEach</h3>
	<c:forEach var="name" items="${attr_names }">
		${name }, 
	</c:forEach>
	
	<%-- forTokens 태그 --%>
	<h2>forTokens태그 : 문자열 자르기</h2>
	<c:set var="names" value="홍길동/김유신/일지매,임꺽정/둘리,고길동" />
	<p>문자열 데이터 : ${names }</p>
	
	<h3>forTokens 태그 사용해서 / 구분자로 자르기</h3>
	<c:forTokens var="name" items="${names}" delims="/">
		<p>${name }</p>
	</c:forTokens>
	
	<hr>
	
	<h3>forTokens 태그 사용해서 /와 , 구분자로 자르기</h3>
	<c:forTokens var="name" items="${names}" delims="/,">
		<p>${name }</p>
	</c:forTokens>
</body>
</html>