package br.edu.ifpb.tsi.pweb.controller;

import br.edu.ifpb.tsi.pweb.dao.DAO;
import br.edu.ifpb.tsi.pweb.dao.UsuarioDAO;
import br.edu.ifpb.tsi.pweb.model.Usuario;

public class ControladorFacade
{
  private UsuarioDAO uDao = new UsuarioDAO();
  
  public void usuarioList() {}
  
  	public Usuario usuarioLogar(String email, String senha){
	    DAO.begin();
	    Usuario u = uDao.findByCredentials(email, senha);
	    System.out.println("passou por findbyCredentials");
	    if (u != null){
	    	System.out.println("u != null");
	    	DAO.commit();
	    	return u;
	    }else{
	    	System.out.println("u == null");
	    	return null;
	    }
	}
  
  	public Boolean usuarioTrocarSenha(String oldpass, String newpass, String email){
	    if (uDao.updatePassword(oldpass, newpass, email)){
	    	DAO.commit();
	    	return true;
	    }else{
	    	return false;
	    }
  	}
  
  public void usuarioDelete() {}
  
  public void usuarioLoggedAddAnnotation() {}
  
  public void usuarioLoggedRemoveAnnotation() {}
  
  public void usuaarioLoggedUpdateAnnotation() {}
  
  public void adminCreateHoliday() {}
  
  public void adminReadHoliday() {}
  
  public void adminDeleteHoliday() {}
  
  public void adminUpdateHoliday() {}
  
  public void adminUpdatePassword() {}
}
