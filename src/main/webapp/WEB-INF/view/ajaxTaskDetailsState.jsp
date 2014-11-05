<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:choose>
	<c:when test="${!empty sTaskState && sTaskState == initParam.sTaskStateSuccess }">
	<span  data-task-state="Done" class="label label-success"><spring:message code="Task.data.state.success" /></span>
	</c:when>
	<c:when test="${!empty sTaskState && sTaskState == initParam.sTaskStateWarning }">
	<span data-task-state="To do" class="label label-primary"><spring:message code="Task.data.state.warning" /></span>
	</c:when>
	<c:when test="${!empty sTaskState && sTaskState == initParam.sTaskStateDanger }">
	<span data-task-state="Urgent" class="label label-danger"><spring:message code="Task.data.state.danger" /></span>
	</c:when>
	<c:otherwise>
	<span data-task-state="None" class="label label-info"><spring:message code="Task.data.state.none" /></span>
	</c:otherwise>
</c:choose>