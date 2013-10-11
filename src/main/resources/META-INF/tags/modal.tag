<%@tag description="Displayes a Bootstrap Modal" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@attribute name="id" required="true" type="java.lang.String"%>
<%@attribute name="title" required="true" type="java.lang.String"%>
<%@attribute name="body" required="true" type="java.lang.String"%>
<%@attribute name="action" required="true" type="java.lang.String"%>
<%@attribute name="paramName" required="true" type="java.lang.String"%>
<%@attribute name="paramValue" required="true" type="java.lang.String"%>
<%@attribute name="confirmButtonText" required="true"
	type="java.lang.String"%>

<div class="modal fade" id="${id}" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">${title}</h4>
			</div>
			<div class="modal-body">${body}</div>
			<div class="modal-footer">
				<form:form method="post" action="${action}">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

					<c:set var="params" value="${fn:split(paramName, ',')}" />
					<c:set var="values" value="${fn:split(paramValue, ',')}" />

					<c:forEach items="${params}" varStatus="status">
						<input type="hidden" name="${params[status.index]}"
							value="${values[status.index]}" />
					</c:forEach>

					<button type="submit" class="btn btn-danger">${confirmButtonText}</button>
				</form:form>
			</div>
		</div>
	</div>
</div>
