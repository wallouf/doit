<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<nav class="navbar navbar-fixed-top navbar-inverse" role="navigation">
	<div class="container">
	  <div class="navbar-header">
	    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	      <span class="sr-only">Toggle navigation</span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	    </button>
	    <a class="navbar-brand" href="<c:url value="/" />">Do It!</a>
	 </div>
     <c:if test="${!empty sessionScope.userSession}">
	 <div id="navbar" class="collapse navbar-collapse">
	   <ul class="nav navbar-nav">
	     <li class="active"><a href="#">Tasks</a></li>
	     <li><a href="#about">About Do It</a></li>
	     <li><a href="https://github.com/wallouf/doit">See on Github</a></li>
	   </ul>
	   <ul class="nav navbar-nav navbar-right">
	     <li><a href="#"><span class="glyphicon glyphicon-user"></span> <c:out value="${sessionScope.userSession.name}" /></a></li>
	     <li><a href='<c:url value="/disconnect" />'><span class="glyphicon glyphicon-remove"></span> Disconnect</a></li>
	   </ul>
	 </div><!-- /.nav-collapse -->
	 </c:if>
	</div><!-- /.container -->
</nav><!-- /.navbar -->