<%@tag
	description="Extended input tag to allow for sophisticated errors"
	pageEncoding="UTF-8"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@attribute name="path" required="true" type="java.lang.String"%>
<%@attribute name="cssClass" required="false" type="java.lang.String"%>
<%@attribute name="labelCssClass" required="false"
	type="java.lang.String"%>
<%@attribute name="label" required="false" type="java.lang.String"%>
<%@attribute name="required" required="false" type="java.lang.Boolean"%>
<%@attribute name="items" required="true" type="java.lang.Object"%>
<%@attribute name="itemLabel" required="true" type="java.lang.String"%>
<%@attribute name="onChange" required="false" type="java.lang.String"%>
<%@attribute name="disabled" required="false" type="java.lang.Boolean"%>
<%@attribute name="separateLine" required="false"
	type="java.lang.Boolean"%>

<c:if test="${empty label}">
	<c:set var="label"
		value="${fn:toUpperCase(fn:substring(path, 0, 1))}${fn:toLowerCase(fn:substring(path, 1,fn:length(path)))}" />
</c:if>
<spring:bind path="${path}">
	<div class="control-group ${status.error ? 'error' : '' }">
		<label class="control-label" for="${path}">${label} <c:if
				test="${required}">
				<span class="required">*</span>
			</c:if>
		</label>
		
		<c:if test="${separateLine}">
			<br />
		</c:if>

		<div class="controls">
			<c:forEach var="item" items="${items}" varStatus="status">
				<form:radiobutton path="${path}" value="${item}"
					disabled="${disabled}"
					cssClass="${empty cssClass ? 'input-xlarge' : cssClass}"
					onchange="${onChange}" />
				<label for="${path}${status.count}"
					class="${empty labelCssClass ? 'radio inline' : labelCssClass}"
					style="margin-left: -20px;">${item[itemLabel]}</label>
				<span style="margin-left: 10px;">&nbsp;</span>

				<c:if test="${separateLine}">
					<br /><br/>
				</c:if>
			</c:forEach>

			<c:if test="${status.error}">
				<span class="help-inline">${status.errorMessage}</span>
			</c:if>
		</div>
	</div>
</spring:bind>