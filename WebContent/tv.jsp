<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <style>

body {
	margin:0;
	font-family: 'Open Sans', sans-serif;
}

header {
	text-align:center;
	
}

 header img {
	float:left;
	width:150px;
	margin:0 0 0 40px;
	
}

h1 {
	font-size:2.2em;
	margin-right:170px;
	margin-top:10px;
}


h2 {
	font-size:1em;
	margin:10px 0 0 0;
}

p {
	font-size:0.8em;
	margin:0px 0 10px 0;
}

#wrapper {
	width:99%;
	padding:0 0.5%;
}


.otsikot {
	color:#fff;
	background-color:#0d69af;
	border-radius: 10px;
	-webkit-box-shadow: -1px 9px 12px -7px rgba(77,77,77,1);
	-moz-box-shadow: -1px 9px 12px -7px rgba(77,77,77,1);
	box-shadow: -1px 9px 12px -7px rgba(77,77,77,1);
	
}

.otsikot li {
	text-align:center;
	list-style:none;
	display:inline-block;
	padding:15px 0;
	font-size:1.7em;
	width:19%;
	
	
}


.sisaltouudet {
	color:#fff;
	background-color:#52c0ff;
	border-radius: 10px;
	-webkit-box-shadow: -1px 9px 12px -7px rgba(77,77,77,1);
	-moz-box-shadow: -1px 9px 12px -7px rgba(77,77,77,1);
	box-shadow: -1px 9px 12px -7px rgba(77,77,77,1);
}


.sisaltouudet li {
	text-align:center;
	list-style:none;
	display:inline-block;
	padding:12px 0;
	font-size:1.7em;
	width:19%;
}


.sisaltovanhat {
	color:#bcbcbc;
	background-color:#efefef;
	border-radius: 10px;
	-webkit-box-shadow: -1px 9px 12px -7px rgba(77,77,77,1);
	-moz-box-shadow: -1px 9px 12px -7px rgba(77,77,77,1);
	box-shadow: -1px 9px 12px -7px rgba(77,77,77,1);
}


.sisaltovanhat li {
	text-align:center;
	list-style:none;
	display:inline-block;
	padding:12px 0;
	font-size:1.7em;
	width:19%;
}


.kuvaus {
	width:40%;
	
}

.tila {
	width: 5%;
	
}



.logo {
	margin:0 auto;
	
}



img {
	
}

.teksti {
	text-align:center ;
	float:left;
	width:33.3%;
	display:inline-block;
	color:#bfbfbf;
	
}

.teksti p  {
	padding:0 20%;
}



.teksti2 {
	text-align:center ;
	width:33.3%;
	float:left;
	display:inline-block;
	color:#bfbfbf;
}

.teksti2 p  {
	padding:0px 10%;
}

.teksti2 img {
    margin:0 auto;
	width:60px;
	display:inline-block;
	filter: alpha(opacity=40);
	opacity: 0.5;
	
}

.kuvafooter {
	float:left;
	width:33.3%;
	display:inline-block;
	
	
}

.kuvafooter img {
	margin:30px auto;
	width:80px;
	filter: alpha(opacity=40);
	opacity: 0.5;
}






footer {
	
	background-color:#222;
	text-align:center;
	padding-bottom:20px;
	position:absolute;
	bottom:0;
	width:100%;

}




.otsikotmenneet {
	color:#fff;
	text-align:center;
	background-color:#0d69af;
	border-radius: 10px;
	-webkit-box-shadow: -1px 9px 12px -7px rgba(77,77,77,1);
	-moz-box-shadow: -1px 9px 12px -7px rgba(77,77,77,1);
	box-shadow: -1px 9px 12px -7px rgba(77,77,77,1);
	-webkit-padding-start: 0;
	-moz-padding-start: 0;
	-ms-padding-start: 0;
	-o-padding-start: 0;
	
	
	
}

.otsikotmenneet li {
	text-align:center;
	list-style:none;
	display:inline-block;
	padding:17px 0;
	font-size:1.7em;
	
	
	
}







/*******************************
CSS LOPPUU
*******************************/
</style>
  <title>TV</title>
  <link href='http://fonts.googleapis.com/css?family=Changa+One|Open+Sans:400italic,700italic,400,700,800' rel='stylesheet' type='text/css'>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
 </head>
<body>
<header>
		<img src="img/haagalogo.gif"></img>
		<h1>Softala3 koulutukset</h1>
		<div class="pallo"></div>
	</header>



<div id="wrapper">
	
	<ul class="otsikot">
		<li>Aihe</li>
		
		<li>Kouluttaja</li>
		<li class="tila">Tila</li>
		<li>Pvm</li>
		<li>Aika</li>
	</ul>
	
	<c:forEach items="${koulutukset}" var="koulutus">
			
	
	<ul class="sisaltouudet">
		<li><c:out value="${koulutus.aihe}" /></li>
		<li><c:out value="${koulutus.kouluttaja}" /></li>
		<li class="tila"><c:out value="${koulutus.paikka}" /></li>
		<li><c:out value="${koulutus.lopetusaikaPvm}" /></li>
		<li><c:out value="${koulutus.aloitusaikaPvm}" /></li>
	</ul>
	
	
</c:forEach>
	<ul class="otsikotmenneet">
		<li>Menneet</li>
		
		
	</ul>
	<c:forEach items="${koulutuksetM}" var="koulutus">
	
	<ul class="sisaltovanhat">
		<li><c:out value="${koulutus.aihe}" /></li>
		<li><c:out value="${koulutus.kouluttaja}" /></li>
		<li class="tila"><c:out value="${koulutus.paikka}" /></li>
		<li><c:out value="${koulutus.lopetusaikaPvm}" /></li>
		<li><c:out value="${koulutus.aloitusaikaPvm}" /></li>
	</ul>
	
	</c:forEach>
 </div>
<footer>
 <div class="teksti">
 <h2>Lis‰tietoja</h2>
 <p>Ohjelmistokehitt‰jien Softala 3 -kurssin opiskelijoiden j‰rjest‰m‰t kaikille avoimet koulutustilaisuudet.</p> 
 </div>
 <div class="kuvafooter">
 <img src="img/logo3.gif"></img>
 </div>
 <div class="teksti2">
 <h2>Lis‰‰ koulutus t‰‰lt‰: </h2>
 <p>http://goo.gl/Omxgrj</p>
 <img src="img/qrcode.svg"></img>
 

</div>
 </footer>
</body>
</html>	