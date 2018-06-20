package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Evento;
import model.Segmento;
import model.TipoSegEvento;

public class TipoSegExpositoDAO extends BaseDAO {
	
	public List<TipoSegEvento> getListTipoSegmentoEvento() throws SQLException {
		Connection con = null;
		PreparedStatement p = null;

		List<TipoSegEvento> list = new ArrayList<>();
		try {
			con = getConnection();
			p = con.prepareStatement(
					"select b.idEvento, b.nomeEvento, c.idSegmento, c.nomeSegmento from TipoSegmentoEvento a, Evento b, Segmento c where a.evento_idevento = b.idEvento and a.segmento_idsegmento = c.idSegmento");
			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				TipoSegEvento s = createSegmentoEvento(rs);
				list.add(s);

				System.out.println(s.getIdEvento());
				System.out.println(s.getIdSeg());

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

	public TipoSegEvento createSegmentoEvento(ResultSet rs) throws SQLException {

		TipoSegEvento sp = new TipoSegEvento();

		sp.setIdEvento(obterEvento(rs.getInt("idEvento")));
		sp.setIdSeg(obterSegmento(rs.getInt("isSegemento")));

		return sp;
	}

	private Evento obterEvento(int idEvento) throws SQLException {

		Connection con = null;
		PreparedStatement p = null;
		Evento s = new Evento();

		try {
			con = getConnection();
			p = con.prepareStatement("select * from Evento where idEvento= ?");
			p.setInt(1, idEvento);

			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				s.setId(rs.getInt("idEvento"));
				s.setNome(rs.getString("nomeEvento"));

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

		return s;
	}

	private Segmento obterSegmento(int idSegmento) throws SQLException {

		Connection con = null;
		PreparedStatement p = null;
		Segmento s = new Segmento();

		try {
			con = getConnection();
			p = con.prepareStatement("select * from Evento where idEvento= ?");
			p.setInt(1, idSegmento);

			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				s.setIdSeg(rs.getInt("isSegmento"));
				s.setNome(rs.getString("nomeSegmento"));

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

		return s;
	}

	public void update(TipoSegEvento tipoSeg) throws SQLException {
		Connection con = getConnection();
		Segmento s = new Segmento();
		Evento e = new Evento();
		try {
			PreparedStatement ps = con.prepareStatement(
					"UPDATE Evento, Segmento SET Evento.nome =? , SET Segmento.nome =? WHERE Segmento.idSeg = TipoSegEvento.idSegmento AND Evento.idEvento = TipoSegEvento.idEvento");
			ps.setString(2, s.getNome());
			ps.setString(2, e.getNome());
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void deleteSegmento(Segmento segmento) throws SQLException {
		Connection con = getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("DELETE FROM TipoSegEvento WHERE id = Segmento.idSeg AND Evento.idEvento");
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
