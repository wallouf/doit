<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.theme.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/doit.generic.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
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

    <title>Do It: Register a new account</title>
    
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="/doit/">Do It!</a>
        </div>
      </div><!-- /.container -->
    </nav><!-- /.navbar -->

	<div class="container-fluid">
		<div class="row">

      <form class="form-signin" role="form"  modelAttribute="creation" method="post" action="register">
        <h2 class="form-signin-heading">Register a new account</h2>
        <input name="name" type="text" class="form-control" placeholder="Account name" required autofocus>
        <input name="email" type="email" class="form-control" placeholder="Email address" required>
        <input name="password" type="password" class="form-control" placeholder="Password" required>
        <input name="passwordBis" type="password" class="form-control" placeholder="Confirm password" required>
        <br>
        <c:if test="${ !empty formErrors }">
        	<c:forEach items="${formErrors }" var="error">
        		<c:if test="${ !empty error }">
		      		<div class="alert alert-danger alert-dismissible" role="alert">
			      		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			      		<spring:message code="${error }" />
		      		</div>
        		</c:if>
        	</c:forEach>
        </c:if>
        <c:if test="${ !empty serviceErrors }">
        	<c:forEach items="${serviceErrors }" var="error">
        		<c:if test="${ !empty error }">
		      		<div class="alert alert-warning alert-dismissible" role="alert">
			      		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			      		<spring:message code="${error }" />
		      		</div>
        		</c:if>
        	</c:forEach>
        </c:if>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
      </form>

    	</div>
    </div>
  </body>
</html>