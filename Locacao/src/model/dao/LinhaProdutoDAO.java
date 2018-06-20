package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Fabricante;
import model.LinhaProduto;

public class LinhaProdutoDAO extends BaseDAO {

	public List<LinhaProduto> getListProduto() throws SQLException {
		Connection con = null;
		PreparedStatement p = null;

		List<LinhaProduto> list = new ArrayList<>();
		try {
			con = getConnection();
			p = con.prepareStatement("select * from linhaProduto");
			ResultSet rs = p.executeQuery();
			while (rs.next()) {
				LinhaProduto lp = createLinhaProduto(rs);
				list.add(lp);
				System.out.println(lp.getId());
				System.out.println(lp.getNome());

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

	public LinhaProduto createLinhaProduto(ResultSet rs) throws SQLException {

		LinhaProduto lp = new LinhaProduto();

		lp.setId(rs.getInt("idLinhaProduto"));
		lp.setNome(rs.getString("nomeLinhaProduto"));

		return lp;
	}

	public void update(LinhaProduto linhaProduto) throws SQLException {
		Connection con = getConnection();
		try {
			PreparedStatement ps = con
					.prepareStatement("UPDATE linhaproduto SET nomeLinhaProduto = ?, where Fabricante_idFabricante = ?");
			ps.setString(1, linhaProduto.getNome());

			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void deleteLinhaProduto(LinhaProduto linhaProduto) throws SQLException {
		Connection con = getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("DELETE FROM linhaProduto WHERE id = ?");
			ps.setInt(2, linhaProduto.getId());
			ps.executeUpdate();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
