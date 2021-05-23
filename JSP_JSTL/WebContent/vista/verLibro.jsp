<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Libro</title>
</head>
<body>
	
	<!-- Verificando encoding de los datos recibidos -->
	<fmt:requestEncoding value="UTF-8"/>
	
	<!-- Se saluda al último usuario inscrito -->
	<h1>Hola  ${nombreLibro}!</h1>

	<!-- Se muestran las listas -->
	<p>Este es el contenido del libro:</p>
			
	<ul>
	
		<c:forEach var="elementoLibro" items="${arregloLibro}">
				<li><c:out value="${elementoLibro}"/></li>			
			
		</c:forEach>

	</ul>		

</body>
</html>