<%@ page language="java"%>
<%@page pageEncoding="UTF-8"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" type="text/css" href="css/index.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta http-equiv="X-UA-Compatible" content="IE=8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<LINK REL="SHORTCUT ICON" href="img/icon.jpg">
<title>Ohjelmistokehitys | koulutukset</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link rel="stylesheet" type="text/css" href="css/animate.css">
<link href='http://fonts.googleapis.com/css?family=Changa+One|Open+Sans:400italic,700italic,400,700,800' rel='stylesheet' type='text/css'>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<header>

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


<div id="alku">
		<h2  > LÖYDÄ KOULUTUKSET</h2>

<c:if test="${not empty loggedout}">
		<p class="animated fadeInDown" style="color:white">Uloskirjautuminen onnistui</p>
	</c:if>
 <p><a id="link" href="#"><img src="img/logowhite.gif" id="alkulogo"></a></p>
 
</div>




<div id="alkuteksti">

<h1>Softalan koulutukset</h1>

<p>
Haaga-Helian Softala on ohjelmistotuotannon tehdas, jossa tuotetaan ohjelmistoja yrityksille ja yhteisöille. 
Ohjelmistoja tuotetaan tiettyjen kurssien yhteydessä, joista viimeisellä opiskelijat järjestävät itse koulutuksia erilaisista aiheista. 
Koulutusaiheita ovat olleet esimerkiksi pelikehitys, GIT-versionhallinta ja Angular.js.
<br>
<br>
Tässä järjestelmässä näytetään koulutusten aiheet, ajat ja paikat. 
Järjestelmään liittyy myös info-tv luokassa 5006 Pasilasssa, joka näyttää uusimmat tiedot. 
Lisäksi on olemassa tämä responsiivinen www-käyttöliittymä. Koulutukset ovat avoimia, kuka tahansa saa osallistuja ja saada nopeutetun alun uuden oppimiselle!
</p>

</div>
<a name="id3"/>

<div id="wrapper">

<div id="koulutukset">

<h1>KOULUTUKSET</h1>
	<a href="kaikki"><img src="img/taulu.gif"></a>
</div>



<div id="luonti">
<h1>LUO KOULUTUS</h1>
<a href="secure/lomake"><img src="img/luo.gif"></a>
</div>

</div>
<footer>
<img src="img/logohaaga.gif">
<p>Copyright &copy; <script language="JavaScript" type="text/javascript">document.write((new Date()).getFullYear());</script> HAAGA-HELIA ammattikorkeakoulu</p>
</footer>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript">
   function scrollToAnchor(aid){
    var aTag = $("a[name='"+ aid +"']");
    $('html,body').animate({scrollTop: aTag.offset().top},'slow');
}

$("#link").click(function() {
   scrollToAnchor('id3');
});

        
        
    </script>

</body>
</html>
