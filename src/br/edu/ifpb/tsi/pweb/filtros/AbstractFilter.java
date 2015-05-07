package br.edu.ifpb.tsi.pweb.filtros;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AbstractFilter
{
  protected void doLogin(ServletRequest request, ServletResponse response, HttpServletRequest req)
    throws ServletException, IOException
  {
    HttpServletResponse httpServletResponse = (HttpServletResponse)response;
    httpServletResponse.sendRedirect("login.jsp");
  }
}
