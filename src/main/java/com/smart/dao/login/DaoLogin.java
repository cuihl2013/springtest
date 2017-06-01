package com.smart.dao.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class DaoLogin {
	
	private JdbcTemplate jdbcTemplate;

	public int getMatchCount(String adminCode, String passwd){
		String sql = "select count(*) from admin_info where admin_code=? and password=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {adminCode, passwd}, Integer.class);
		
	}
	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	
}
