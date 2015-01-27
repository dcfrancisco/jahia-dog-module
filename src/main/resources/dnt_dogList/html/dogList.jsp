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

<template:addResources type="javascript" resources="jquery.min.js"/>

<div class="container" id="bcListDogs" style="width:auto;">
	<h2><fmt:message key="title.dogsGetWithAjax"/></h2>
	
	<table class="table table-bordered" id="tbListDogs">
		<thead>
			<tr>
				<th>#</th>
				<th><fmt:message key="dnt_dog.photo"/></th>
				<th><fmt:message key="dnt_dog.name"/></th>
				<th><fmt:message key="dnt_dog.origin"/></th>
				<th><fmt:message key="dnt_dog.breed"/></th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
</div>


<script type="text/javascript">

$(document).ready(function(){

	var url = "${url.find}";
	//var urlContent = urlbase.split('/');
	//var mode = urlContent[3], lang = urlContent[4];
	//var url = "/cms/find/"+mode+"/"+lang;
	
	var query = "select * from [dnt:dog]";
	
	var request = $.ajax({
		url: url,
		type: "GET",
		cache: false,
		dataType: "json",
		data: {query: query}
	});
	
	request.done(function(data) {
		printDogsData(data);
	});
	
	request.fail(function(msg) {
		console.info(msg);
	});
	
	
	function printDogsData(data) {
		var html = '';
		$.each(data, function(i, row) {
			html += '<tr>';
			html += '<td>' + (i+1) + '</td>';
			html += '<td>'; 
			if (row['node']['photo']) {
				html += '<img src="' + row['node']['photo'] + '" width="40"/>';
			}
			html += '</td>';
			html += '<td><a href="' + row['node']['path'] + '.html">' + row['dnt:dog.name'] + '</a></td>';
			html += '<td>' + row['dnt:dog.origin'] + '</td>';
			html += '<td>' + row['dnt:dog.breed'] + '</td>';
			html += '</tr>';
		});
		$(html).appendTo('#tbListDogs tbody');
	}
});
</script>



