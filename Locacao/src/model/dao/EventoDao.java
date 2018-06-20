package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Evento;

public class EventoDao extends BaseDAO {

	public List<Evento> getListEvento() throws SQLException {
		Connection con = null;
		PreparedStatement p = null;

		List<Evento> list = new ArrayList<>();
		try {
			con = getConnection();
			p = con.prepareStatement("select * from Evento");
			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				Evento e = createEvento(rs);
				list.add(e);
				System.out.println(e.getNome());
			}
			rs.close();

		} finally {
			if (p != null) {
				p.close();
			}
			if (p != null) {
				p.close();
			}

		}
		return list;

	}

	public Evento createEvento(ResultSet rs) throws SQLException {

		Evento e = new Evento();
		e.setId(rs.getInt("Evento_id"));
		e.setNome(rs.getString("Evento_nome"));

		return e;

	}

	public void update(Evento evento) throws SQLException {
		Connection con = getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("UPDATE evento SET nome = ? set WHERE id = ?");
			ps.setString(1, evento.getNome());
			ps.setInt(2, evento.getId());
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteEvento(Evento evento) throws SQLException {
		Connection con = getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("DELETE FROM client WHERE cpf = ?");
			ps.setString(1, evento.getNome());
			ps.setInt(2, evento.getId());
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
