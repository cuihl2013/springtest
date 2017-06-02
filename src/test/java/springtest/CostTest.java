package springtest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

import com.smart.entity.Cost;
import com.smart.service.cost.CostService;

@ContextConfiguration("classpath*:/smart-context.xml")
public class CostTest extends AbstractTransactionalTestNGSpringContextTests{
	@Autowired
	private CostService costService;
	
	/*@Test
	public void testGetPage(){
		List<Cost> costs = costService.getPage(2, 1);
		System.out.println(costs.get(0).getId());
		System.out.println(costs.get(1).getId());
	}*/
	
	@Test
	public void testaddCost(){
		Cost cost = new Cost();
		cost.setName("sddd东方大道");
		cost.setBaseDuration(444);
		cost.setBaseCost(344d);
		cost.setCostType("2");
		cost.setDescr("sdf的发多少大师傅");
		cost.setUnitCost(344d);
		int i = costService.addCost(cost);
		System.out.println(i);
		
	}

	
}
