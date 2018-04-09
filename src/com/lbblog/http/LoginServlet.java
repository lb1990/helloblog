package com.lbblog.http;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lbblog.db.DBDao;

import net.sf.json.JSONObject;

public class LoginServlet extends HttpServlet {
	DBDao dao;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=utf-8");
		boolean isAdm = cklogin(req);
		PrintWriter out = resp.getWriter();
		JSONObject json = new JSONObject();
		json.put("isAdm", isAdm);
		out.println(json);
		out.flush();
		out.close();
	}

	@Override
	public void init() throws ServletException {
		dao = new DBDao();
	}
	
	private boolean cklogin(HttpServletRequest req) {
		String name = req.getParameter("usrname");
		String pwd = req.getParameter("pwd");
		String sql = "select count(1) as num from b_user where name = ? and pwd = ?";
		Object [] params = new Object[]{name, pwd};
		List list = dao.query(sql, params);
		if(list == null || list.size() == 0)return false;
		Map map = (Map)list.get(0);
		Integer i = Integer.parseInt((String)map.get("num"));
		return i > 0;
	}
}
