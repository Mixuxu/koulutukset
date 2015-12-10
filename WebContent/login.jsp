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
<title>Login-sivu</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link href='http://fonts.googleapis.com/css?family=Changa+One|Open+Sans:400italic,700italic,400,700,800' rel='stylesheet' type='text/css'>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<header>

<a  href="/koulutukset"><img src="img/logohaaga.gif" id="logo"></a>

<nav>
	<ul>
		<li><a href="/koulutukset">ETUSIVULLE</a></li>
		<li><a href="kaikki">KOULUTUKSET</a></li>
		
				
	</ul>
</nav>
</header>


	<div id="alkukuva">
<h2>KIRJAUTUMINEN</h2>

</div>

<div id="wrapper2">

<div class="loginteksti">
	<h1>TUNNUKSET</h1>
	<p>Käyttäjätunnus: admin</p>
	<p>Salasana: admin</p>
			<c:if test="${not empty loginerror}">
		<p class="errors">Sisäänkirjautuminen epäonnistui. Käyttäjätunnus tai salasana on syötetty väärin.</p>
	</c:if>
</div>


<div class="loginwrapper">
<div class="login">
<img src="img/loginkuva.gif"></img>

<form action="j_spring_security_check" method="post">
	
		<ul class="form-style-2">
			<li><input type='text' name='j_username' value='' placeholder="KÄYTTÄJÄTUNNUS"></li>
			<li><input type='password' name='j_password' value='' placeholder="SALASANA"></li>
			<li>&nbsp;<input  type="submit" value="Kirjaudu" class="nappula"></li>
		</ul>
	
	</form>
	</div>
	</div>
	</div>


	<c:if test="${not empty loggedout}">
		<p class="Info">Uloskirjautuminen onnistui</p>
	</c:if>
	
<footer>
<img src="img/logohaaga.gif">
<p>Copyright &copy; <script language="JavaScript" type="text/javascript">document.write((new Date()).getFullYear());</script> HAAGA-HELIA ammattikorkeakoulu</p>
</footer>
</body>
</html>