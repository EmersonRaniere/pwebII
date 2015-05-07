<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="m" tagdir="/WEB-INF/tags"%>
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
<title>Alterar senha - PwebII</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" type="text/css"	href="${pageContext.request.contextPath}/bootstrap-3.3.4-dist/css/bootstrap.css">
<script	src="${pageContext.request.contextPath}/bootstrap-3.3.4-dist/js/bootstrap.js"></script>
<script	src="${pageContext.request.contextPath}/bootstrap-3.3.4-dist/js/jquery-1.11.3.min.js"></script>

</head>
<body>
	<c:choose>
		<c:when
			test="${sessionScope.user != null and sessionScope.user.isAdmin eq true}">
			<%@ include file="../Navs/indexBar.jsp"%>
			<%@ include file="../Navs/adminBar.jsp"%>
			<c:if test="${ error eq true }">
				<m:alert type="danger">Senha antiga não está correta!</m:alert>
			</c:if>
			<div class="container" style="width: 700px;">
				<form class="form-signin" method="post">
					action="${pageContext.request.contextPath}/controller.do">

					<input type="hidden" name="acao" value="alterarsenha">
					<h2 class="form-signin-heading">Alterar senha</h2>
					<input name="oldpassword" type="password" id="inputOldPassword"
						class="form-control" placeholder="Senha Antiga" required>
					<input name="newpassword" type="password" id="inputNewPassword"
						class="form-control" placeholder="Senha Nova" required>
					<div class="checkbox">
						<button class="btn btn-success" type="submit">Alterar</button>
					</div>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<c:redirect url="../index.jsp" />
		</c:otherwise>
	</c:choose>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/default.js"></script>
</body>
</html>


