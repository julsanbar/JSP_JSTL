<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
<meta charset="UTF-8">
<title>Añadir firma</title>
</head>
<body>
	
	<!-- Verificando encoding de los datos recibidos -->
	<fmt:requestEncoding value="UTF-8"/>
	
	
	<!-- Creación de las variables -->
	<c:set var="nombreFirma" value="${param.nombre}" scope="session"/>	
	<c:set var="correoFirma" value="${param.correo}" scope="session"/>
	<c:set var="validacion" value="true"/>
	<c:set var="espacio" value=" "/>
	<c:set var="arroba" value="@"/>
	<c:set var="punto" value="."/>
	<c:set var="indiceArroba" value="${fn:indexOf(correoFirma,arroba)}"/>
	<c:set var="indicePunto" value="${fn:indexOf(correoFirma,punto)}"/>
		
	<!-- Validación si el nombre o el correo estan vacíos -->
	<c:if test="${empty nombreFirma || nombreFirma == null}">
		
		<c:set var="validacion" value="false"/>	
	
	</c:if>
	
	<c:if test="${empty correoFirma || correoFirma == null}">
	
		<c:set var="validacion" value="false"/>	
	
	</c:if>
	
	
	<!-- Validación si el correo tiene espacios en blanco -->	
	<c:if test="${fn:indexOf(correoFirma,espacio) != -1}">
	
		<c:set var="validacion" value="false"/>
	
	</c:if>
	
	
	<!-- Validación si el correo contiene un @ antes que un punto y si el correo contiene un punto o @ -->	
	<c:if test="${(indiceArroba == -1) || (indicePunto == -1)}">
	
		<c:set var="validacion" value="false"/>
	
	</c:if>
	
	<c:if test="${indiceArroba > indicePunto}">
	
		<c:set var="validacion" value="false"/>
	
	</c:if>
	
	
	<!-- Validación si el nombre es un número y si contiene algun numero-->
	<c:catch var="errorNumero">
	
			<fmt:formatNumber value="${nombreFirma}" type="number"/>
				
	</c:catch>
	
	<c:if test="${errorNumero == null}">
		
		<c:set var="validacion" value="false"/>		
		
	</c:if>


	<!-- Verificación de que la validación del formulario es correcta y creación de la página, en caso contrario se regresa al formularío -->
	<c:choose>
	
		<c:when test="${validacion == true}">
		
			<h1>Éstos son tus datos, si quieres añadirlos al libro debes confirmar:</h1>
		
			<p>Nombre: <c:out value="${nombreFirma}" /></p>
			<p>E-mail: <c:out value="${correoFirma}" /></p>
			
			<p><a href="${pageContext.request.contextPath}/vista/Anhadir.jsp">Confirmar los datos</a> o <a href="${pageContext.request.contextPath}/vista/datos.jsp">Volver al formulario</a></p>
	
		</c:when>
		<c:otherwise>
		
			<c:redirect url="datos.jsp"/>
		
		</c:otherwise>
	</c:choose>

</body>
</html>