package daotests;

import static org.junit.Assert.*;

import java.util.List;

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

import data.BillDAO;
import entities.Bill;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "../WEB-INF/Test-context.xml" })
@WebAppConfiguration
@Transactional
public class BillDAOTest {
	
	@Autowired
	private WebApplicationContext wac;

	@Autowired
	private BillDAO dao;

	@PersistenceContext
	private EntityManager em;

	@Before
	public void setUp() {
		dao = (BillDAO)wac.getBean("billDao");
	}

	@After
	public void tearDown() {
		dao = null;
		em = null;
		wac = null;
	}
	
	@Test
	public void test_get_all_family_bills() { // test getFamilyBills method
		List<Bill> bills = dao.getFamilyBills(1);
		assertEquals(2, bills.size());
	}

	@Test
	public void test_get_all_member_bills() { // test getMemberBills method
		List<Bill> bills = dao.getMemberBills(1);
		assertEquals(1, bills.size());
	}

}