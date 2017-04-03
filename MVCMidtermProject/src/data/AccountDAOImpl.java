package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import entities.Account;

public class AccountDAOImpl implements AccountDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Account getMemberAccount(int id) {
		TypedQuery query = em.createQuery("SELECT a FROM Account a WHERE " + "a.id = :id", Account.class);

		return (Account) query.setParameter("id", id).getSingleResult();

	}

	@Override
	public Account setBankAccount(Account account) {
		Account acc = em.find(Account.class, account.getId());
		acc.setBankAccount(account.getBankAccount());
		acc.setFrugalSum(account.getFrugalSum());

		return acc;
	}

	@Override
	public Account setFrugalSum(Account a) {
		Account acc = em.find(Account.class, a.getId());

		acc.setBankAccount(a.getBankAccount());
		acc.setFrugalSum(a.getFrugalSum());
		return acc;

	}

}
