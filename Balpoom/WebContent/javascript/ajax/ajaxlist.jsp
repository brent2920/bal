<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 ajax_page   
<%
	String curr = request.getParameter("curr");
 	String list = request.getParameter("list");
 	//String[] arr =  list.split(",");
 	System.out.println(list.charAt(3));

%>
<b>전달 파람 (q:<%=curr %>)</b>