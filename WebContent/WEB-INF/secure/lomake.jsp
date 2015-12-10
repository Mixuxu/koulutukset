<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta http-equiv="X-UA-Compatible" content="IE=8">
<meta http-equiv="X-UA-Compatible" content="IE=7">
<LINK REL="SHORTCUT ICON" href="img/icon.gif"></LINK>
<link
	href='http://fonts.googleapis.com/css?family=Changa+One|Open+Sans:400italic,700italic,400,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css"
	href="../css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/responsive.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ohjelmistokehitys | koulutukset</title>
<script src="../js/jquery.min.js"></script>
<script src="../js/moment-with-locales.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
<script src="../js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="../js/modernizr.custom.79639.js"></script>
<script src="../js/drop.js"></script>
<script type="text/javascript">
		var d = new Date();
			$(function() {
				$('#datetimepicker1').datetimepicker({
					locale : 'fi',
					inline : true,
					sideBySide : true,
					format : "YYYY-MM-DD HH:mm",
					defaultDate: d,
					minDate : d
				});
			});
		</script>
<noscript>
	<link rel="stylesheet" type="text/css" href="../css/noJS.css" />
</noscript>

</head>
<body>


	<header>

		<a href="../"><img src="../img/logohaaga.gif" id="logo"></a>

		<nav>
			<ul id="bootstrapNaviFixi" >
				<li><a href="../kaikki">KOULUTUKSET</a></li>
				<li><a href="hallinta">HALLINTA</a></li>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="../j_spring_security_logout">KIRJAUDU ULOS</a></li>
				</sec:authorize>
			</ul>

		</nav>
	</header>

	<div id="alkukuva">
		<h2 class="bootstrapOtsikkoFixi" id="otsikkoFonttiKoko">LUO KOULUTUS</h2>
	</div>


	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div class="form">
			<h1 class="bootstrapOtsikkoFixi">KOULUTUKSEN LUONTI</h1>
			<div id="wrapper2">
				<%-- action menee controllerissa @RequestMapping jossa value="lomake" --%>
				<form:form method="POST" action="lomake" commandName="koulutus">
					<fieldset>
						<ul class="form-style-1">
							<li><label>AIHE</label> <form:input path="aihe"
									class="field-divided" placeholder="Aihe" maxlength="30" /></li>
							<li class="errors"><form:errors path="aihe" /></li>
							<li style="display:none"><label>KUVAUS</label> <form:input path="kuvaus"
									class="field-divided" value="kuvaus" placeholder="Kuvaus" maxlength="100" /></li>
							<li class="errors"><form:errors path="kuvaus" /></li>
							<li><label>KOULUTTAJA</label> <form:input path="kouluttaja"
									class="field-divided" placeholder="Kouluttaja" maxlength="30" /></li>
							<li class="errors"><form:errors path="kouluttaja" /></li>
							<li><label>OPETTAJA</label> <form:input path="opettaja"
									class="field-divided" placeholder="Opettaja" maxlength="30" /></li>
							<li class="errors"><form:errors path="opettaja" /></li>
							<li><label>PAIKKA</label> <form:input path="paikka"
									class="field-divided" placeholder="Paikka" maxlength="30" /></li>
							<li class="errors"><form:errors path="paikka" /></li>
							<!-- Wanha tyyli
 <input type="text" name="aloitusaikaPvm" class="field-divided" placeholder="1970-01-30 12:12:12" 
	pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31)) (0[0-9]|1[0-9]|2[0-3])(:[0-5][0-9]){2}"
	required/></li> -->

							<li><label>ALOITUSAIKA</label> <%-- <div id="datetimepicker1" class="input-append date">
									<form:input data-format="yyyy-MM-dd hh:mm"
										path="aloitusaikaPvm" readOnly="true" class="field-divided" />
									<span class="add-on"> <i data-time-icon="icon-time"
										data-date-icon="icon-calendar" class="icon"> </i>
									</span>
								</div> <script type="text/javascript">
									var d = new Date();
									var month = d.getMonth();
									var day = d.getDate();
									var year = d.getFullYear();

									$(function() {

										$('#datetimepicker1').datetimepicker({
											language : 'fi',
											pickSeconds : false,
											minDate : d

										});
										$("#datetimepicker1").data(
												'datetimepicker').setLocalDate(
												new Date(year, month, day, 08,
														00));

									});
								</script> --%>
								<div style="overflow:hidden;">
								<div  id='datetimepicker1'>
									<form:input type="hidden" path="aloitusaikaPvm"  /> <!--  <span
										class="input-group-addon"  >
- 										 <span 
								class="glyphicon glyphicon-calendar"></span> 
									</span> -->
								
		
		</div>
</div>

		</li>


		<li><form:errors path="aloitusaikaPvm" /></li>

		<!-- <li><label>LOPETUSAIKA</label> -->
		<!-- Wanha tyyli 
					<input type="text"
			name="lopetusaikaPvm" class="field-divided"
			placeholder="1970-01-30 12:12:12"
			pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31)) (0[0-9]|1[0-9]|2[0-3])(:[0-5][0-9]){2}"
			required /></li> -->

		<!-- valuet millisekunteina -->
		<li><label>KESTO</label> <form:select class="field-divided"
				path="lopetusaikaPvm">
				<form:option value="1800000">30min</form:option>
				<form:option value="3600000">1h</form:option>
				<form:option value="5400000">1h 30min</form:option>
				<form:option value="7200000">2h</form:option>
				<form:option value="9000000">2h 30min</form:option>
				<form:option value="10800000">3h</form:option>
			</form:select></li>
		<li><form:errors path="lopetusaikaPvm" /></li>

		<li><input type="submit" value="Lähetä" /></li>
		</ul>
		</fieldset>
		</form:form>
		</div>
	</sec:authorize>


	<footer>
		<img src="../img/logohaaga.gif">
		<p>Copyright 2015 HAAGA-HELIA ammattikorkeakoulu</p>
	</footer>
</body>
</html>
