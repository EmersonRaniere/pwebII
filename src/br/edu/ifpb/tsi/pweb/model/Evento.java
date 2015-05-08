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
public class Evento {

	@Id
	@GeneratedValue
	private int id;
	
	@ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	private Usuario usuario;
	@Column(length = 20)
	private String titulo;
	@Column(length = 50)
	private String descricao;
	@Temporal (TemporalType.DATE)
	private Date data;
	
	public Evento(){}// Construtor Vazio

	public Evento(String descricao, Date data, Usuario usuario) {
		this.titulo = titulo;
		this.descricao = descricao;
		this.data = data;
		this.usuario = usuario;
	}

//	GETS
	public int getId() {
		return id;
	}

	public String getTitulo() {
		return titulo;
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

	public void setTitulo(String titulo) {
		this.titulo = titulo;
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
