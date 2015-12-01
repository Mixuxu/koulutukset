<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="60" >

<style>

html {
 -ms-word-break: break-all;
     word-break: break-all;
 
-webkit-hyphens: auto;
   -moz-hyphens: auto;
        hyphens: auto;

}
	table {
	text-align:left;
	
}

table td {

}

	table.ex1 {margin-left:10px; margin:right: 10px;}
   table.ex1 {border-spacing: 0}
   table.ex1 td, th {padding: 0 0.2em}
   table.ex1 tr:nth-child(odd) {color: #000; background: #FFF}
   table.ex1 tr:nth-child(even) {color: #000; background: 	#8DB9CC;}
 
.aika {
 	width:170px;
} 
.aihe {
		width:350px;
}
.paikka {
		width:290px;
}
.kuvaus{
		width:600px;
}
.kouluttaja{
		width:400px;
}
 
 
a {
	text-decoration:none; 
	color:000000;   
}


h1 {
	font-size:1.7em;
}


p {font-size:1.7em;
}



body{    
    margin-left: 0px;
    padding-top: 0px;
	font-family: 'Open Sans', sans-serif;
	
}




#logo {
	width:200px;
	float:left;
	position:fixed;
	padding:10px;
}

#tulevatPohja{
	border-bottom: 1px solid black;
}

#menneet{
	text-align: center;
}

#vari{
	color: grey;

}


/*******************************
FOOTER
*******************************/

footer {

   position:fixed;
   left:0px;
   bottom:0px;
   height:auto;
   width:100%;
	background-color:#dbdbdb;
	text-align:center;
	
	
	
}



footer p {
	font-size:1em;
	/* text-align:center; */
	padding:0px;
}

#qr{
width: 30%;
padding-left: 3px;
padding-top: 3px;
}

#qr_div{
width:20%;
float:right;
}

#qr_kuva{
 width:100px;
 -webkit-margin-before: 0.83em;
 -webkit-margin-after: 0.83em;
 -webkit-margin-start: 0px;
-webkit-margin-end: 0px;}

#oujea{
width:900px;
margin:auto;}

#qr_teksti{
width:80%;
float:left;}


/*******************************
CSS LOPPUU
*******************************/
</style>



<title>Koulutuslista</title>
</head>
<body>

<img src="img/logohaaga.gif" id="logo">


<br></br>
<br></br>



	<table class=ex1 id=tulevatPohja>
	

		
		<tr>
			<th><h1>Aihe</h1></th>
			<th><h1>Kuvaus</h1></th>
			<th><h1>Kouluttaja</h1></th>
			<th><h1>Tila</h1></th>
			<th><h1>Aika</h1></th>
			<th><h1>Pvm</h1></th>
		</tr>




		<c:forEach items="${koulutukset}" var="koulutus">
			<tr>

				<td class="aihe"><p><c:out value="${koulutus.aihe}" /></p></td>
				<td class="kuvaus"><p><c:out value="${koulutus.kuvaus}" /></p></td>
				<td class="kouluttaja"><p><c:out value="${koulutus.kouluttaja}" /></p></td>
				<td class="paikka"><p><c:out value="${koulutus.paikka}" /></p></td>
				<td class="aika"><p><c:out value="${koulutus.aloitusaikaPvm}" /></p></td>
				<td class="aika"><p><c:out value="${koulutus.lopetusaikaPvm}" /></p></td>
				
			</tr>
		</c:forEach>
	</table>
	
	<table class=ex1 >
	
	<h1 id="menneet">Menneet koulutukset</h1>
		
	<c:forEach items="${koulutuksetM}" var="koulutus">			<tr>
				<td class="aihe" id="vari"><p><c:out value="${koulutus.aihe}" /></p></td>
				<td class="kuvaus" id="vari"><p><c:out value="${koulutus.kuvaus}" /></p></td>
				<td class="kouluttaja" id="vari"><p><c:out value="${koulutus.kouluttaja}" /></p></td>
				<td class="paikka" id="vari"><p><c:out value="${koulutus.paikka}" /></p></td>
				<td class="aika" id="vari"><p><c:out value="${koulutus.aloitusaikaPvm}" /></p></td>
				<td class="aika" id="vari"><p><c:out value="${koulutus.lopetusaikaPvm}" /></p></td>
				
			</tr>
		</c:forEach>
	</table>
	



<footer>
<div id="oujea">
<div id="qr_teksti">
<h2>Ohjelmistokehittäjien Softala 3 -kurssin opiskelijoiden järjestämät kaikille avoimet koulutustilaisuudet.<br> Lisätietoa osoitteessa http://proto58.haaga-helia.fi/koulutukset/secure/lomake <br> Käyttäjätunnus: admin Salasana: admin
</h2>
</div>
<div id="qr_div">
 <img src="img/qrcode.png" id="qr_kuva" >
 </div>
</div>

</footer>

</body>
</html>
