<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
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
	
	<input type="button" class="btn btn-default" value="Bark" id="btnBark"/>
</div>


<script type="text/javascript">
	
$('#btnBark').click(function() {
	console.info("inside function");
	var url = "${currentNode.path}.bark.do";
	
	$.ajax({
		url: url,
		type: "POST"
	});
	
});

</script>
