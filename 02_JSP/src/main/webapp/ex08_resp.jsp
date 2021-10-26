<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 주문한 내역에 따라 계산하고 결과를 표시 --%>    
<%
	// (실습) 주문한 내역에 따라 계산하고 결과를 표시
	// 1. 파라미터 값 추출
	String coffee = request.getParameter("coffee");
	int count = Integer.parseInt(request.getParameter("su"));
	int money = Integer.parseInt(request.getParameter("money"));
	
	// 2. 계산처리(구입금액, 잔액)
	int coffeePrice = 0;
	int totalPrice = 0;
	int change = 0;
	
	if (coffee.equals("아메리카노")) {
		coffeePrice = 3000;
	} else if (coffee.equals("카페모카")) {
		coffeePrice = 3500;
	} else if (coffee.equals("에스프레소")) {
		coffeePrice = 2500;
	} else if (coffee.equals("카페라떼")) {
		coffeePrice = 4000;
	}
	totalPrice = (coffeePrice * count);
	change = money - totalPrice;
	// 3. 계산결과 화면출력
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문결과</title>
</head>
<body>
	<h2>주문 계산 결과(응답)</h2>
	
	커피 종류 : <%=coffee %><br>
	음료 가격 : <%=coffeePrice %>원<br>
	구매 수량 : <%=count %>개<br>
	구입 금액 : <%=totalPrice %>원<br>
	----------------------------<br>
	입금액 : <%=money %>원<br>
	잔액 : <%=change %>원<br>
	<hr><hr>
	
	<%
	out.print("커피 종류 : " + coffee + "<br>음료 가격 : " + coffeePrice + "원<br>구매 수량 : " + count + "개<br>구입 금액 : "
			 + totalPrice + "원<br>--------------------------------<br>입금액 : " + money + "원<br>잔액 : "
			+ change + "원<br>");
	%>

</body>
</html>