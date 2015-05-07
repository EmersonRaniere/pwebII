<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Projeto de Pweb II - IFPB">
<meta name="author" content="Emerson Raniere">
	<title>Página Inicial - PwebII</title>
<link rel="stylesheet" type="text/css" href="./css/default.css">
<link rel="stylesheet" type="text/css" href="./bootstrap-3.3.4-dist/css/bootstrap.css">
<script src="./bootstrap-3.3.4-dist/js/bootstrap.js"></script>
<script src="./bootstrap-3.3.4-dist/js/jquery-1.11.3.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container">
 			<div class="navbar-header">
  				<a class="navbar-brand" href="<c:url value='/index.jsp'/>">Calendário Web - Emerson Raniere</a>
			</div>
			<c:if test="${sessionScope.user == null}">
				<div id="navbar" class="navbar-collapse collapse">
		        <form class="navbar-form navbar-right" method="post" action="login.jsp">
		       		<button type="submit" class="btn btn-success">Entrar</button>
		        </form>
      			</div>
			</c:if>
		</div>
    </nav>
    <!-- Verify success results -->
    <c:choose>
		<c:when test="${ cadastrado eq true }">
			<m:alert type="success">Usuário logado com sucesso</m:alert>
		</c:when> 
		<c:when test="${ alterado eq true }">
			<m:alert type="success">Senha alterada com sucesso</m:alert>
		</c:when> 
		<c:otherwise>  
		</c:otherwise> 
	</c:choose>
	<!-- End of verify success results -->
	<!-- Verify sessionScope User -->
    <c:choose>
    	<c:when test="${sessionScope.user != null and sessionScope.user.isAdmin eq true}">
    		<%@ include file="Navs/adminBar.jsp" %>
    	</c:when> 
    	<c:when test="${sessionScope.user != null and sessionScope.user.isAdmin eq false}">
    		<%@ include file="Navs/usuarioBar.jsp" %>
    	</c:when> 
    	<c:otherwise>  
    	</c:otherwise> 
   	</c:choose>
   	<!-- End of verify sessionScope User -->
	<script type="text/javascript" src="<c:url value="./js/default.js" />"></script>
</body>
</html>