<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<p>
	<spring:message code="user.username" />
	:
	<jstl:out value="${user.userAccount.username}" />
</p>
<p>
	<spring:message code="user.name" />
	:
	<jstl:out value="${user.name}" />
</p>
<p>
	<spring:message code="user.surname" />
	:
	<jstl:out value="${user.surname}" />
</p>
<jstl:if test='${not empty user.address}'>
<p>
	<spring:message code="user.address" />
	:
	<jstl:out value="${user.address}" />
</p>
</jstl:if>
<jstl:if test='${not empty user.phone}'>
<p>
	<spring:message code="user.phone" />
	:
	<jstl:out value="${user.phone}" />
</p>
</jstl:if>
<p>
	<spring:message code="user.email" />
	:
	<jstl:out value="${user.email}" />
</p>

<h1>Chirps</h1>

<display:table class="displaytag" name="chirps" id="row" requestURI="user/display.do" pagesize="20" defaultsort="3" defaultorder="descending">
	
	<spring:message code="welcome.chirp.title" var="titleHeader" />
	<display:column property="title" title="${titleHeader}" />

	<spring:message code="welcome.chirp.description" var="descHeader" />
	<display:column property="description" title="${descHeader}" />
	
	<spring:message code="welcome.chirp.moment" var="momentHeader" />
	<spring:message code="welcome.chirp.format" var="dateFormat" />
	<display:column title="${momentHeader}">
		<fmt:formatDate value="${row.moment}" pattern="${dateFormat}"/>
	</display:column>

</display:table>
<security:authorize access="hasRole('USER')">
	<jstl:if test="${following != null}">
	<jstl:if test="${following}">
		<a href="user/user/unfollow.do?userId=${user.id}"><spring:message code="user.unfollow"/></a>
	</jstl:if>
	<jstl:if test="${not following}">
		<a href="user/user/follow.do?userId=${user.id}"><spring:message code="user.follow"/></a>
	</jstl:if>
	</jstl:if>
</security:authorize>