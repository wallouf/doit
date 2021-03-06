<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.theme.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/doit.generic.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/com.wallouf.doit.script.js" />"></script>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Do It: <spring:message code="HMI.ABOUT.TEXT.HEADER" /></title>

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
				  <h2><b class="text-primary">Do It!</b> <spring:message code="HNI.ABOUT.DESCRIPTION.SLOGAN" /></h2>
				</div>
				<div class="page-header">
					<h3 class="media-heading text-info"><spring:message code="HNI.ABOUT.DESCRIPTION.HEADER1" /></h3>
				</div>
				<p>
					<h4 class="media-heading text-primary"><b><span class="glyphicon glyphicon-pushpin"></span> <spring:message code="HNI.ABOUT.DESCRIPTION.PART1.HEADER1" /></b></h4>
					<ul class="list-nostyle">
						<li><h5><spring:message code="HNI.ABOUT.DESCRIPTION.PART1.TEXT1" /></h5></li>
					</ul>
					<h4 class="media-heading text-primary"><b><span class="glyphicon glyphicon-time"></span> <spring:message code="HNI.ABOUT.DESCRIPTION.PART1.HEADER2" /></b></h4>
					<ul class="list-nostyle">
						<li><h5><spring:message code="HNI.ABOUT.DESCRIPTION.PART1.TEXT2" /></h5></li>
					</ul>
					<h4 class="media-heading text-primary"><b><span class="glyphicon glyphicon-calendar"></span> <spring:message code="HNI.ABOUT.DESCRIPTION.PART1.HEADER3" /></b></h4>
					<ul class="list-nostyle">
						<li><h5><spring:message code="HNI.ABOUT.DESCRIPTION.PART1.TEXT3" /></h5></li>
					</ul>
					<h4 class="media-heading text-primary"><b><span class="glyphicon glyphicon-pencil"></span> <spring:message code="HNI.ABOUT.DESCRIPTION.PART1.HEADER4" /></b></h4>
					<ul class="list-nostyle">
						<li><h5><spring:message code="HNI.ABOUT.DESCRIPTION.PART1.TEXT4" /></h5></li>
					</ul>
				</p>
				<div class="page-header">
					<h3 class="media-heading text-info"><spring:message code="HNI.ABOUT.DESCRIPTION.HEADER2" /></h3>
				</div>
				<p>
					<h4 class="media-heading text-primary"><b><spring:message code="HNI.ABOUT.DESCRIPTION.PART2.HEADER1" /></b></h4>
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
					<h4 class="media-heading text-primary"><b><spring:message code="HNI.ABOUT.DESCRIPTION.PART2.HEADER2" /></b></h4>
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
					<h4 class="media-heading text-primary"><b><spring:message code="HNI.ABOUT.DESCRIPTION.PART2.HEADER3" /></b></h4>
					<ul class="list-nostyle">
						<li>
							<span class="label label-default">#MySQL</span>
							<span class="label label-default">#JPA</span>
							<span class="label label-default">#Hibernate</span>
							<span class="label label-default">#JDBC</span>
						</li>
					</ul>
					<h4 class="media-heading text-primary"><b><spring:message code="HNI.ABOUT.DESCRIPTION.PART2.HEADER4" /></b></h4>
					<ul class="list-nostyle">
						<li>
							<span class="label label-default">#ApacheTomcat</span>
						</li>
					</ul>
				</p>
				<div class="page-header">
					<h3 class="media-heading text-info"><spring:message code="HNI.ABOUT.DESCRIPTION.HEADER3" /></h3>
				</div>
				<p>
					<h4 class="text-primary"><spring:message code="HNI.ABOUT.DESCRIPTION.PART3.TEXT1" /> <b><a class="text-success" href="https://github.com/wallouf/doit">Github</a></b></h4>
				</p>
				<div class="page-header">
					<h3 class="media-heading text-info"><spring:message code="HNI.ABOUT.DESCRIPTION.HEADER4" /></h3>
				</div>
				<p>
					<h4 class="text-primary"><spring:message code="HNI.ABOUT.DESCRIPTION.PART4.TEXT1" /></h4>
				</p>
	     	</div>
	     </div>
	</div>
    <c:import url="/WEB-INF/view/footer.jsp" />
  </body>
</html>