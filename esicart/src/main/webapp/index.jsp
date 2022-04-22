<!doctype html>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.helper.FactoryProvider"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@include file="components/common.jsp" %>
<link href="css/style.css" rel="stylesheet">


<title>Hello, world!</title>
</head>
<body>

<%@include file="components/navbar.jsp" %>
	<h1>Hello, world!</h1>

	<h2>Creating Session Factory</h2>
	<%
	SessionFactory factory = FactoryProvider.getFactory();
	out.println(factory);
	%>
<br><br><br>


	<%@include file="components/footer.jsp" %>

</body>
</html>