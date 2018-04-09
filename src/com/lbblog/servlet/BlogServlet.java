package com.lbblog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lbblog.db.DBDao;
import com.lbblog.think.BlogThink;
import com.lbblog.think.IBlogThink;

import net.sf.json.JSONObject;

public class BlogServlet extends HttpServlet{
	private IBlogThink blogtk = new BlogThink();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		JSONObject json = new JSONObject();
		resp.setCharacterEncoding("UTF-8");
		json.accumulate("master", "cute");
		//out.println("welcome to maimeng2ha website, because time is hot, so wait a minite");
		out.println(json);
		out.flush();
		out.close();
	}

	
}
