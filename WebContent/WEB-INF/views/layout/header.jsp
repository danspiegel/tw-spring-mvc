<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">TreinaWeb Spring MVC</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <sec:authorize access="isAuthenticated()">
  	  <sec:authentication property="principal" var="principal" />
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Álbuns
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="/TreinaWebSpringMVC/albuns/listar">Listar</a>
	          <sec:authorize access="hasRole('ROLE_ADMIN')">
	          	<a class="dropdown-item" href="/TreinaWebSpringMVC/albuns/adicionar">Cadastrar</a>
	          </sec:authorize>
	        </div>
	      </li>
	    </ul>
	    <ul class="navbar-nav">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Músicas
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="/TreinaWebSpringMVC/musicas/listar">Listar</a>
	          <sec:authorize access="hasRole('ROLE_ADMIN')">
	          	<a class="dropdown-item" href="/TreinaWebSpringMVC/musicas/adicionar">Cadastrar</a>
	          </sec:authorize>
	        </div>
	      </li>
	    </ul>
	    <ul class="navbar-nav">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Usuários
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="/TreinaWebSpringMVC/usuarios/listar">Listar</a>
	          <sec:authorize access="hasRole('ROLE_ADMIN')">
	          	<a class="dropdown-item" href="/TreinaWebSpringMVC/usuarios/adicionar">Cadastrar</a>
	          </sec:authorize>
	        </div>
	      </li>
	    </ul>
	    <ul class="navbar-nav">
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Bem-vindo, ${principal.username}
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="/TreinaWebSpringMVC/logout">Sair</a>
	        </div>
	      </li>
	    </ul>
	  </div>
  </sec:authorize>
</nav>