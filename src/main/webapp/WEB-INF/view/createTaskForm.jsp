<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery-ui.theme.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery.datetimepicker.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/doit.generic.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.datetimepicker.js" />"></script>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Do It: <spring:message code="HMI.ADDTASK.TEXT.HEADER" /></title>
    
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
        <h2 class="form-signin-heading"><spring:message code="HMI.ADDTASK.TEXT.HEADER" /></h2>
        <input tabindex="1" name="name" type="text" class="form-control" placeholder="<spring:message code="HMI.TASK.FORM.PLACEHOLDER.NAME" />" required autofocus  value='<c:out value="${sessionScope.oTaskToEdit.name }" />'>
        <textarea tabindex="2" rows="5" name="description" class="form-control" placeholder="<spring:message code="HMI.TASK.FORM.PLACEHOLDER.DESCRIPTION" />"><c:out value="${sessionScope.oTaskToEdit.description }" /></textarea>
        <div class="input-group">
		  <div class="input-group-btn">
		    <button  id="doit-taskForm-datetimepicker-button" class="btn btn-primary form-control" type="button"><span class="glyphicon glyphicon-calendar"></span></button>
		  </div>
		  <input id="doit-taskForm-datetimepicker" type="text" class="form-control" name="deadline" placeholder="<spring:message code="HMI.TASK.FORM.PLACEHOLDER.DEADLINE" />" readonly value='<c:out value="${sessionScope.oTaskToEdit.deadline }" />'>
		  <div class="input-group-btn">
		    <button onClick="$('#doit-taskForm-datetimepicker').val('');" class="btn btn-danger form-control" type="button"><span class="glyphicon glyphicon-remove"></span></button>
		  </div>
		</div>
		<br>
		<div class="form-group">
		   	<label class="control-label" for="doit_TaskStateModal_form_state" style="font-size: medium;"><b><spring:message code="HMI.TASK.FORM.PLACEHOLDER.STATE" />: </b></label>
			<select class="form-control" name="state">
			  <option value="To do" class="text-warning" <c:if test="${sessionScope.oTaskToEdit.state == 'To do'}">selected</c:if>><spring:message code="Task.data.state.warning" /></option>
			  <option value="Urgent" class="text-danger" <c:if test="${sessionScope.oTaskToEdit.state == 'Urgent'}">selected</c:if>><spring:message code="Task.data.state.danger" /></option>
			  <option value="None" class="" <c:if test="${sessionScope.oTaskToEdit.state == 'None'}">selected</c:if>><spring:message code="Task.data.state.none" /></option>
			  <option value="Done" class="text-success" <c:if test="${sessionScope.oTaskToEdit.state == 'Done'}">selected</c:if>><spring:message code="Task.data.state.success" /></option>
		  	</select>
		</div>
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
        <button class="btn btn-lg btn-success btn-block" type="submit"><span class="glyphicon glyphicon-plus"></span> <spring:message code="HMI.GENERIC.BUTTON.ADD" /></button>
        <a href="<c:url value="/" />" class="btn btn-lg btn-danger btn-block"><span class="glyphicon glyphicon-remove"></span> <spring:message code="HMI.GENERIC.BUTTON.CANCEL" /></a>
      </form>

    	</div>
    </div>
    <c:import url="/WEB-INF/view/footer.jsp" />
  </body>
</html>
<script>
$( document ).ready(function() {
	$('#doit-taskForm-datetimepicker').datetimepicker({
	  format:'Y-m-d H:i'
	});
	$('#doit-taskForm-datetimepicker-button').click(function(){
	  $('#doit-taskForm-datetimepicker').datetimepicker('show');
	});
});
</script>