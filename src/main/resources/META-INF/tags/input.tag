<%@tag
	description="Extended input tag to allow for sophisticated errors"
	pageEncoding="UTF-8"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@attribute name="path" required="true" type="java.lang.String"%>
<%@attribute name="cssClass" required="false" type="java.lang.String"%>
<%@attribute name="label" required="false" type="java.lang.String"%>
<%@attribute name="required" required="false" type="java.lang.Boolean"%>
<%@attribute name="placeHolder" required="false" type="java.lang.String"%>
<%@attribute name="password" required="false" type="java.lang.Boolean"%>
<%@attribute name="helpText" required="false" type="java.lang.String"%>
<%@attribute name="type" required="false" type="java.lang.String"%>
<%@attribute name="prependSymbol" required="false"
	type="java.lang.String"%>
<%@attribute name="autoComplete" required="false"
	type="java.lang.Boolean"%>

<spring:bind path="${path}">
	<div class="form-group ${status.error ? 'error' : '' }">
		<label class="control-label col-lg-2" for="${path}">${label}<c:if
				test="${required}">
				<span class="required">*</span>
			</c:if></label>

		<c:if test="${password}">
			<form:password path="${path}"
				cssClass="form-control ${empty cssClass ? 'input-lg' : cssClass}"
				placeHolder="${placeHolder}" />
		</c:if>
		<c:if test="${empty type}">
			<c:set value="text" var="type" />
		</c:if>

		<c:if test="${!password}">
			<div class="col-lg-3">

				<form:input path="${path}"
					autocomplete="${autocomplete == true ? 'on' : 'off'}"
					cssClass="form-control ${empty cssClass ? 'input-lg' : cssClass}"
					placeHolder="${placeHolder}" type="${type}" />


			</div>
		</c:if>

<!-- 		<div class="input-group">
			<span class="input-group-addon">$</span> <input type="text"
				class="form-control"> <span class="input-group-addon">.00</span>
		</div> -->

		<c:if test="${helpText != null}">
			<div class="col-lg-3">
				<a href="#" data-trigger="hover" rel="popover"
					class="btn btn-default btn-sm"
					data-original-title="<b>${label}</b>" data-content="${helpText}">
					<span class="glyphicon glyphicon-question-sign"></span>
				</a>
			</div>
		</c:if>

		<c:if test="${status.error}">
			<span class="help-inline">${status.errorMessage}</span>
		</c:if>

	</div>
</spring:bind>