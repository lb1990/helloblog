package com.lbblog.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBDao {
	
	private Connection conn;
	
	public List query(String sql, Object [] params) {
		Connection conn = getConn();
		PreparedStatement pst = null;
		ResultSet rs = null;
		List list = new ArrayList();
		try {
			pst = conn.prepareStatement(sql);
			if(params != null) {
				for(int i=1; i<=params.length; i++) {
					pst.setObject(i, params[i-1]);
				}
			}
			rs = pst.executeQuery();
			ResultSetMetaData count = pst.getMetaData();
			int columnCount = count.getColumnCount();
			while (rs.next()) {
				Map map = new HashMap();
				for (int i=1; i<=columnCount; i++) {
					map.put(count.getColumnName(i), rs.getString(i));
				}
				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs,pst,conn);
		}
		return list;
	}
	
	public void update(String sql, Object [] params) {
		Connection conn = getConn();
		PreparedStatement pst = null;
		try {
			pst = conn.prepareStatement(sql);
			for(int i=0; i<params.length; i++) {
				pst.setString(i+1, params[i].toString());
			}
			int i=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(null,pst,conn);
		}
	}
	
	public Connection getConn() {
		if(conn != null) return conn;
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String url = "jdbc:mysql://localhost:3306/blog";
		String user = "linbin";
		String password = "aliens2017";
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void close(ResultSet rs, PreparedStatement pst, Connection conn){
		try {
			if(rs != null) {
				rs.close();
			}
			if(pst != null) {
				pst.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		DBDao dao = new DBDao();
		System.out.println(dao.getConn());
		dao.update("insert into b_login_record values (?,?,?)", new Object[]{3, "baidu", "1.1.1.1"});
	}
	
}
