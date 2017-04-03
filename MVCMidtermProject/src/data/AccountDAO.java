package data;

import entities.Account;

public interface AccountDAO {
	public Account getMemberAccount(int id);
	public Account setBankAccount(Account a);
	public Account setFrugalSum(Account a);
}
