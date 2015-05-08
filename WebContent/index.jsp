<%@ include file="Assets/header.jsp" %>
	<nav class="navbar navbar-inverse">
		<div class="container">
 			<div class="navbar-header">
  				<a class="navbar-brand" href="<c:url value='/index.jsp'/>">Calendário Web - Emerson Raniere, Jonathas Almeida</a>
			</div>
			<c:if test="${sessionScope.user == null}">
				<div id="navbar" class="navbar-collapse collapse">
		        <form class="navbar-form navbar-right" method="post" action="login.jsp">
		       		<button type="submit" class="btn btn-success">Entrar</button>
		        </form>
		        <form class="navbar-form navbar-right" method="post" action="cadastrar.jsp">
		       		<button type="submit" class="btn btn-success">Cadastrar</button>
		        </form>
      			</div>
			</c:if>
		</div>
    </nav>
    <!-- Verify success results -->
    <c:choose>
		<c:when test="${ logado eq true }">
			<m:alert type="success">Usuário logado com sucesso!</m:alert>
		</c:when> 
		<c:when test="${ alterado eq true }">
			<m:alert type="success">Senha alterada com sucesso!</m:alert>
		</c:when>
		<c:when test="${ cadastradousuario eq true }">
			<m:alert type="success">Usuario cadastrado com sucesso!</m:alert>
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
	<script type="text/javascript" src="<c:url value="${pageContext.request.contextPath}/js/default.js" />"></script>
</body>
</html>