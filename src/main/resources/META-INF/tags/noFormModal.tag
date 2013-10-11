<%@tag description="Displayes a Bootstrap Modal" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@attribute name="id" required="true" type="java.lang.String"%>
<%@attribute name="title" required="true" type="java.lang.String"%>
<%@attribute name="body" required="true" type="java.lang.String"%>
<%@attribute name="confirmButtonText" required="false" type="java.lang.String"%>

<div class="modal fade" id="${id}" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title">${title}</h4>
			</div>
			<div class="modal-body">${body}</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<c:if test="${not empty confirmButtonText}">
					<a id="modalConfirm" class="btn btn-warning" href="#">${confirmButtonText}</a>
				</c:if>
			</div>
		</div>
	</div>
</div>
