package com.lbblog.http;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lbblog.db.DBDao;

import net.sf.json.JSONObject;
public class MyServlet extends HttpServlet {
	DBDao dao;
	
	@Override
	public void init() throws ServletException {
		super.init();
		dao = new DBDao();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		JSONObject json = new JSONObject();
		List list = getContent();
		json.put("content", list);
		out.println(json);
		out.flush();
		out.close();
	}
	private List getContent() {
		List list = dao.query("select * from b_article", null);
		return list;
	}
	
}
