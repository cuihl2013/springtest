package com.smart.web.cost;

import java.util.List;
import java.util.concurrent.Callable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping("to_add_cost.html")
	ModelAndView toAddCost(){
		return new ModelAndView("cost_add");
	}
	
	@RequestMapping(value="cost_add.html", method= RequestMethod.POST)
	ModelAndView addCost(Cost cost){
		System.out.println("cost.name:"+cost.getName());
		costService.addCost(cost);
	//	new ModelAndView(viewName, modelName, modelObject);
		return new ModelAndView("forward:cost_list.html");
	}
	
	@RequestMapping(value = "checkCostName.html", method=RequestMethod.POST)
	ModelAndView checkCostName(String name){
		boolean b = costService.checkCostName(name);
		ModelAndView mav = new ModelAndView();
		if (b) {
			mav.addObject(true);
		}else {
			mav.addObject(false);
		}
		
		return mav;
	}
	
	
}
