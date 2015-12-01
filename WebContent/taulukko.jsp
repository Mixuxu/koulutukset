<%@ page language="java"%>
<%@page pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
	<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>


<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="css/taulukko_ilman_poista.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta http-equiv="X-UA-Compatible" content="IE=8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<meta http-equiv="refresh" content="60" >
<title>Koulutuslista</title>
<LINK REL="SHORTCUT ICON" href="img/icon.gif"></LINK>
<link href='http://fonts.googleapis.com/css?family=Changa+One|Open+Sans:400italic,700italic,400,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link rel="stylesheet" type="text/css" href="css/animate.css">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="js/modernizr.custom.79639.js"></script> 
<script src="js/drop.js"></script> 

</head>
<body>
<header>

<!-- ohjaa takaisin index.jsp -->
<a  href="/koulutukset"><img src="img/logohaaga.gif" id="logo"></a>

<nav>
	<ul>
		<li><a href="kaikki">KOULUTUKSET</a></li>
		<li><a href="secure/lomake">LUO KOULUTUS</a></li>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="j_spring_security_logout">KIRJAUDU ULOS</a></li>
				</sec:authorize>
	</ul>


</nav>
</header>


	<div id="alkukuva">
<h2>KOULUTUKSET</h2>
<c:if test="${lisays == true}">
<p class="animated slideInUp" style="color:white;text-align:center;">Koulutuksen lisääminen onnistui</p>
</c:if>
<c:if test="${poistettu == true}">
<p class="animated slideInDown" style="color:white;text-align:center;">Koulutuksen poistaminen onnistui</p>
</c:if>
</div>

	

</div>
<div id="wrapper2">

<div class="koulutuslista">
		<!-- koulutukset arraylistin tulostus -->
		<c:forEach items="${koulutukset}" var="koulutus">
		
			<div class="wrapper-dropdown-5 dd" tabindex="1"><p class="alkupalkkiaihe"><c:out value="${koulutus.aihe}" /><p class="testi"><c:out value="${koulutus.aloitusaikaPvm}" /></p>
			<ul class="dropdown">
				
				<li><a href="#"><b>Kuvaus: </b> <c:out value="${koulutus.kuvaus}" /></a></li>
				<li><a href="#"><b>Kouluttaja: </b> <c:out value="${koulutus.kouluttaja}" /></a></li>
				<li><a href="#"><b>Opettaja: </b><c:out value="${koulutus.opettaja}" /></a></li>
				<li><a href="#"><b>Paikka: </b><c:out value="${koulutus.paikka}" /></a></li>
				<li><a href="#"><b>Aloitusaika: </b><c:out value="${koulutus.aloitusaikaPvm}" /></a></li>
				<li><a href="#"><b>Lopetusaika: </b><c:out value="${koulutus.lopetusaikaPvm}" /></a></li>
				
				<!-- lähetetään controlleriin @RequestMapping value="poista" -->
				<form action="poista" method="post">
					<td><button type="submit" value="${koulutus.koulutus_id}"
							name="poistaid">Poista</button></td>
			
				
	</ul>
</div>
		</c:forEach>
		<c:forEach items="${koulutuksetM}" var="koulutus">
		
			<div class="wrapper-dropdown-5 dd wanhatkoulutukset" tabindex="1"><p class="alkupalkkiaihe"><c:out value="${koulutus.aihe}" /><p class="testi"><c:out value="${koulutus.aloitusaikaPvm}" /></p>
			<ul class="dropdown">
				
				<li><a href="#"><b>Kuvaus: </b> <c:out value="${koulutus.kuvaus}" /></a></li>
				<li><a href="#"><b>Kouluttaja: </b> <c:out value="${koulutus.kouluttaja}" /></a></li>
				<li><a href="#"><b>Opettaja: </b><c:out value="${koulutus.opettaja}" /></a></li>
				<li><a href="#"><b>Paikka: </b><c:out value="${koulutus.paikka}" /></a></li>
				<li><a href="#"><b>Aloitusaika: </b><c:out value="${koulutus.aloitusaikaPvm}" /></a></li>
				<li><a href="#"><b>Lopetusaika: </b><c:out value="${koulutus.lopetusaikaPvm}" /></a></li>
				
				<!-- lähetetään controlleriin @RequestMapping value="poista" -->
				<form action="poista" method="post">
					<td><button type="submit" value="${koulutus.koulutus_id}"
							name="poistaid">Poista</button></td>
			
				
	</ul>
</div>
		</c:forEach>
	
</div>
</div>
<footer>
<img src="img/logohaaga.gif">
<p>Copyright &copy; <script language="JavaScript" type="text/javascript">document.write((new Date()).getFullYear());</script> HAAGA-HELIA ammattikorkeakoulu</p>
</footer>

		

</body>
</html>
