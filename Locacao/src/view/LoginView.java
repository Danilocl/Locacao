package view;

import java.sql.SQLException;

import javax.faces.bean.ManagedBean;

import control.ControlEvento;
import control.ControlLogin;

@ManagedBean
public class LoginView {

	private String nome;
	private String senha;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	public void cadastrarExpositor() {
		ControlLogin controllerLogin = new ControlLogin();
		controllerLogin.cadastrarExpositor();		
		System.out.println(this.nome);
		this.senha = this.nome;
	}
	

}