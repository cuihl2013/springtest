package com.smart.service.cost;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.dao.cost.CostDao;
import com.smart.entity.Cost;

@Service
public class CostService {

	CostDao costDao;

	@Autowired
	public void setCostDao(CostDao costDao) {
		this.costDao = costDao;
	}
	
	public List<Cost> getPage(int pageSize, int page){
		return costDao.getAllCost(pageSize, page);
	}
	
	public int getPageNum(int pageSize){
		return costDao.getPageNum(pageSize);
	}
	
	
}
