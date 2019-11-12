<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="actionAdicionar" value="/albuns/adicionar"></c:url>
<h2>Inclusão de Novo Álbum</h2>
<form:form action="${actionAdicionar}" method="post" modelAttribute="album">
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Nome</label>
				<form:input path="nome" cssClass="form-control" />
				<form:errors path="nome" cssStyle="color: red"></form:errors>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Ano de Lançamento</label>
				<form:input path="anoLancamento" cssClass="form-control" />
				<form:errors path="anoLancamento" cssStyle="color: red"></form:errors>
			</div>
		</div>
	</div>
	<input type="submit" value="Gravar" class="btn btn-default"/>
</form:form>