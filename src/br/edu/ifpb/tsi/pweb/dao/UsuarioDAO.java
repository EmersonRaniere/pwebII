package br.edu.ifpb.tsi.pweb.dao;

import javax.persistence.Query;

import br.edu.ifpb.tsi.pweb.model.Usuario;

public class UsuarioDAO extends DAO<Usuario>{
	public UsuarioDAO(){
		
	}
	public Usuario findByCredentials(String email, String senha){
		Query q = manager.createQuery("SELECT u FROM Usuario u WHERE u.email = :email AND u.password = :senha");
		q.setParameter("email", email);
		q.setParameter("senha", senha);
		try{
			Usuario u = (Usuario)q.getSingleResult();
			if (u != null){
				System.out.println("entrou aqui1");
				return u;
			}else{
				System.out.println("entrou aqui2");
				return null;
			}
		}
		catch (Exception e) {
			return null;
		}
	}
  
  	public Boolean updatePassword(String oldpass, String newpass, String email){
  		if (oldpass != null && newpass != null && email != null){
  			Query q = manager.createQuery("UPDATE Usuario u SET u.password = :newpass WHERE ( u.email = :email AND u.password = :oldpass)");
  			q.setParameter("email", email);
  			q.setParameter("oldpass", oldpass);
  			q.setParameter("newpass", newpass);
  			try {
  				int verifyWorked = (int) q.executeUpdate();
  				System.out.println(verifyWorked);
  				if (verifyWorked != 0) {
  					return true;
  				}else {
  					return false;
  				}
			} catch (Exception e) {
				return false;
			}
  		}
  		return false;
  	}
  	
  	public Boolean deleteByUserEmail (Usuario user){
  		if(user != null){
  			String email = user.getEmail();
  			Query q = manager.createQuery("DELETE Usuario u WHERE u.email = :email");
  				q.setParameter("email", email);
  				try {
  	  				int verifyWorked = (int) q.executeUpdate();
  	  				System.out.println(verifyWorked);
  	  				if (verifyWorked != 0) {
  	  					return true;
  	  				}else {
  	  					return false;
  	  				}
  				} catch (Exception e) {
  					return false;
  				}
  	  		}
  	  		return false;
  		}
  		
  	
}