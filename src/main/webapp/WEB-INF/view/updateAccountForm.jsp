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

    <title>Do It: <spring:message code="HMI.UPDATEUSER.TEXT.HEADER" /></title>
    
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

      <form class="form-signin" role="form"  modelAttribute="edition" method="post" action="updateAccount">
        <h2 class="form-signin-heading"><spring:message code="HMI.UPDATEUSER.TEXT.HEADER" /></h2>
		<c:choose>
			<c:when test="${!empty oAccount }">
		        <input name="name" type="text" value='<c:out value="${oAccount.name }" />' class="form-control" placeholder="<spring:message code="HMI.USER.FORM.PLACEHOLDER.NAME" />" required autofocus>
		        <input name="email" type="email" value='<c:out value="${oAccount.email }" />' class="form-control" placeholder="<spring:message code="HMI.USER.FORM.PLACEHOLDER.EMAIL" />" required>
		        <input name="passwordOld" type="password" class="form-control" placeholder="<spring:message code="HMI.USER.FORM.PLACEHOLDER.PASSWORDOLD" />">
		        <input name="password" type="password" class="form-control" placeholder="<spring:message code="HMI.USER.FORM.PLACEHOLDER.PASSWORDNEW" />">
		        <input name="passwordBis" type="password" class="form-control" placeholder="<spring:message code="HMI.USER.FORM.PLACEHOLDER.PASSWORDBIS" />">
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
		        <button class="btn btn-lg btn-warning btn-block" type="submit"><span class="glyphicon glyphicon-pencil"></span> <spring:message code="HMI.GENERIC.BUTTON.UPDATE" /></button>
		        <a href="<c:url value="/accountDetails" />" class="btn btn-lg btn-danger btn-block"><span class="glyphicon glyphicon-remove"></span> <spring:message code="HMI.GENERIC.BUTTON.CANCEL" /></a>
		      
			</c:when>
			<c:otherwise>
				<p>
					<br />
					<h5 class="text-warning"><spring:message code="HMI.GENERIC.USER.NOTFOUND" /></h5>
				</p>
			</c:otherwise>
		</c:choose>
      
      </form>

    	</div>
    </div>
  </body>
</html>