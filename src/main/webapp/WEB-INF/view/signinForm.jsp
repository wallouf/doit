<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.theme.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/doit.generic.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Do It: <spring:message code="HMI.SIGNIN.TEXT.HEADER" /></title>
    
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

      <form class="form-signin" role="form" method="post" modelAttribute="connection">
        <h2 class="form-signin-heading"><spring:message code="HMI.SIGNIN.TEXT.HEADER" /></h2>
        <input name="email" type="email" class="form-control" placeholder="<spring:message code="HMI.USER.FORM.PLACEHOLDER.EMAIL" />" required autofocus>
        <input name="password" type="password" class="form-control" placeholder="<spring:message code="HMI.USER.FORM.PLACEHOLDER.PASSWORD" />" required>
	    <!-- <div class="checkbox">
	        <label class="checkbox">
	          <input type="checkbox" value="remember-me"> Remember me
	        </label>
    	</div> -->
    	<br>
        <c:if test="${ !empty formErrors }">
        	<c:forEach items="${formErrors }" var="error">
        		<c:if test="${ !empty error }">
		      		<div class="alert alert-danger alert-dismissible" role="alert">
			      		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only"><spring:message code="HMI.GENERIC.BUTTON.CLOSE" /></span></button>
			      		<spring:message code="${error }" />
		      		</div>
        		</c:if>
        	</c:forEach>
        </c:if>
        <c:if test="${ !empty serviceErrors }">
        	<c:forEach items="${serviceErrors }" var="error">
        		<c:if test="${ !empty error }">
		      		<div class="alert alert-warning alert-dismissible" role="alert">
			      		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only"><spring:message code="HMI.GENERIC.BUTTON.CLOSE" /></span></button>
			      		<spring:message code="${error }" />
		      		</div>
        		</c:if>
        	</c:forEach>
        </c:if>
        <button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="HMI.SIGNIN.BUTTON.SIGNIN" /></button>
        <a href="register" class="btn btn-lg btn-primary btn-block"><spring:message code="HMI.SIGNIN.BUTTON.REGISTER" /></a>
      </form>

    	</div>
    </div>
  </body>
</html>