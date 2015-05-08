<%@ include file="Assets/header.jsp" %>
	<%@ include file="Navs/indexBar.jsp" %>
	
	<c:choose>
	<c:when test="${sessionScope.user != null}">
		<c:redirect url="./"/>
	</c:when> 
	<c:otherwise>  
		<c:if test="${ error eq true }">
			<m:alert type="danger">Usuário ou Senha inválidos</m:alert>
		</c:if>
		<div class="container" style="width:700px;">
			<form class="form-signin" method="post" action="controller.do">
				
				<input type="hidden" name="acao" value="logar">
				<h2 class="form-signin-heading">Logar no sistema</h2>
				<input name="email" type="text" id="inputEmail" class="form-control" placeholder="Email address" required>
				<input name="senha" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
				<div class="checkbox">
					<button class="btn btn-success" type="submit">Logar</button>
				</div>
			</form>
		</div>
		<script type="text/javascript" src="<c:url value="${pageContext.servletContext.contextPath}/js/default.js" />"></script>
	</c:otherwise> 
</c:choose>
</body>
</html>