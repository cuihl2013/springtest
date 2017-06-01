package com.smart.service.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.dao.login.DaoLogin;

@Service
public class ServiceLogin {
	private DaoLogin daoLogin;


	public boolean hasMatchUser(String adminCode, String passwd){
		return daoLogin.getMatchCount(adminCode, passwd) > 0;
	}
	@Autowired
	public void setDaoLogin(DaoLogin daoLogin) {
		this.daoLogin = daoLogin;
	}
	
	

}
