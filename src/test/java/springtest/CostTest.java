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
	
	@Test
	public void testGetPage(){
		List<Cost> costs = costService.getPage(2, 1);
		System.out.println(costs.get(0).getId());
		System.out.println(costs.get(1).getId());
	}

	
}
