package br.edu.ifpb.tsi.pweb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usuario {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(length = 50)
	private String nome;
	@Column(length = 50)
	private String email;
	@Column(length = 25)
	private String password;
	@Column(length = 1)
	private Boolean isAdmin;
	
	public Usuario(String nome, String email, String password, Boolean isAdmin) {
		this.nome = nome;
		this.email = email;
		this.password = password;
		this.isAdmin = isAdmin;
	}
	
	public Usuario() {
	}

	public Boolean getIsAdmin() {
		return this.isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public long getId() {
		return this.id.longValue();
	}

	public String getNome() {
		return this.nome;
	}

	public String getEmail() {
		return this.email;
	}

	public String getPassword() {
		return this.password;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Usuario [email=");
		builder.append(this.email);
		builder.append(", password=");
		builder.append(this.password);
		builder.append("]");
		return builder.toString();
	}
}
