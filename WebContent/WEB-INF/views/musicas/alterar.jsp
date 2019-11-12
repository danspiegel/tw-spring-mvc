<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="actionAlterar" value="/musicas/alterar"></c:url>
<h2>Alteração da Música "${musica.nome}"</h2>
<form:form action="${actionAlterar}" method="post" modelAttribute="musica">
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Id</label>
				<form:input path="id" cssClass="form-control" readonly="true"/>
			</div>
		</div>
	</div>
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
				<label>Data de Criação</label>
				<form:input path="dataCriacao" cssClass="form-control" />
				<form:errors path="dataCriacao" cssStyle="color: red"></form:errors>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<div class="form-group">
				<label>Álbum</label>
				<form:select path="album.id" cssClass="form-controle">
					<form:options items="${albuns}" itemLabel="nome" itemValue="id" />
				</form:select>
			</div>
		</div>
	</div>	
	<input type="submit" value="Gravar" class="btn btn-default"/>
</form:form>