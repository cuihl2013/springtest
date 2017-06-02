package com.smart.dao.cost;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.smart.entity.Cost;

@Repository
public class CostDao {
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public int checkCostName(String name){
		String sql = "select count(*) from cost where name=?";
		int count = jdbcTemplate.queryForObject(sql,new Object[]{name}, Integer.class);
		return count;
	}
	
	/**
	 * 分页查询
	 * @param PageSize
	 * @param page
	 * @return
	 */
	public List<Cost> getAllCost(int PageSize, int page){
		List<Cost> costs = null;
		int minRow = PageSize*(page -1);
		int maxRow = PageSize*page;
		String sql = "select * from (select c.*, rownum rn from cost c where rownum <= ?) where rn > ?";
		costs = jdbcTemplate.query(sql, new Object[]{maxRow,minRow}, new ResultSetExtractor<List<Cost>>() {

			@Override
			public List<Cost> extractData(ResultSet rs) throws SQLException, DataAccessException {
				// TODO Auto-generated method stub
				List<Cost> costs = new ArrayList<Cost>();
				while (rs.next()) {
					Cost cost = new Cost();
					createCost(cost, rs);
					costs.add(cost);
				}
				
				return costs;
			}
		});
		
		return costs;
	}
	
	/**
	 * 查询总页数
	 * @param pageSize
	 * @return
	 */
	
	public int getPageNum(int pageSize){
		int pageNum = 0;
		String sql = "select count(*) from cost";
		int count = jdbcTemplate.queryForObject(sql, Integer.class);
		if (count%pageSize==0) {
			pageNum = count/pageSize;
		}else {
			pageNum = count/pageSize +1;
		}
		return pageNum;
	}
	
	public int addCost(Cost cost){
		String sql = "insert into cost values(cost_seq.nextval,?,?,?,?,'1',?,SYSDATE,null,?)";
		int result = jdbcTemplate.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setObject(1, cost.getName());
				ps.setObject(2, cost.getBaseDuration());
				ps.setObject(3, cost.getBaseCost());
				ps.setObject(4, cost.getUnitCost());
				ps.setObject(5, cost.getDescr());
				ps.setObject(6, cost.getCostType());
				
			}
		});
		
		return result;
		
	}
	
	
	public List<Cost> queryCost(String a){
		List<Cost> costs = null;
		return costs;
	}
	
	public void createCost(Cost cost, ResultSet rs){
		try {
			cost.setId(rs.getInt(1));
			cost.setName(rs.getString(2));
			cost.setBaseDuration(rs.getInt(3));
			cost.setBaseCost(rs.getDouble(4));
			cost.setUnitCost(rs.getDouble(5));
			cost.setStatus(rs.getString(6));
			cost.setDescr(rs.getString(7));
			cost.setCreateTime(rs.getDate(8));
			cost.setStartTime(rs.getDate(9));
			cost.setCostType(rs.getString(10));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

}
