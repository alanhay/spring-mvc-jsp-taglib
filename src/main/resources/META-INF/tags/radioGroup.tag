<%@tag
	description="Generates a Bootstrap styled radio group control with automatic Spring error binding."
	pageEncoding="UTF-8"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@attribute name="path" required="true" type="java.lang.String"
	description="The attribute of the backing object to which this control should be bound."%>

<%@attribute name="label" required="true" type="java.lang.String"
	description="The text for the label associated with this control."%>

<%@attribute name="required" required="false" type="java.lang.Boolean"
	description="Indicates whether this is a required element. If true outputs * next to the label."%>

<%@attribute name="items" required="true" type="java.lang.Object"
	description="The Collection or Array containing the items for this control."%>

<%@attribute name="itemLabel" required="true" type="java.lang.String"
	description="The property of the Object in the items Collection which should be used as the label."%>

<%@attribute name="onChange" required="false" type="java.lang.String"
	description="Javascript function to execute on change event"%>

<%@attribute name="disabled" required="false" type="java.lang.Boolean"
	description="Indicates whether this control should be rendered with a disabled state."%>

<%@attribute name="separateLine" required="false"
	type="java.lang.Boolean" description="Indicates whether the radio buttons for this group should be output on a separate line. The default is false."%>

<spring:bind path="${path}">
	<div class="form-group ${status.error ? 'error' : '' }">

		<c:if test="${required}">
			<c:set var="requiredLabel" value="<span class='required'>*</span>" />
		</c:if>

		<label class="control-label col-lg-2" for="${path}">${label}${requiredLabel}</label>

		<div class="col-lg-2">

			<c:forEach var="item" items="${items}" varStatus="status">

				<label for="${path}${status.count}"
					class="${empty labelCssClass ? 'radio-inline' : labelCssClass}">

					<form:radiobutton path="${path}" value="${item}"
						disabled="${disabled}" onchange="${onChange}" />

					${item[itemLabel]}

				</label>

				<c:if test="${separateLine}">
					<br />
				</c:if>
			</c:forEach>

			<c:if test="${status.error}">
				<span class="help-inline">${status.errorMessage}</span>
			</c:if>
		</div>
	</div>
</spring:bind>