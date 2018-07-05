package view;

import java.sql.SQLException;

import javax.faces.bean.ManagedBean;

import control.ControlEvento;
import model.Evento;

@ManagedBean
public class CadastroEvento {

	private int id;
	private String nome;
	private String dia;
	private String local;
	private String data;
	private String horario;
	public int getId() {
		return id;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDia() {
		return dia;
	}

	public void setDia(String dia) {
		this.dia = dia;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getHorario() {
		return horario;
	}

	public void setHorario(String horario) {
		this.horario = horario;
	}

	public void cadastrarEvento() throws SQLException {
		ControlEvento controllerEvento = new ControlEvento();
		Evento evento = new Evento();
		evento.setData( this.data);
		evento.setHorario(this.horario);
		evento.setId(this.id);
		evento.setLocal(this.local);
		evento.setNome(this.nome);
		controllerEvento.CadastroEvento(evento);								
	}

}