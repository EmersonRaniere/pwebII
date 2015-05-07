<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Projeto de Pweb II - IFPB">
	<meta name="author" content="Emerson Raniere">
	<title>Cadastrar Usuário - PwebII</title>
	<link rel="stylesheet" type="text/css" href="./css/default.css">
	<link rel="stylesheet" type="text/css" href="./bootstrap-3.3.4-dist/css/bootstrap.css">
	<script src="./bootstrap-3.3.4-dist/js/bootstrap.js"></script>
	<script src="./bootstrap-3.3.4-dist/js/jquery-1.11.3.min.js"></script>
</head>
<body>
	<%@ include file="Navs/indexBar.jsp" %>
	<div class="container" style="width:700px;">
		<form class="form-signin" method="post" action="controller.do">
			<input type="hidden" name="acao" value="cadastrarusuario">
			<h2 class="form-signin-heading">Cadastrar no sistema</h2>
			<input name="nome" type="text" id="inputNome" class="form-control" placeholder="Nome" required autofocus>
			<input name="email" type="text" id="inputEmail" class="form-control" placeholder="Email address" required>
			<input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
			<div class="checkbox">
				<button class="btn btn-success" type="submit">Cadastrar</button>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="<c:url value="./js/default.js" />"></script>
</body>
</html>