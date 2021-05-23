<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Firmar petición</title>
</head>
<body>

	<h1>Escribe tus datos:</h1>

	<form action="${pageContext.request.contextPath}/vista/AnhadirFirma.jsp" method="post">
	
		<label for="nombre">¿Cuál es tu nombre?</label>
		<input type="text" name="nombre" id="nombre"/><br>

		<label for="correo">¿Cuál es tu e-mail?</label>
		<input type="text" name="correo" id="correo"/><br>	

		<input type="submit" name="enviar" value="Enviar"/>

	</form>

</body>
</html>