<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<template:addResources type="css" resources="dog.css"/>
<template:addResources type="javascript" resources="jquery.min.js"/>


<div class="container">
	<h2>${currentNode.properties.name.string}</h2>
	<p><img src="${currentNode.properties.photo.node.url}" title="${currentNode.properties.name.string}" width="200"/></p>
	<p><fmt:message key="dnt_dog.breed"/>: ${currentNode.properties.breed.string}</p>
	<p><fmt:message key="dnt_dog.birthday"/>: 
	<fmt:formatDate type="date" dateStyle="medium" value="${currentNode.properties.birthday.time}"/></p>
	<p><fmt:message key="dnt_dog.origin"/>: ${currentNode.properties.origin.string}</p>
	<p class="dog-bio">${currentNode.properties.bio.string}</p>
	
	<c:if test="${jcr:hasPermission(currentNode,'bark')}">
	    <!--The user is allowed-->
		<input type="button" class="btn btn-default" value="Bark" id="btnBark"/>
	</c:if>

</div>



<script type="text/javascript">
	$(document).ready(function() {
		$('#btnBark').click(function() {
			var url = "${currentNode.path}.bark.do";

			$.ajax({
				url: url,
				type: "POST"
			});

		});
	});
</script>
