<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	//문자열 배열 만들기
	String[] ar = { "apple", "banana", "cherry" };
	//문자열 리스트 만들기
	List<String> list = new ArrayList<>();
	list.add("pineapple");
	list.add("rich");
	list.add("orange");
	//맵 객체를 생성하고 데이터 저장
	Map<String, String> map = new HashMap<>();
	map.put("red", "apricot");
	map.put("yellow", "melon");
	map.put("green", "papaya");
	//,로 구분된 문자열 만들기
	String dr = "peach,plum,mango";

	//결과 페이지에 전달하기 위해서 데이터 저장
	request.setAttribute("ar", ar);
	request.setAttribute("list", list);
	request.setAttribute("map", map);
	request.setAttribute("dr", dr);

	//결과 페이지로 이동하기
	RequestDispatcher dispatcher = request.getRequestDispatcher("loop.jsp");
	dispatcher.forward(request, response);
%>