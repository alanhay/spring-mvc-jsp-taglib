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
<%@attribute name="itemValue" required="false" type="java.lang.String"%>
<%@attribute name="helpText" required="false" type="java.lang.String"%>
<%@attribute name="showPleaseSelect" required="false"
	type="java.lang.Boolean"%>
<%@attribute name="disabled" required="false" type="java.lang.Boolean"%>

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

		<div class="controls">
			<form:select path="${path}" disabled="${disabled}">
				<c:if test="${showPleaseSelect}">
					<form:option value="-1" label="Please Select" />
				</c:if>

				<c:choose>
					<c:when test="${not empty itemValue}">
						<form:options items="${items}" itemLabel="${itemLabel}"
							itemValue="${itemValue}" />
					</c:when>
					<c:otherwise>
						<form:options items="${items}" itemLabel="name" />
					</c:otherwise>
				</c:choose>
			</form:select>
			<c:if test="${helpText != null}">
				<a href="#" data-trigger="hover" rel="popover" class="btn"
					data-original-title="<b>${label}</b>" data-content="${helpText}">
					<i class="icon-question-sign"></i>
				</a>
			</c:if>
			<c:if test="${status.error}">
				<span class="help-inline">${status.errorMessage}</span>
			</c:if>
		</div>
	</div>
</spring:bind>