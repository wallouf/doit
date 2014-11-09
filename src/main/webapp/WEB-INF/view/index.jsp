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

    <title>Do It: <spring:message code="HMI.TASKLIST.TEXT.HEADER" /></title>

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
				<p>
					<a href="<c:url value="/createTask" />" type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus"></span> <spring:message code="HMI.TASKLIST.BUTTON.NEWTASK" /></a>
				</p>
				<c:choose>
					<c:when test="${!empty aTaskList }">
						<table class="table table-striped"  style="font-size: medium;">
						  <thead>
						  	<tr>
						  		<th>#</th>
						  		<th><spring:message code="HMI.TASK.FORM.PLACEHOLDER.NAME" /></th>
						  		<th class="hidden-xs"><spring:message code="HMI.TASK.FORM.PLACEHOLDER.DESCRIPTION" /></th>
						  		<th><spring:message code="HMI.TASK.FORM.PLACEHOLDER.STATE" /></th>
						  		<th><spring:message code="HMI.TASK.FORM.PLACEHOLDER.DEADLINE" /></th>
						  		<th class="hidden-xs"><spring:message code="HMI.TASK.FORM.PLACEHOLDER.LASTUPDATE" /></th>
						  		<th><spring:message code="HMI.TASK.FORM.PLACEHOLDER.ACTIONS" /></th>
						  	</tr>
						  </thead>
						  <tbody>
						  	<c:forEach items="${aTaskList }" var="TaskObject">
						  		<c:if test="${!empty TaskObject }">
							  		<tr id="taskListRow" data-task-id="<c:out value="${TaskObject.id }" />">
								  		<td class="vert-align"><a href='<c:url value="/taskDetails?taskId=${TaskObject.id }" />'><c:out value="${TaskObject.id }" /></a></td>
								  		<td class="vert-align"><a href='<c:url value="/taskDetails?taskId=${TaskObject.id }" />'><c:out value="${TaskObject.name }" /></a></td>
								  		<td class="vert-align hidden-xs"><c:out value="${TaskObject.description }" /></td>
								  		<td class="vert-align"><joda:format value="${TaskObject.deadline }" pattern="dd MMM yyyy HH:mm"/></td>
										<c:choose>
											<c:when test="${TaskObject.state == initParam.sTaskStateSuccess }">
								  				<td id="taskListRow-State" class="vert-align"><span data-task-state="Done" class="label label-success"><spring:message code="Task.data.state.success" /></span></td>
											</c:when>
											<c:when test="${TaskObject.state == initParam.sTaskStateWarning }">
								  				<td id="taskListRow-State" class="vert-align"><span data-task-state="To do" class="label label-primary"><spring:message code="Task.data.state.warning" /></span></td>
											</c:when>
											<c:when test="${TaskObject.state == initParam.sTaskStateDanger }">
								  				<td id="taskListRow-State" class="vert-align"><span data-task-state="Urgent" class="label label-danger"><spring:message code="Task.data.state.danger" /></span></td>
											</c:when>
											<c:otherwise>
								  				<td id="taskListRow-State" class="vert-align"><span data-task-state="None" class="label label-info"><spring:message code="Task.data.state.none" /></span></td>
											</c:otherwise>
										</c:choose>
								  		<td class="vert-align hidden-xs"><joda:format value="${TaskObject.created }" pattern="dd MMM yyyy"/></td>
								  		<td class="vert-align">
											  <button onClick="doit_updateTaskListState(<c:out value="${TaskObject.id }" />,'Done');" type="button" class="btn btn-no-bck btn-xs text-success"><span class="glyphicon glyphicon-ok"></span></button>
											  <button type="button" class="btn btn-no-bck btn-xs text-warning" onClick="doit_displayTaskStateEditorForList(<c:out value="${TaskObject.id }" />);"><span class="glyphicon glyphicon-info-sign"></span></button>
											  <a href='<c:url value="/updateTask?taskId=${TaskObject.id }" />'  class="btn btn-no-bck btn-xs text-warning"><span class="glyphicon glyphicon-pencil"></span></a>
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
							<h5 class="text-warning"><spring:message code="HMI.TASKLIST.TASK.NONE" /></h5>
						</p>
					</c:otherwise>
				</c:choose>
	     	</div>
	     </div>
	</div>
    <c:import url="/WEB-INF/view/footer.jsp" />
	
	<div class="modal fade" id="doit_TaskStateModal" tabindex="-1" role="dialog" aria-labelledby="doit_TaskStateModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only"><spring:message code="HMI.GENERIC.BUTTON.CLOSE" /></span></button>
	        <h4 class="modal-title text-primary" id="doit_TaskStateModalLabel"><b><spring:message code="HMI.TASK.MODALFORM.HEADER" /></b></h4>
	      </div>
	      <div class="modal-body">
			<form role="form">
			  <div class="form-group">
		      	<input class="hide" id="doit_TaskStateModal_form_id" data-task-id="-1">
			 	<div class="form-group">
				   	<label class="control-label" for="doit_TaskStateModal_form_state" style="font-size: medium;"><b><spring:message code="HMI.TASK.FORM.PLACEHOLDER.STATE" />: </b></label>
					<select class="form-control vert-align" id="doit_TaskStateModal_form_state">
					  <option value="Done" class="text-success"><spring:message code="Task.data.state.success" /></option>
					  <option value="To do" class="text-warning"><spring:message code="Task.data.state.warning" /></option>
					  <option value="Urgent" class="text-danger"><spring:message code="Task.data.state.danger" /></option>
					  <option value="None" class=""><spring:message code="Task.data.state.none" /></option>
					</select>
				 </div>
			 	</div>
			 </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal"><spring:message code="HMI.GENERIC.BUTTON.CANCEL" /></button>
	        <button type="button" class="btn btn-success" onClick="doit_launchTaskStateEditorForList();"><spring:message code="HMI.GENERIC.BUTTON.SAVECHANGES" /></button>
	      </div>
	    </div>
	  </div>
	</div>
  </body>
</html>
