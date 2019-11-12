<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<h2>Listagem de �lbuns</h2>
<br/>
<div class="row">
	<div class="col-md-10">
		<div class="form-group">
			<label>�lbum a ser pesquisado</label>
			<input type="text" id="txt-pesquisa" class="form-control" />
		</div>
		<button class="btn btn-default" id="btn-pesquisa">Pesquisar</button>
	</div>
</div>
<table id="tbl-albuns" class="table">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nome do �lbum</th>
			<th>Ano de Lan�amento</th>
			<th>A��es</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty albuns}">
			<c:forEach items="${albuns}" var="album">
				<tr>
					<td>${album.id}</td>
					<td>${album.nome}</td>
					<td>${album.anoLancamento}</td>
					<td>
						<a href="/TreinaWebSpringMVC/albuns/alterar/${album.id}">Alterar</a> |
						<a href="/TreinaWebSpringMVC/albuns/excluir/${album.id}">Excluir</a>
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</tbody>
</table>
<br/>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/TreinaWebSpringMVC/albuns/adicionar" class="btn btn-default">Adicionar Novo �lbum</a>
</sec:authorize>

<script type="text/javascript">

    $(document).ready(function () {
    	
        $('#btn-pesquisa').click(function () {
        	
            var nomeAlbum = $('#txt-pesquisa').val();
            $.ajax({
                method: 'GET',
                url: '/TreinaWebSpringMVC/albuns/porNome?nome=' + nomeAlbum,
                success: function (data) {
                    $('#tbl-albuns tbody > tr').remove();
                    $.each(data, function (index, album) {
                        $('#tbl-albuns tbody').append(
                            '<tr>' +
                            '   <td>' + album.id + '</td>' +
                            '   <td>' + album.nome + '</td>' +
                            '   <td>' + album.anoDeLancamento + '</td>' +
                            '   <td>' +
                            '       <a href="/TreinaWebSpringMVC/albuns/alterar/' + album.id + '">Alterar</a> |' +
                            '       <a href="/TreinaWebSpringMVC/albuns/excluir/' + album.id + '">Excluir</a> ' +
                            '   </td>' +
                            '</tr>'
                        );
                    });
                },
                error: function () {
                    alert("Houve um erro na requisi��o.");
                }
            });
            
        });
        
    });
    
</script>