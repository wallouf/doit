<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.theme.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/doit.generic.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/com.wallouf.doit.script.js" />"></script>
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="com.example.i18n.text" />
<!DOCTYPE html>
<html lang="${language}">
  <head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Do It: About</title>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <c:import url="/WEB-INF/view/navbar.jsp" />
    <c:import url="/WEB-INF/view/alertMessages.jsp" />
	<div class="container-fluid">
		<div class="row">
		    <div class="col-xs-12 col-sm-12	">
				<div class="full-bloc-light">
				  <h2><b class="text-primary">Do It!</b> A simple application to manage all your tasks!</h2>
				</div>
				<div class="page-header">
					<h3 class="media-heading text-info">What for?</h3>
				</div>
				<p>
					<h4 class="media-heading text-primary"><b><span class="glyphicon glyphicon-pushpin"></span> Do It!</b></h4>
					<ul class="list-nostyle">
						<li><h5>Create, display and manage your tasks</h5></li>
					</ul>
					<h4 class="media-heading text-primary"><b><span class="glyphicon glyphicon-time"></span> Priorities?</b></h4>
					<ul class="list-nostyle">
						<li><h5>Manage priorities with state</h5></li>
					</ul>
					<h4 class="media-heading text-primary"><b><span class="glyphicon glyphicon-calendar"></span> Deadline?</b></h4>
					<ul class="list-nostyle">
						<li><h5>Set deadline for each task if required</h5></li>
					</ul>
					<h4 class="media-heading text-primary"><b><span class="glyphicon glyphicon-pencil"></span> CRUD as you want!</b></h4>
					<ul class="list-nostyle">
						<li><h5>Create, Display, Edit state, update or remove! You are the boss!</h5></li>
					</ul>
				</p>
				<div class="page-header">
					<h3 class="media-heading text-info">Whith what?</h3>
				</div>
				<p>
					<h4 class="media-heading text-primary"><b>Front-end</b></h4>
					<ul class="list-nostyle">
						<li>
							<span class="label label-default">#HTML5</span>
							<span class="label label-default">#CSS3</span>
							<span class="label label-default">#Bootstrap3</span>
							<span class="label label-default">#JavaScript</span>
							<span class="label label-default">#Jquery</span>
							<span class="label label-default">#JqueryUi</span>
							<span class="label label-default">#DateTimePicker</span>
							<span class="label label-default">#Ajax</span>
							<span class="label label-default">#JSTL</span>
							<span class="label label-default">#JodaTimeTags</span>
							<span class="label label-default">#SpringMessages</span>
						</li>
					</ul>
					<h4 class="media-heading text-primary"><b>Back-end</b></h4>
					<ul class="list-nostyle">
						<li>
							<span class="label label-default">#J2EE</span>
							<span class="label label-default">#Spring</span>
							<span class="label label-default">#Joda</span>
							<span class="label label-default">#Maven</span>
							<span class="label label-default">#JUnit</span>
							<span class="label label-default">#Servlet</span>
							<span class="label label-default">#Jasypt</span>
						</li>
					</ul>
					<h4 class="media-heading text-primary"><b>Database</b></h4>
					<ul class="list-nostyle">
						<li>
							<span class="label label-default">#MySQL</span>
							<span class="label label-default">#JPA</span>
							<span class="label label-default">#Hibernate</span>
							<span class="label label-default">#JDBC</span>
						</li>
					</ul>
					<h4 class="media-heading text-primary"><b>Server</b></h4>
					<ul class="list-nostyle">
						<li>
							<span class="label label-default">#Apache Tomcat</span>
						</li>
					</ul>
				</p>
				<div class="page-header">
					<h3 class="media-heading text-info">Can i take a look?</h3>
				</div>
				<p>
					<h4 class="text-primary">You can find all sources on <b><a class="text-success" href="https://github.com/wallouf/doit">Github</a></b></h4>
				</p>
				<div class="page-header">
					<h3 class="media-heading text-info">Why?</h3>
				</div>
				<p>
					<h4 class="text-primary">Done by Wallou to learn more and improve skills in J2EE.</h4>
				</p>
	     	</div>
	     </div>
	</div>
	<div class="container-fluid">
	   	<div class="row">
	    	<div class="col-xs-12 col-sm-12	">
				<hr>
				<footer>
				  <p>&copy; Wallouf 2014</p>
				</footer>
			</div>
	    </div>
	</div>
  </body>
</html>