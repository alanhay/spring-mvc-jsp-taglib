<%@tag
	description="Extended input tag to allow for sophisticated errors"
	pageEncoding="UTF-8"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@attribute name="path" required="true" type="java.lang.String"
	description="The attribute of the backing object to which this control should be bound."%>

<%@attribute name="cssClass" required="false" type="java.lang.String"
	description="The Bootstrap css classm to apply to this control e.g. input-sm, input-lg etc.Default to input-md if not specified."%>

<%@attribute name="label" required="false" type="java.lang.String"
	description="The text for the label associated with this control."%>

<%@attribute name="required" required="false" type="java.lang.Boolean"
	description="Indeicates whether this is a required element. If true outputs * next to the label."%>

<%@attribute name="placeHolder" required="false" type="java.lang.String"
	description="The placeholder text for this control."%>

<%@attribute name="password" required="false" type="java.lang.Boolean"
	description="Indicates whether this control should be rendered as a Password field. Default is a normal input control."%>

<%@attribute name="helpText" required="false" type="java.lang.String"
	description="The Help Text for this control. If specified will generate a button to the right of the control which will show the specified text in a popover on hover."%>

<%@attribute name="type" required="false" type="java.lang.String"
	description="The HTML5 type for this control e.g. tel, email etc."%>

<%@attribute name="prependSymbol" required="false"
	type="java.lang.String" description="The character which should be affixed to the front of the control."%>
	
<%@attribute name="appendSymbol" required="false"
	type="java.lang.String" description="The character which should be affixed to the rear of the control."%>

<%@attribute name="autoComplete" required="false"
	type="java.lang.Boolean"
	description="Whether this control should have browser autocomplete enabled. The default is false"%>

<%@attribute name="controlColumnClass" required="false"
	type="java.lang.String"
	description="The number of columns this control should span in Bootstrap's grid system e.g. col-lg-3, col-sm-6. If not specified the default is for columns to expand to fill the available width"%>

<spring:bind path="${path}">
	<div class="form-group ${status.error ? 'error' : '' }">
		<label class="control-label col-lg-2" for="${path}">${label}<c:if
				test="${required}">
				<span class="required">*</span>
			</c:if></label>

		<c:if test="${password}">
			<div class="${controlColumnClass}">
				<form:password path="${path}"
					cssClass="form-control ${empty cssClass ? 'input-md' : cssClass}"
					placeHolder="${placeHolder}" />
			</div>
		</c:if>
		<c:if test="${empty type}">
			<c:set value="text" var="type" />
		</c:if>

		<c:if test="${!password}">
			<div class="${controlColumnClass}">
				<c:if test="${not empty prependSymbol || not empty appendSymbol}">
					<div class="input-group">
				</c:if>
				<c:if test="${not empty prependSymbol}">
					<span class="input-group-addon">${prependSymbol}</span> 
				</c:if>
				<form:input path="${path}"
					autocomplete="${autocomplete == true ? 'on' : 'off'}"
					cssClass="form-control ${empty cssClass ? 'input-md' : cssClass}"
					placeHolder="${placeHolder}" type="${type}" />
				<c:if test="${not empty appendSymbol}">
					<span class="input-group-addon">${appendSymbol}</span> 
				</c:if>
				<c:if test="${not empty prependSymbol || not empty appendSymbol}">
					</div>
				</c:if>
			</div>
		</c:if>

		<c:if test="${helpText != null}">
			<div class="col-lg-3">
				<a href="#" data-trigger="hover" rel="popover"
					class="btn btn-default btn-sm" style="margin-left:-15px;"
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