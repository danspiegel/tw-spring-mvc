<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<h2>Listagem de Músicas</h2>
<br/>
<table class="table">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nome da Música</th>
			<th>Data de Criação</th>
			<th>Nome do Álbum</th>
			<th>Ações</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty musicas}">
			<c:forEach items="${musicas}" var="musica">
				<td>${musica.id}</td>
				<td>${musica.nome}</td>
				<td><fmt:formatDate value="${musica.dataCriacao}" pattern="dd/MM/yyyy" timeZone="UTC"/></td>
				<td>${musica.album.nome}</td>
				<td>
					<a href="/TreinaWebSpringMVC/musicas/alterar/${musica.id}">Alterar</a> |
					<a href="/TreinaWebSpringMVC/musicas/excluir/${musica.id}">Excluir</a>
				</td>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<br/>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/TreinaWebSpringMVC/musicas/adicionar" class="btn btn-default">Adicionar Nova Música</a>
</sec:authorize>