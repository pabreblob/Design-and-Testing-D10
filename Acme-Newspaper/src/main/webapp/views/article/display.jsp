<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>


<div>
<p>
<spring:message code="article.title"/>:<jstl:out value="${article.title}"/>
</p>
</div>
<div>
<p>
<spring:message code="article.creator"/>:<jstl:out value="${article.creator.userAccount.username}"/>
</p>
</div>
<jstl:if test="${article.moment!=null}">
<div>
<spring:message code="article.dateFormat2" var="dateFormat2" />
<p>
<spring:message code="article.moment"/>:<fmt:formatDate value="${aricle.moment}" pattern="${dateFormat2}" />
</p>
</div>
</jstl:if>
<div>
<p>
<spring:message code="article.summary"/>:<jstl:out value="${article.summary}"/>
</p>
</div>
<jstl:if test="${hasPictures== true}">
<spring:message code="article.pictures"/>:
	<jstl:forEach var="picture" items="${pictures}">
	<img src="<jstl:out value="${picture}"/>">
	</jstl:forEach>
	</jstl:if>
<div>
<p>
<spring:message code="article.newspaper"/>:<jstl:out value="${article.newspaper.title}"/>
</p>
</div>
