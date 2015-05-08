	<%@ include file="Assets/header.jsp" %>
	<%@ include file="Navs/indexBar.jsp" %>
	<div class="container" style="width:700px;">
		<form class="form-signin" method="post" action="${pageContext.request.contextPath}/controller.do">
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