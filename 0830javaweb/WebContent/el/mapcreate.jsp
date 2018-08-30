<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Map 생성</title>
</head>
<body>
	<%@ page import="java.util.*"%>
	<%
		Map<String, Object> map = new HashMap<>();
		map.put("drink1", "Coffee");
		map.put("drink2", "Hot choco");
		map.put("oriental drink", "Green tea");

		//request.setAttribute("drink", map);

		vo.Drink drink = new vo.Drink();
		drink.setDrink1("Black tea");
		drink.setPrice(4500);
		request.setAttribute("drink", drink);

		RequestDispatcher dispatcher = request.getRequestDispatcher("mapdisplay.jsp");
		dispatcher.forward(request, response);
	%>
</body>
</html>