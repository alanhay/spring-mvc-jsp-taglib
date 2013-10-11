<%@tag
	description="Extended input tag to allow for sophisticated errors"
	pageEncoding="UTF-8"%>
	
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@attribute name="path" required="true" type="java.lang.String"%>
<%@attribute name="cssClass" required="false" type="java.lang.String"%>
<%@attribute name="label" required="false" type="java.lang.String"%>
<%@attribute name="initialDate" required="false" type="java.util.Date"%>
<%@attribute name="required" required="false" type="java.lang.Boolean"%>
<%@attribute name="id" required="true" type="java.lang.String"%>
<%@attribute name="mode" required="false" type="java.lang.String"%>

<c:if test="${empty label}">
	<c:set var="label"
		value="${fn:toUpperCase(fn:substring(path, 0, 1))}${fn:toLowerCase(fn:substring(path, 1,fn:length(path)))}" />
</c:if>
<fmt:formatDate value="${initialDate}" var="formattedDate" pattern="dd-MM-yyyy"/>
<spring:bind path="${path}">
	<div class="control-group ${status.error ? 'error' : '' }">
		<label class="control-label" for="${path}">${label}<c:if
				test="${required}">
				<span class="required">*</span>
			</c:if></label>
		<div class="controls" style="width:400px;">
    		<div class="input-append date" id="${id != null ? id : 'datePicker'}" data-date="${formattedDate}" data-date-today-highlight="true"
    				data-date-format="dd-mm-yyyy" data-date-start-view="${mode != null ? mode : ''}" data-date-autoClose="true" />
 				<form:input class="span2" style="width:128px;" path="${path}" readonly="true" />
 				<span class="add-on"><i class="icon-calendar"></i></span>	
	    	</div>
			<c:if test="${status.error}">
				<span class="help-inline">${status.errorMessage}</span>
			</c:if>
		</div>
	</div>
</spring:bind>