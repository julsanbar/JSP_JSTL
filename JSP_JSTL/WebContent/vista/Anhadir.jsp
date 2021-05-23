<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Añadir</title>
</head>
<body>
	
	<!-- Verificando encoding de los datos recibidos -->
	<fmt:requestEncoding value="UTF-8"/>

	<!-- Creación de las variables -->
	<c:set var="nombreAnadir" value="${sessionScope.nombreFirma}"/>	
	<c:set var="correoAnadir" value="${sessionScope.correoFirma}"/>
		
	<!-- Se saluda al último usuario inscrito -->
	<h1>Hola  ${nombreAnadir}!</h1>

	<!-- Se crea una lista iterable de nombres y correos -->
	<c:set var="firmaLibro" value="${nombreAnadir.concat('(').concat(correoAnadir).concat(')')}"/>
	<c:set var="lista" value="${(empty lista) || (lista == null) ? firmaLibro : lista.concat('|').concat(firmaLibro) }" scope="session"/>	
	<c:set var="arreglo" value="${fn:split(lista,'|')}" />

	<!-- Creamos las variables para tenerlas en verLibro  -->
	<c:set var="nombreLibro" value="${nombreAnadir}" scope="application"/>
	<c:set var="arregloLibro" value="${arreglo}" scope="application"/>

	<!-- Se muestran las listas -->
	<p>Este es el contenido del libro:</p>
			
	<ul>
	
		<c:forEach var="elemento" items="${arreglo}">
				<li><c:out value="${elemento}"/></li>			
			
		</c:forEach>

	</ul>		


	<p><a href="${pageContext.request.contextPath}/vista/datos.jsp">Volver al formulario</a></p>


</body>
</html>