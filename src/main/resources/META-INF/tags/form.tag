<%@tag
	description="Extended input tag to allow for sophisticated errors"
	pageEncoding="UTF-8"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@attribute name="modelAttribute" required="true"
	type="java.lang.String"%>

<form:form modelAttribute="${modelAttribute}" role="form"
	class="form-horizontal">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">Client Details</h3>
		</div>
		<div class="panel-body">
			<jsp:doBody />
		</div>
		<div class="panel-footer">
			<input type="submit" class="btn btn-primary" value="Save" />
		</div>
	</div>
</form:form>