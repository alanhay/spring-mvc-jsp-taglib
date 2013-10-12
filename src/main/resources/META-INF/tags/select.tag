<%@tag
	description="Generates a Bootstrap styled select control with automatic Spring error binding."
	pageEncoding="UTF-8"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://certait.co.uk/tags/spring-bootstrap" prefix="t"%>

<%@attribute name="path" required="true" type="java.lang.String"%>

<%@attribute name="cssClass" required="false" type="java.lang.String"%>

<%@attribute name="labelCssClass" required="false"
	type="java.lang.String"%>

<%@attribute name="label" required="true" type="java.lang.String"%>

<%@attribute name="required" required="false" type="java.lang.Boolean"%>

<%@attribute name="items" required="true" type="java.lang.Object"%>

<%@attribute name="itemLabel" required="false" type="java.lang.String"%>

<%@attribute name="itemValue" required="false" type="java.lang.String"%>

<%@attribute name="helpText" required="false" type="java.lang.String"%>

<%@attribute name="showPleaseSelect" required="false"
	type="java.lang.Boolean"%>

<%@attribute name="disabled" required="false" type="java.lang.Boolean"%>

<%@attribute name="controlColumnClass" required="false"
	type="java.lang.String"
	description="The number of columns this control should span in Bootstrap's grid system e.g. col-lg-3, col-sm-6. If not specified the default is for columns to expand to fill the available width"%>

<%@attribute name="errorMessageType" required="false"
	type="java.lang.String"
	description="Indicates whether errors associated with this field show be shown as errors or standard Labels. If this control is wrapped within a xxx this value can be specified at the 
		form level and will be inherited by each control. The default is for Labels."%>

<%-- --%>
<c:if test="${empty errorMessageType}">
	<c:if test="${not empty errorMessagesType}">
		<c:set var="errorMessageType" value="${errorMessagesType}" />
	</c:if>
</c:if>

<spring:bind path="${path}">
	<div class="form-group ${status.error ? 'text-danger' : '' }">

		<c:if test="${required}">
			<c:set var="requiredLabel" value="<span class='required'>*</span>" />
		</c:if>

		<label class="control-label col-lg-2" for="${path}">${label}${requiredLabel}</label>

		<div class="${controlColumnClass}">

			<form:select path="${path}" disabled="${disabled}"
				class="form-control" data-toggle="tooltip"
				title="${status.errorMessage}" data-trigger="manual"
				data-placement="right" data-container="body">

				<c:if test="${showPleaseSelect}">
					<form:option value="-1" label="Please Select" />
				</c:if>

				<c:choose>
					<c:when test="${not empty itemValue}">
						<form:options items="${items}"
							itemLabel="${not empty itemLabel ? itemlabel : item}"
							itemValue="${not empty itemValue ? itemLabel : item}" />
					</c:when>
					<c:otherwise>
						<c:forEach items="${items}" var="item">
							<form:option label="${item}" value="${item}" />
						</c:forEach>
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
				<t:errorOutput errorMessageType="${errorMessageType}" path="${path}"
					errorMessage="${errorMessage}" />
			</c:if>

		</div>
	</div>
</spring:bind>