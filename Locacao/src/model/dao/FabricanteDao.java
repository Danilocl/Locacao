package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Expositor;
import model.Fabricante;

public class FabricanteDao extends BaseDAO {

	public List<Fabricante> getListExpositor() throws SQLException {
		Connection con = null;
		PreparedStatement p = null;

		List<Fabricante> list = new ArrayList<>();
		try {
			con = getConnection();
			p = con.prepareStatement("select * from Fabricante");
			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				Fabricante f = createFabricante(rs);
				list.add(f);
				System.out.println(f.getId());
				System.out.println(f.getNome());
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

	public Fabricante createFabricante(ResultSet rs) throws SQLException {

		Fabricante f = new Fabricante();

		f.setId(rs.getInt("idFabricante"));
		f.setNome(rs.getString("nomeFabricante"));

		return f;
	}

	public void update(Fabricante fabricante) throws SQLException {
		Connection con = getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("UPDATE fabricante SET nome = ? WHERE idUser = ?");
			ps.setString(1, fabricante.getNome());
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteFabricante(Fabricante fabricante) throws SQLException {
		Connection con = getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("DELETE FROM fabricante WHERE id = ?");
			ps.setInt(1, fabricante.getId());
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
