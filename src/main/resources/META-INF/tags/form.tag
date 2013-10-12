<%@tag
	description="JSP From Tag scaffolds the generated form in a Bootstrap Panel."
	display-name="Bootstrap Form Tag" trimDirectiveWhitespaces="true"
	pageEncoding="UTF-8"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@attribute name="modelAttribute" required="true"
	type="java.lang.String"
	description="The Spring model attribute to which the fields of this form should be bound."%>

<%@attribute name="errorMessagesType" required="true"
	type="java.lang.String" rtexprvalue="false"
	description="Indicates how errors associated with controls on this form show be shown. Valid values are tooltip or label. The default is label. Value can be overridden for individual controls."%>

<form:form modelAttribute="${modelAttribute}" role="form"
	class="form-horizontal">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">Client Details</h3>
		</div>
		<div class="panel-body">
			<% jspContext.setAttribute("errorMessagesType", errorMessagesType, PageContext.REQUEST_SCOPE); %>

			<jsp:doBody />
		</div>
		<div class="panel-footer">
			<input type="submit" class="btn btn-primary" value="Save" />
		</div>
	</div>
</form:form>