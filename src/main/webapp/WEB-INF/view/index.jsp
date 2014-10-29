<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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

    <title>Do It: Tasks list</title>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <c:import url="/WEB-INF/view/navbar.jsp" />
    
	
	<div class="container-fluid">
		<div class="row">
		    <div class="col-xs-12 col-sm-12	">
				<div class="full-bloc-light">
				  <h3>Manage your tasks every days easily with <b>Do It!</b></h3>
				</div>
				<p>
					<a href="<c:url value="/createTask" />" type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Add a new task</a>
				</p>
				<table class="table table-striped">
				  <thead>
				  	<tr>
				  		<th>#</th>
				  		<th>Task</th>
				  		<th class="hidden-xs">Description</th>
				  		<th>Deadline</th>
				  		<th>State</th>
				  		<th class="hidden-xs">Date</th>
				  		<th>Actions</th>
				  	</tr>
				  </thead>
				  <tbody>
				  	<tr>
				  		<td class="vert-align">1</td>
				  		<td class="vert-align">First task</td>
				  		<td class="vert-align hidden-xs">bla bla bla blablabla ...</td>
				  		<td class="vert-align">01 Nov 2014</td>
				  		<td class="vert-align"><span class="label label-danger">To do</span></td>
				  		<td class="vert-align hidden-xs">18 Oct 2014</td>
				  		<td class="vert-align">
							  <button type="button" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-ok"></span></button>
							  <button type="button" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-pencil"></span></button>
							  <button type="button" class="btn btn-default btn-xs"><span class="glyphicon glyphicon-remove"></span></button>
						</td>
				  	</tr>
				  </tbody>
				</table>
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
