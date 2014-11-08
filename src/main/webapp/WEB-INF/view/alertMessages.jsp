<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<div class="container-fluid">
	<div class="row">
		<c:if test="${!empty sAlertMessageSuccess }">
			<div class="alert alert-success alert-dismissible vert-align" role="alert" style="text-align:center; ">
		 		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only"><spring:message code="HMI.GENERIC.BUTTON.CLOSE" /></span></button>
		 		<spring:message code="${sAlertMessageSuccess }" />
			</div>
		</c:if>
		<c:if test="${!empty sAlertMessageError }">
			<div class="alert alert-danger alert-dismissible vert-align" role="alert" style="text-align:center; ">
		 		<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only"><spring:message code="HMI.GENERIC.BUTTON.CLOSE" /></span></button>
		 		<spring:message code="${sAlertMessageError }" />
			</div>
		</c:if>
	</div>
</div>