<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>


<%--boundComponent is the node which you are linked with--%>
<c:set var="boundDog" value="${ui:getBindedComponent(currentNode, renderContext, 'j:bindedComponent')}"/>
<div class="container">
<c:if test="${jcr:isNodeType(boundDog, 'dnt:dog')}">
	Tree of <template:module node="${boundDog}" view="hidden.name"/>
	
	<c:set value="${boundDog.properties.father.node}" var="dogFather"/>
	<c:if test="${not empty dogFather}">
		<span>&gt; <a href="<c:url value="${dogFather.url}"/>">
			 <template:module node="${dogFather}" view="hidden.name"/>
			</a>
		</span>
		
		<c:set var ="dogFather" value="${dogFather.properties.father.node}" />
		
		<c:forEach var="i" begin="1" end="5">
			<c:if test="${not empty dogFather}">
				<span>&gt; <a href="<c:url value="${dogFather.url}"/>">
					<template:module node="${dogFather}" view="hidden.name"/>
					</a>
				</span>
			</c:if>
			<c:set var ="dogFather" value="${dogFather.properties.father.node}" />
		</c:forEach>
	</c:if>
</c:if>
</div>