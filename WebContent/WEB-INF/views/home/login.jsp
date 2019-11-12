<h2>Autenticação de Usuário</h2>
<br />
<form action="/TreinaWebSpringMVC/login" method="post">
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Nome do Usuário</label>
				<input type="text" name="username" class="form-control" />
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Senha</label>
				<input type="password" name="password" class="form-control" />
			</div>
		</div>
	</div>
	<input type="submit" value="Entrar" class="btn btn-default"/>
</form>