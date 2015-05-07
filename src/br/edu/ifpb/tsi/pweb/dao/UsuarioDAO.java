package br.edu.ifpb.tsi.pweb.dao;

import javax.persistence.Query;
import br.edu.ifpb.tsi.pweb.model.Usuario;

public class UsuarioDAO extends DAO<Usuario>{
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
  		if ((oldpass != null) && (newpass != null) && (email != null)){
  			Query q = manager.createQuery("UPDATE Usuario u SET u.password = :newpass WHERE ( u.email = :email AND u.password = :oldpass)");
  			q.setParameter("email", email);
  			q.setParameter("oldpass", oldpass);
  			q.setParameter("newpass", newpass);
  			int verifyWorked = q.executeUpdate();
  			System.out.println(verifyWorked);
  				if (verifyWorked != 0) {
  					return true;
  				}else {
  					return false;
  				}
  		}
  		return false;
  	}
}