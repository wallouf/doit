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

    <title>Do It: <spring:message code="HMI.USERDETAILS.TEXT.HEADER" /></title>

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
				  <h3><spring:message code="HMI.USERDETAILS.TEXT.HEADER" /> <c:out value="#${oAccount.id }" /> :</h3>
				</div>
				<c:choose>
					<c:when test="${!empty oAccount }">
						<p>
							<a href='<c:url value="/updateAccount" />'   type="button" class="btn btn-warning btn-responsive"><span class="glyphicon glyphicon-pencil"></span> <spring:message code="HMI.GENERIC.BUTTON.EDIT" /></a>
							<a href="<c:url value="/deleteAccount" />" onClick="return confirm('<spring:message code="HMI.USER.FORM.REMOVE.CONFIRMATION" />');"  type="button" class="btn btn-danger btn-responsive"><span class="glyphicon glyphicon-remove"></span> <spring:message code="HMI.GENERIC.BUTTON.REMOVE" /></a>
						</p>
						<table class="table table-striped" style="font-size: medium;">
						  <thead>
						  	<tr>
						  		<th><spring:message code="HMI.GENERIC.TABLE.FIELD" /></th>
						  		<th><spring:message code="HMI.GENERIC.TABLE.VALUE" /></th>
						  	</tr>
						  </thead>
						  <tbody>
						  		<tr>
							  		<td class="vert-align"><spring:message code="HMI.USER.FORM.PLACEHOLDER.ID" /></td>
							  		<td class="vert-align"><c:out value="${oAccount.id }" /></td>
						  		</tr>
						  		<tr>
							  		<td class="vert-align"><spring:message code="HMI.USER.FORM.PLACEHOLDER.NAME" /></td>
							  		<td class="vert-align"><c:out value="${oAccount.name }" /></td>
						  		</tr>
						  		<tr>
							  		<td class="vert-align"><spring:message code="HMI.USER.FORM.PLACEHOLDER.PASSWORD" /></td>
							  		<td class="vert-align">**********</td>
						  		</tr>
						  		<tr>
							  		<td class="vert-align"><spring:message code="HMI.USER.FORM.PLACEHOLDER.EMAIL" /></td>
							  		<td class="vert-align"><c:out value="${oAccount.email }" /></td>
						  		</tr>
						  </tbody>
						</table>
					</c:when>
					<c:otherwise>
						<p>
							<br />
							<h5 class="text-warning"><spring:message code="HMI.GENERIC.USER.NOTFOUND" /></h5>
						</p>
					</c:otherwise>
				</c:choose>
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
