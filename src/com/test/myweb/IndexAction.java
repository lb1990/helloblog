package com.test.myweb;

import org.apache.catalina.connector.Request;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexAction{
	//com.fasterxml.jackson.core
	
	@RequestMapping(value="/news", method=RequestMethod.GET)
	public @ResponseBody User handleRequest(@RequestParam String name) {
		User user = new User();
		user.setName(name);
		return user;
	}
	 
	class User {
		private String name;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
		
	}
}
