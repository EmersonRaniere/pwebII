	<%@ include file="../Assets/header.jsp" %>
	
	<c:choose>
		<c:when test="${sessionScope.user != null and sessionScope.user.isAdmin eq true}">
			<%@ include file="../Navs/indexBar.jsp"%>
			<c:if test="${ error eq true }">
				<m:alert type="danger">Senha antiga inválida!</m:alert>
			</c:if>
			<%@ include file="../Navs/adminBar.jsp"%>
			
			<div class="container" style="width: 700px;">
				<form class="form-signin" method="post" action="${pageContext.request.contextPath}/controller.do">
					<input type="hidden" name="acao" value="alterarsenha">
					<h2 class="form-signin-heading">Alterar senha</h2>
					<input name="oldpassword" type="password" id="inputOldPassword" class="form-control" placeholder="Senha Antiga" required>
					<input name="newpassword" type="password" id="inputNewPassword"	class="form-control" placeholder="Senha Nova" required>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/default.js"></script>
</body>
</html>


