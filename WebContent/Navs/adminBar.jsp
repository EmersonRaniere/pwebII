<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand">Olá, ${sessionScope.user.nome}</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="#">Cadastrar</a></li>
				<li><a href="#">Editar</a></li>
				<li><a href="#">Deletar</a></li>
				<li><a href="#">Mostrar todos</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
        		<li><a href="<c:url value='/admin/alterarsenha.jsp'/>">Alterar Senha</a></li>
        		<li><a href="<c:url value='/controller.do?acao=logout'/>">Logout</a></li>
      		</ul>
		</div> 
	</div> 
</nav>