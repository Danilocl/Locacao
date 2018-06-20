package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import util.ReadConfig;

public class BaseDAO {

	ReadConfig config;

	public BaseDAO() {	
		try {

			Class.forName("com.mysql.jdbc.Driver");
			config = new ReadConfig();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	protected Connection getConnection() throws SQLException {
		Connection conn = DriverManager.getConnection(config.getJdbc_url(), config.getJdbc_username(),
				config.getJdbc_password());
		return conn;
	}

	public static void main(String[] args) throws SQLException {
		BaseDAO db = new BaseDAO();
		Connection conn = db.getConnection();
		System.out.println(conn);
	}

}
