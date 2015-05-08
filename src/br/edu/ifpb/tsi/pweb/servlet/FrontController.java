package br.edu.ifpb.tsi.pweb.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifpb.tsi.pweb.controller.ControladorFacade;
import br.edu.ifpb.tsi.pweb.model.Usuario;

@SuppressWarnings("serial")
@WebServlet(urlPatterns={"/controller.do"}, name="FrontController")
public class FrontController  extends HttpServlet{

	ControladorFacade cf = new ControladorFacade();
	Usuario u = new Usuario();
  
	@SuppressWarnings("unused")
	private void doRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
	    String op = request.getParameter("acao");
		
	    switch (op) {
		case "logar":
			String email = request.getParameter("email");
	        String senha = request.getParameter("senha");
	        
	        u = cf.usuarioLogar(email, senha);
	        if (u != null){
	        	request.setAttribute("logado", true);
	        	request.getSession().setAttribute("user", u);
	        	request.getRequestDispatcher("index.jsp").forward(request, response);
	        	System.out.println("Setou sessão, dispachou para index.jsp");
	        }else{
	        	request.setAttribute("error", true);
	        	request.getRequestDispatcher("login.jsp").forward(request, response);
	        	System.out.println("Não conseguiu abrir a sessão, setando atributo error, redirecionando para index.jsp");
	        }
	        System.out.println("Concluida a operacao logar");
		break;
		
		case "logout":
			request.getSession().removeAttribute("user");
	        response.sendRedirect("index.jsp");
		break;
		
		case "alterarsenha":
	        String oldpassword = request.getParameter("oldpassword");
	        String newpassword = request.getParameter("newpassword");
	        
	        Usuario user = (Usuario)request.getSession().getAttribute("user");
	        String userEmail = user.getEmail();
	        Boolean sucesso = this.cf.usuarioTrocarSenha(oldpassword, newpassword, userEmail);
	        if (sucesso){
	        	request.setAttribute("alterado", true);
	        	request.getRequestDispatcher("index.jsp").forward(request, response);
	        	System.out.println("Senha alterada com sucesso, atributo sucesso no request!");
	        }else{
	        	request.setAttribute("error", Boolean.valueOf(true));
	        	request.getRequestDispatcher("/admin/alterarsenha.jsp").forward(request, response);
	        	System.out.println("Não conseguiu Alterar a senha do Administrador, setando atributo error, redirecionando para alterarsenha.jsp");
	        }
	        System.out.println("Concluida a operação de alterar senha.");
		break;
		
		case "cadastrarusuario":
			String newUserName = request.getParameter("nome");
			String newUserEmail = request.getParameter("email");
			String newUserPass = request.getParameter("password");
			
			Usuario newUser = new Usuario();
			newUser.setNome(newUserName);
			newUser.setEmail(newUserEmail);
			newUser.setPassword(newUserPass);
			newUser.setIsAdmin(false);
			Boolean verifyCadastro = null;
			verifyCadastro = cf.usuarioCreate(newUser);
			if (verifyCadastro){
	        	request.setAttribute("cadastradousuario", true);
	        	request.getSession().setAttribute("user", newUser);
	        	request.getRequestDispatcher("index.jsp").forward(request, response);
	        	System.out.println("Usuario criado com sucesso, dispachou para index.jsp");
	        }else{
	        	request.setAttribute("error", true);
	        	request.getRequestDispatcher("cadastrar.jsp").forward(request, response);
	        	System.out.println("Não conseguiu cadastrar usuario, setando atributo error, redirecionando para index.jsp");
	        }
	        System.out.println("Concluida a operacao cadastrar");
			
		break;
		
		case "deletarusuario":{
		
			
		break;
		}
	
		default:
			break;
		}
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	  doRequest(request, response);
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	  doRequest(request, response);
  }
}
