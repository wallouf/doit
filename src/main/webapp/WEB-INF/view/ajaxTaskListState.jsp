<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
<c:if test="${!empty TaskObject }">
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
 		<td class="vert-align text-no-decoration">
 				<c:if test="${TaskObject.state != initParam.sTaskStateSuccess }">
 					<button onClick="doit_updateTaskListState(<c:out value="${TaskObject.id }" />,'Done');" type="button" class="btn btn-no-bck btn-xs text-success"><span class="glyphicon glyphicon-ok"></span></button>
 				</c:if>
		  <button type="button" class="btn btn-no-bck btn-xs text-warning" onClick="doit_displayTaskStateEditorForList(<c:out value="${TaskObject.id }" />);"><span class="glyphicon glyphicon-info-sign"></span></button>
		  <a href='<c:url value="/updateTask?taskId=${TaskObject.id }" />'  class="btn btn-no-bck btn-xs text-warning"><span class="glyphicon glyphicon-pencil"></span></a>
		  <a href='<c:url value="/deleteTask?taskId=${TaskObject.id }" />' onClick="return confirm('Do you really want to remove this Task?');" class="btn btn-no-bck btn-xs text-danger"><span class="glyphicon glyphicon-remove"></span></a>
	</td>
</c:if>