package com.lbblog.think;

import com.lbblog.db.DBDao;

public class BlogThink implements IBlogThink {
	private DBDao dao = new DBDao();

	public void queryContent() {
		String sql = "";
		Object [] params = {};  
		dao.query(sql, params);
	}

}
