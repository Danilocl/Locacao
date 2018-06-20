package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.LinhaProduto;
import model.Segmento;

public class SegmentoDAO extends BaseDAO {

	public List<Segmento> getListProduto() throws SQLException {
		Connection con = null;
		PreparedStatement p = null;

		List<Segmento> list = new ArrayList<>();
		try {
			con = getConnection();
			p = con.prepareStatement("select * from Segmento");
			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				Segmento s = createSegmento(rs);
				list.add(s);

				System.out.println(s.getNome());
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

	public Segmento createSegmento(ResultSet rs) throws SQLException {

		Segmento s = new Segmento();

		s.setIdSeg(rs.getInt("idSegmento"));
		s.setNome(rs.getString("nomeSegmento"));

		return s;
	}

	public void update(Segmento segmento) throws SQLException {
		Connection con = getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("UPDATE segmento SET nomeSegmento = ? where idSegemento = ?");
			ps.setString(1, segmento.getNome());
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteSegmento(Segmento segmento) throws SQLException {
		Connection con = getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("DELETE FROM segmento WHERE id = ?");
			ps.setString(1, segmento.getNome());
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
