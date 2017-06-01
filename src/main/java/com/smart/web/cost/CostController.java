package com.smart.web.cost;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.smart.entity.Cost;
import com.smart.service.cost.CostService;

@Controller
public class CostController {

	private CostService costService;

	@Autowired
	public void setCostService(CostService costService) {
		this.costService = costService;
	}
	
	@RequestMapping("cost_list.html")
	ModelAndView costList( HttpServletRequest request, @RequestParam(value="pageSize", defaultValue="5") int pageSize,@RequestParam(value="page", defaultValue="2") int page){
		 
		List<Cost> costs  = costService.getPage(pageSize, page);
		int pageNum = costService.getPageNum(pageSize);
		ModelAndView mav = new ModelAndView();
		mav.addObject("costs", costs);
		mav.addObject("page", page);
		mav.addObject("pageNum", pageNum);
		return mav;
	}
	
	@RequestMapping("cost_add.html")
	ModelAndView addCost(){
		return null;
	}
	
	
}
