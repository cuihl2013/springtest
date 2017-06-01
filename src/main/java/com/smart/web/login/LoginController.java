package com.smart.web.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.smart.entity.Admin;
import com.smart.service.login.ServiceLogin;

@Controller
public class LoginController {
	private ServiceLogin serviceLogin;
	
	@RequestMapping(value="index.html")
	public String loginPage(){
		return "login";
	}

	@RequestMapping(value="loginCheck.html")
	public ModelAndView loginCheck(HttpServletRequest request, Admin admin){
	//	System.out.println(admin.getAdminCode() + "     "+admin.getPassword());
		boolean isValidUser = serviceLogin.hasMatchUser(admin.getAdminCode(), admin.getPassword());
		
		if (!isValidUser) {
			return new ModelAndView("login", "error", "用户名或者密码不正确");
		}else {
			request.getSession().setAttribute(admin.getAdminCode(), admin.getPassword());
			return new ModelAndView("main");
		}
	}
	
	@Autowired
	public void setServiceLogin(ServiceLogin serviceLogin) {
		this.serviceLogin = serviceLogin;
	}
	
}
