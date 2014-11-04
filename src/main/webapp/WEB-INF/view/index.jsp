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

    <title>Do It: Tasks list</title>

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
				  <h3>Manage your tasks every days easily with <b>Do It!</b></h3>
				</div>
				<p>
					<a href="<c:url value="/createTask" />" type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> Add a new task</a>
				</p>
				<c:choose>
					<c:when test="${!empty aTaskList }">
						<table class="table table-striped"  style="font-size: medium;">
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
						  	<c:forEach items="${aTaskList }" var="TaskObject">
						  		<c:if test="${!empty TaskObject }">
							  		<tr id="taskListRow" data-task-id="<c:out value="${TaskObject.id }" />">
								  		<td class="vert-align"><a href='<c:url value="/taskDetails?taskId=${TaskObject.id }" />'><c:out value="${TaskObject.id }" /></a></td>
								  		<td class="vert-align"><a href='<c:url value="/taskDetails?taskId=${TaskObject.id }" />'><c:out value="${TaskObject.name }" /></a></td>
								  		<td class="vert-align hidden-xs"><c:out value="${TaskObject.description }" /></td>
								  		<td class="vert-align"><c:out value="${TaskObject.deadline }" /></td>
										<c:choose>
											<c:when test="${TaskObject.state == initParam.sTaskStateSuccess }">
								  				<td id="taskListRow-State" class="vert-align"><span class="label label-success"><spring:message code="Task.data.state.success" /></span></td>
											</c:when>
											<c:when test="${TaskObject.state == initParam.sTaskStateWarning }">
								  				<td id="taskListRow-State" class="vert-align"><span class="label label-primary"><spring:message code="Task.data.state.warning" /></span></td>
											</c:when>
											<c:when test="${TaskObject.state == initParam.sTaskStateDanger }">
								  				<td id="taskListRow-State" class="vert-align"><span class="label label-danger"><spring:message code="Task.data.state.danger" /></span></td>
											</c:when>
											<c:otherwise>
								  				<td id="taskListRow-State" class="vert-align"><span class="label"><spring:message code="Task.data.state.none" /></span></td>
											</c:otherwise>
										</c:choose>
								  		<td class="vert-align hidden-xs"><joda:format value="${TaskObject.created }" pattern="dd MMM yyyy"/></td>
								  		<td class="vert-align">
											  <button onClick="doit_updateTaskState(<c:out value="${TaskObject.id }" />,'Done');" type="button" class="btn btn-no-bck btn-xs text-success"><span class="glyphicon glyphicon-ok"></span></button>
											  <button type="button" class="btn btn-no-bck btn-xs text-warning"><span class="glyphicon glyphicon-pencil"></span></button>
											  <a href='<c:url value="/deleteTask?taskId=${TaskObject.id }" />' onClick="return confirm('Do you really want to remove this Task?');" class="btn btn-no-bck btn-xs text-danger"><span class="glyphicon glyphicon-remove"></span></a>
										</td>
								  	</tr>
						  		</c:if>
						  	</c:forEach>
						  </tbody>
						</table>
					</c:when>
					<c:otherwise>
						<p>
							<br />
							<h5 class="text-warning">No tasks found! You can define your first task with the "Add a new task" green button! </h5>
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
