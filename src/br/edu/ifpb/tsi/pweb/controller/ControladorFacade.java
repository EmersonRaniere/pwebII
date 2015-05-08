package br.edu.ifpb.tsi.pweb.controller;

import java.util.List;

import br.edu.ifpb.tsi.pweb.dao.DAO;
import br.edu.ifpb.tsi.pweb.dao.UsuarioDAO;
import br.edu.ifpb.tsi.pweb.model.Usuario;

public class ControladorFacade{
	private UsuarioDAO uDao = new UsuarioDAO();
    
  	public Usuario usuarioLogar(String email, String senha){
	    if(!(email.equals(null) && senha.equals(null))){
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
	    return null;
	}
  
  	public Boolean usuarioTrocarSenha(String oldpass, String newpass, String email){
  		if(!(oldpass.equals(null) && newpass.equals(null) && email.equals(null))){
  			DAO.begin();
  		    if (uDao.updatePassword(oldpass, newpass, email)){
  		    	DAO.commit();
  		    	return true;
  		    }else{
  		    	return false;
  		    }
  		}
  		return null;
  	}
  	public Boolean usuarioCreate(Usuario newUser){
  		if (newUser != null){
  			List<Usuario> userList = this.uDao.readAll();
  			for (Usuario usuario : userList) {
				if(usuario.getEmail().equalsIgnoreCase(newUser.getEmail())){
					return false;
				}
			}
  			DAO.begin();
  	  		try {
  				uDao.create(newUser);
  				DAO.commit();
  				return true;
  			} catch (Exception e) {
  				return false;
  			}
  		}
  		return false;
  	}
  
	public Boolean usuarioDeletar(Usuario userErase) {
		System.out.println("passouaqui1");
		if ((userErase != null) && ( !userErase.getIsAdmin() ) ){
			System.out.println("passouaqui2");
  			DAO.begin();
  			uDao.deleteByUserEmail(userErase);
  			DAO.commit();
  			return true;
  		}
		return false;
	}
		  
  
  public void usuarioLoggedAddAnnotation() {}
  
  public void usuarioLoggedRemoveAnnotation() {}
  
  public void usuaarioLoggedUpdateAnnotation() {}
  
  public void adminCreateHoliday() {}
  
  public void adminReadHoliday() {}
  
  public void adminDeleteHoliday() {}
  
  public void adminUpdateHoliday() {}
  
  public void adminUpdatePassword() {}
}
