package com.mystudy.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sungjuk")
public class Ex05 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// (실습) 전달받은 데이터를 연산처리 후 결과를 응답
		// 1. 전달받은 데이터(파라미터) 값 추출
		// 2. 연산처리(총점, 평균 구하기)
		// 3. 응답처리(브라우저쪽으로)
		System.out.println(">> Ex05.doGet() 실행~~");
		response.setContentType("text/html;charset=UTF-8");
		
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		int total = kor + eng + math;
		double avg = total * 100 / 3 / 100.0;
		
		System.out.println(name);
		System.out.println(kor);
		System.out.println(eng);
		System.out.println(math);
		System.out.println(total);
		System.out.println(avg);
		
		PrintWriter out = response.getWriter();
		
		out.println("<h3>성적처리결과</h3>");
		out.println("<hr><hr>");
		out.println("<table border>");
		out.println("<tr><th>이름</th><td>" + name + "</td></tr>");
		out.println("<tr><th>국어</th><td>" + kor + "</td></tr>");
		out.println("<tr><th>영어</th><td>" + eng + "</td></tr>");
		out.println("<tr><th>수학</th><td>" + math + "</td></tr>");
		out.println("<tr><th>총점</th><td>" + total + "</td></tr>");
		out.println("<tr><th>평균</th><td>" + avg + "</td></tr>");
		out.println("</table>");
		
;		
	}

}
