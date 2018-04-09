package com.lbblog.http;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lbblog.db.DBDao;

import net.sf.json.JSONObject;

public class SaveServlet extends HttpServlet {
	DBDao dao;
	
	@Override
	public void init() throws ServletException {
		super.init();
		dao = new DBDao();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		boolean isPrs = isAlryPraise(req);
		PrintWriter out = resp.getWriter();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json; charset=utf-8");
		JSONObject json = new JSONObject();
		if(!isPrs) {
			updatePraise(req);
		}
		json.put("isPrs", isPrs);
		json.put("prsCount", getCmtCount(req));
		out.println(json);
		out.flush();
		out.close();
	}
	private int getCmtCount(HttpServletRequest req) {
		String articleId = req.getParameter("articleid");
		String sql = "select praiseCount from b_article where id = ?";
		Object [] params = new Object[]{articleId};
		List list = dao.query(sql, params);
		if(list == null || list.size() == 0)return 0;
		Map map = (Map)list.get(0);
		if(map.get("praiseCount") == null) return 0;
		Integer count = Integer.parseInt((String)map.get("praiseCount"));
		return count.intValue();
	}
	private boolean isAlryPraise(HttpServletRequest req) {
		String articleid = req.getParameter("articleid");
		String sessionid = req.getRequestedSessionId();
		articleid = articleid == null ? "" : articleid;
		sessionid = sessionid == null ? "" : sessionid;
		String sql = "select count from b_article_praise where article_id = ? and session_id = ?";
		Object [] params = new Object[]{articleid, sessionid};
		List list = dao.query(sql, params);
		if(list == null || list.size() == 0){
			sql = "insert into b_article_praise values (?,?,?,?)";
			String id = UUID.randomUUID().toString();
			params = new Object[]{id, 1, sessionid, articleid};
			dao.update(sql, params);
			return false;
		}
		Map map = (Map)list.get(0);
		Integer count = Integer.parseInt((String)map.get("count"));
		return count.intValue() > 0;
	}
	private void updatePraise(HttpServletRequest req) {
		String sql = null;
		String articleid = req.getParameter("articleid");
		Object [] params = null;
		sql = "update b_article t set t.praiseCount = "
				+ "(case when praiseCount is null then "
				+ "1 when praiseCount is not null then "
				+ "praiseCount+1 end) where t.id = ?";
		params = new Object[]{articleid};
		dao.update(sql, params);
	}
}
