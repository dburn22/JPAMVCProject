package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import entities.Account;

public class AccountDAOImpl implements AccountDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Account getAccount(Account a) {
		em.getTransaction().begin();

		em.getTransaction().commit();
		return em.find(Account.class, a);

	}

	@Override
	public Account setBankAccount(Account a) {
		em.getTransaction().begin();

		if (a.getBankAccount() == null) {
			a.setBankAccount(null);
		} else {
			a.getBankAccount();
		}
		em.persist(a);
		em.getTransaction().commit();
		return a;

	}

	@Override
	public Account setFrugalSum(Account a) {
		em.getTransaction().begin();

		if (a.getFrugalSum() == null) {
			a.setFrugalSum(null);
		} else {
			a.getFrugalSum();
		}
		em.persist(a);
		em.getTransaction().commit();
		return a;

	}
}
