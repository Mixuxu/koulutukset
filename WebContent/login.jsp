<%@ page language="java"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta http-equiv="X-UA-Compatible" content="IE=8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<title>Login -sivu</title>
</head>
<body>

<c:if test="${not empty loginerror}">
		<p class="Error">Sisäänkirjautuminen epäonnistui. Käyttäjätunnus tai salasana on syötetty väärin.</p>
	</c:if>

	<c:if test="${not empty loggedout}">
		<p class="Info">Uloskirjautuminen onnistui</p>
	</c:if>
	
<form action="j_spring_security_check" method="post">
	<fieldset>
		<table>
		<tr><td>USERNAME:</td><td><input type='text' name='j_username' value=''></td></tr>
		<tr><td>PASSWORD:</td><td><input type='password' name='j_password' /></td></tr>
		<tr><td>&nbsp;</td><td><button type="submit">Kirjaudu</button></td>
		
		</table>
	</fieldset>
	</form>
</body>
</html>