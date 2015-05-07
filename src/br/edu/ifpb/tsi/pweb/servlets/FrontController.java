package br.edu.ifpb.tsi.pweb.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.ifpb.tsi.pweb.controller.ControladorFacade;
import br.edu.ifpb.tsi.pweb.model.Usuario;

@WebServlet(urlPatterns={"/controller.do"}, name="FrontController")
public class FrontController  extends HttpServlet{
  ControladorFacade cf = new ControladorFacade();
  Usuario u = new Usuario();
  
  private void doRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    String op = request.getParameter("acao");
    String str1;
    switch ((str1 = op).hashCode())
    {
    case -1097329270: 
      if (str1.equals("logout")) {
        break;
      }
      break;
    case -12587097: 
      if (str1.equals("cadastrarusuario")) {}
      break;
    case 27338734: 
      if (str1.equals("alterarsenha")) {}
    case 103149173: 
      if ((goto 450) && (str1.equals("logar")))
      {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        this.u = this.cf.usuarioLogar(email, senha);
        if (this.u != null)
        {
          request.setAttribute("cadastrado", Boolean.valueOf(true));
          request.getSession().setAttribute("user", this.u);
          request.getRequestDispatcher("index.jsp").forward(request, response);
          System.out.println("Setou sess�o, dispachou para index.jsp");
        }
        else
        {
          request.setAttribute("error", Boolean.valueOf(true));
          request.getRequestDispatcher("login.jsp").forward(request, response);
          System.out.println("N�o conseguiu abrir a sess�o, setando atributo error, redirecionando para index.jsp");
        }
        System.out.println("Concluida a operacao logar");
        return;
        
        request.getSession().removeAttribute("user");
        response.sendRedirect("index.jsp");
        return;
        
        String oldpassword = request.getParameter("oldpassword");
        String newpassword = request.getParameter("newpassword");
        
        Usuario user = (Usuario)request.getSession().getAttribute("user");
        String userEmail = user.getEmail();
        Boolean sucesso = this.cf.usuarioTrocarSenha(oldpassword, newpassword, userEmail);
        if (sucesso.booleanValue())
        {
          request.setAttribute("alterado", Boolean.valueOf(true));
          request.getRequestDispatcher("index.jsp").forward(request, response);
          
          System.out.println("Senha alterada com sucesso, atributo sucesso no request!");
        }
        else
        {
          request.setAttribute("error", Boolean.valueOf(true));
          request.getRequestDispatcher("/admin/alterarsenha.jsp").forward(request, response);
          System.out.println("N�o conseguiu Alterar a senha do Administrador, setando atributo error, redirecionando para alterarsemja.jsp");
        }
        System.out.println("Concluida a opera��o de alterar senha.");
        return;
        
        System.out.println("Chegou aqui2!");
        response.sendRedirect("index.jsp");
      }
      break;
    }
  }
  
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    doRequest(request, response);
  }
  
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    doRequest(request, response);
  }
}
