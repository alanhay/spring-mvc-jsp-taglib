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
<%@attribute name="helpText" required="false" type="java.lang.String"%>
<%@attribute name="rows" required="true" type="java.lang.Integer"%>

<spring:bind path="${path}">
	<div class="control-group ${status.error ? 'error' : '' }">
		<label class="control-label" for="${path}">${label}<c:if
				test="${required}">
				<span class="required">*</span>
			</c:if></label>
		<div class="controls">
			<p class="help-block">

				<form:textarea path="${path}" rows="${rows}" style="width:400px;"
					cssClass="${empty cssClass ? 'input-xlarge' : cssClass}"
					placeHolder="${placeHolder}" />

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