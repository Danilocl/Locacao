package control;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.Evento;
import model.dao.EventoDao;

public class ControlEvento {

	public void CadastroEvento(Evento e) throws SQLException {
		EventoDao eventoDAO = new EventoDao();

		eventoDAO.insertEvento(e);

	}
}
