package br.edu.ifpb.tsi.pweb.filtros;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import br.edu.ifpb.tsi.pweb.model.Usuario;

public class LoginCheckFilter extends AbstractFilter implements Filter{
  public void init(FilterConfig fConfig) throws ServletException{
  }
  
  public void destroy() {
  }
  
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    throws IOException, ServletException {
	  
    HttpServletRequest req = (HttpServletRequest)request;
    HttpSession session = req.getSession();
    if (session.isNew()){
      doLogin(request, response, req);
      return;
    }
    Usuario user = (Usuario)session.getAttribute("user");
    if (user == null){
      doLogin(request, response, req);
      return;
    }
    chain.doFilter(request, response);
  }
}
