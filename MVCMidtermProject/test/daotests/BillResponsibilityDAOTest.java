package daotests;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import data.BillResponsibilityDAO;
import entities.Account;
import entities.BillResponsibility;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../WEB-INF/Test-context.xml" })
@WebAppConfiguration
@Transactional
public class BillResponsibilityDAOTest {

	BillResponsibility br;
	int id;

	@Autowired
	private WebApplicationContext wac;

	@Autowired
	private BillResponsibilityDAO dao;

	@PersistenceContext
	private EntityManager em;

	@Before
	public void setUp() {
		dao = (BillResponsibilityDAO) wac.getBean("billResponsibilityDao");
	}

	@Test
	public void showResponsibility() {
		BillResponsibility br = em.find(BillResponsibility.class, 1);
		dao.showResponsibility(1);
		assert (br.getPercent() == 25);
	}

//	@Test
//	public void createResponsibility() {
//		BillResponsibility br = new BillResponsibility();
//		br = em.find(BillResponsibility.class, 3);
//		BillResponsibility b = dao.updateResponsibility(br);
//		assertEquals(50, b.getPercent());
//
//	}

	@Test
	public void updateResponsibility() {
		BillResponsibility br = new BillResponsibility();
		br = em.find(BillResponsibility.class, 3);
//		BillResponsibility b = dao.updateResponsibility(br);
		assertEquals(50, br.getMember());

	}

	@After
	public void tearDown() {
		dao = null;
		em = null;
		wac = null;
	}

}
