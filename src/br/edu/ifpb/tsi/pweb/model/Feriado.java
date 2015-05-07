package br.edu.ifpb.tsi.pweb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Feriado {

	@Id
	@GeneratedValue
	private int id;
	@Column(length = 50)
	private String nome;
	@Column(length = 100)
	private String descricao;
	@Column(length = 2)
	private int dia;
	@Column(length = 10)
	private int mes;
	@Column(length = 4)
	private int ano;
	@Column(length = 1)
	private boolean eFixo;
	@Column(length = 10)
	private int idSubstituto;

	public Feriado() {
	}// Construtor Vazio

	public Feriado(String nome, String descricao, int dia, int mes, int ano,
			boolean eFixo, int idSubstituto) {
		super();
		this.nome = nome;
		this.descricao = descricao;
		this.dia = dia;
		this.mes = mes;
		this.ano = ano;
		this.eFixo = eFixo;
		this.idSubstituto = idSubstituto;
	}

	// GETS
	public int getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public int getDia() {
		return dia;
	}

	public int getMes() {
		return mes;
	}

	public int getAno() {
		return ano;
	}

	public boolean iseFixo() {
		return eFixo;
	}

	public int getIdSubstituto() {
		return idSubstituto;
	}

	// SETS
	public void setId(int id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public void setDia(int dia) {
		this.dia = dia;
	}

	public void setMes(int mes) {
		this.mes = mes;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public void seteFixo(boolean eFixo) {
		this.eFixo = eFixo;
	}

	public void setIdSubstituto(int idSubstituto) {
		this.idSubstituto = idSubstituto;
	}
	

}
