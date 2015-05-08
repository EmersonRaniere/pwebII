package br.edu.ifpb.tsi.pweb.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Nota {

	@Id
	@GeneratedValue
	private int id;
	
	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private Usuario usuario;
	@Column(length = 50)
	private String descricao;
	@Temporal (TemporalType.DATE)
	private Date data;
	
	public Nota(){}// Construtor Vazio

	public Nota(String descricao, Date data, Usuario usuario) {
		this.descricao = descricao;
		this.data = data;
		this.usuario = usuario;
	}

//	GETS
	public int getId() {
		return id;
	}

	public String getDescricao() {
		return descricao;
	}
	
	public Date getData() {
		return data;
	}
	
	public Usuario getUsuario() {
		return usuario;
	}
	
	
//	SETS
	public void setId(int id) {
		this.id = id;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setData(Date data) {
		this.data = data;
	}
	
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
}
