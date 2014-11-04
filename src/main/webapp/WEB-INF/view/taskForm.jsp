<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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

    <title>Do It: Add a new task</title>
    
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

      <form class="form-signin" role="form"  modelAttribute="creation" method="post" action="createTask">
        <h2 class="form-signin-heading">Add a new task</h2>
        <input tabindex="1" name="name" type="text" class="form-control" placeholder="Task name" required autofocus>
        <textarea tabindex="2" rows="5" name="description" class="form-control" placeholder="Task description"></textarea>
        <div class="input-group" style="background-color:#FFF;">
		  <input type="text" class="form-control" name="deadline_TEST" placeholder="Deadline date" readonly>
		  <span class="input-group-btn">
		    <button class="btn btn-primary form-control" type="button"><span class="glyphicon glyphicon-calendar"></span></button>
		  </span>
		</div>
        <div class="checkbox">
		  <label class="checkbox">
		     <input name="notification" value="notification" type="checkbox"> Notifications ?
		  </label>
		</div>
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
        <button class="btn btn-lg btn-success btn-block" type="submit"><span class="glyphicon glyphicon-plus"></span> Add</button>
        <a href="<c:url value="/" />" class="btn btn-lg btn-danger btn-block"><span class="glyphicon glyphicon-remove"></span> Cancel</a>
      </form>

    	</div>
    </div>
  </body>
</html>