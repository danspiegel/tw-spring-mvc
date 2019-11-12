<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<h2>Listagem de Usuários</h2>
<br/>
<table class="table">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nome do Usuário</th>
			<th>Perfil</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty usuarios}">
			<c:forEach items="${usuarios}" var="usuario">
				<tr>
					<td>${usuario.id}</td>
					<td>${usuario.username}</td>
					<td>${usuario.role}</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<br/>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/TreinaWebSpringMVC/usuarios/adicionar" class="btn btn-default">Adicionar Novo Usuário</a>
</sec:authorize>